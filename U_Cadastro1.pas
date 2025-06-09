unit U_Cadastro1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, U_ConexaoFirebird,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TF_Cadastro1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    edCPF: TEdit;
    edEndereco: TEdit;
    edCidade: TEdit;
    cbEstado: TComboBox;
    Panel1: TPanel;
    sbConfirmar: TSpeedButton;
    sbCancelar: TSpeedButton;
    FDQuery1: TFDQuery;
    procedure sbConfirmarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCodigoAtual: Integer;
    FMododeOperacao: String;
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarCliente(Codigo :Integer; Modo: String = 'ALTERAR');
  end;

var
  F_Cadastro1: TF_Cadastro1;

implementation

{$R *.dfm}

procedure TF_Cadastro1.CarregarCliente(Codigo: Integer; Modo: String = 'ALTERAR');
begin
  FCodigoAtual := Codigo;
  FMododeOperacao := UpperCase(Modo);
  if U_ConexaoFirebird.DataModule1.cdsClientes.Active then
  begin
    if U_ConexaoFirebird.DataModule1.cdsClientes.Locate('CODIGO', Codigo, []) then
    begin
      edCodigo.Text := IntToStr(Codigo);
      edNome.Text := U_ConexaoFirebird.DataModule1.cdsClientes.FieldByName('NOME').AsString;
      edCPF.Text := U_ConexaoFirebird.DataModule1.cdsClientes.FieldByName('CPF').AsString;
      edEndereco.Text := U_ConexaoFirebird.DataModule1.cdsClientes.FieldByName('ENDERECO').AsString;
      edCidade.Text := U_ConexaoFirebird.DataModule1.cdsClientes.FieldByName('CIDADE').AsString;
      cbEstado.Text := U_ConexaoFirebird.DataModule1.cdsClientes.FieldByName('ESTADO').AsString;
    end
    else
    begin
      ModalResult := mrCancel;
    end;
  end
  else
  begin
    ModalResult := mrCancel;
  end;
end;

procedure TF_Cadastro1.FormCreate(Sender: TObject);
begin
  FCodigoAtual := 0;
  FMododeOperacao := 'INCLUIR';
end;

procedure TF_Cadastro1.FormShow(Sender: TObject);
begin
  if FMododeOperacao = 'INCLUIR' then
  begin
    edCodigo.Text := '';
    edNome.Text := '';
    edCPF.Text := '';
    edEndereco.Text := '';
    edCidade.Text := '';
    cbEstado.Text := '';
    edCodigo.Enabled := False;
    edNome.Enabled := True;
    edCPF.Enabled := True;
    edEndereco.Enabled := True;
    edCidade.Enabled := True;
    cbEstado.Enabled := True;
    sbConfirmar.Caption := 'Incluir';
  end
  else if FMododeOperacao = 'ALTERAR' then
  begin
    edCodigo.Enabled := False;
    edNome.Enabled := True;
    edCPF.Enabled := True;
    edEndereco.Enabled := True;
    edCidade.Enabled := True;
    cbEstado.Enabled := True;
    sbConfirmar.Caption := 'Confirmar Alteração';
  end
  else if FMododeOperacao = 'EXCLUIR' then
  begin
    edCodigo.Enabled := False;
    edNome.Enabled := False;
    edCPF.Enabled := False;
    edEndereco.Enabled := False;
    edCidade.Enabled := False;
    cbEstado.Enabled := False;
    sbConfirmar.Caption := 'Confirmar Exclusão';
  end;
end;


procedure TF_Cadastro1.sbCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TF_Cadastro1.sbConfirmarClick(Sender: TObject);
var
  qryAction: TFDQuery;
  qryVerificarCPF: TFDQuery;
  SQLText: string;
begin
  sbConfirmar.Enabled := false;
  sbCancelar.Enabled := false;

  qryAction := TFDQuery.Create(nil);
  qryVerificarCPF :=  TFDQuery.Create(nil);
  try
    qryAction.Connection := U_ConexaoFirebird.DataModule1.FDConnection1;
    qryVerificarCPF.Connection := U_ConexaoFirebird.DataModule1.FDConnection1;

    if FMododeOperacao = 'INCLUIR' then
    begin

      SQLText := 'SELECT COUNT(*) FROM CLIENTES WHERE CPF = :CPF';
      qryVerificarCPF.SQL.Text := SQLText;
      qryVerificarCPF.ParamByName('CPF').AsString := edCPF.Text;
      qryVerificarCPF.Open;

      if qryVerificarCPF.Fields[0].AsInteger > 0 then
      begin
        ShowMessage('Erro: Já existe um cliente cadastrado com este CPF.');
        ModalResult := mrCancel;
        Exit;
      end;

      SQLText := 'INSERT INTO CLIENTES (NOME, CPF, ENDERECO, CIDADE, ESTADO) ' +
                 'VALUES (:NOME, :CPF, :ENDERECO, :CIDADE, :ESTADO) ' +
                 'RETURNING CODIGO';
      qryAction.SQL.Text := SQLText;

      qryAction.ParamByName('NOME').AsString := edNome.Text;
      qryAction.ParamByName('CPF').AsString := edCPF.Text;
      qryAction.ParamByName('ENDERECO').AsString := edEndereco.Text;
      qryAction.ParamByName('CIDADE').AsString := edCidade.Text;
      qryAction.ParamByName('ESTADO').AsString := cbEstado.Text;

      qryAction.Open;

      if qryAction.FieldDefs.Find('CODIGO') <> nil then
      begin
        FCodigoAtual := qryAction.FieldByName('CODIGO').AsInteger;
        edCodigo.Text := IntToStr(FCodigoAtual);
        ModalResult := mrOk;
      end
      else
      begin
        ModalResult := mrCancel;
      end;
    end
    else if FMododeOperacao = 'ALTERAR' then
    begin
      SQLText := 'UPDATE CLIENTES SET ' +
                 'NOME = :NOME, ' +
                 'CPF = :CPF, ' +
                 'ENDERECO = :ENDERECO, ' +
                 'CIDADE = :CIDADE, ' +
                 'ESTADO = :ESTADO ' +
                 'WHERE CODIGO = :CODIGO';
      qryAction.SQL.Text := SQLText;

      qryAction.ParamByName('NOME').AsString := edNome.Text;
      qryAction.ParamByName('CPF').AsString := edCPF.Text;
      qryAction.ParamByName('ENDERECO').AsString := edEndereco.Text;
      qryAction.ParamByName('CIDADE').AsString := edCidade.Text;
      qryAction.ParamByName('ESTADO').AsString := cbEstado.Text;
      qryAction.ParamByName('CODIGO').AsInteger := FCodigoAtual;

      qryAction.ExecSQL;

      if qryAction.RowsAffected > 0 then
      begin
        ModalResult := mrOk;
      end
      else
      begin
        ModalResult := mrCancel;
      end;
    end
    else if FMododeOperacao = 'EXCLUIR' then
    begin
      if MessageDlg('Tem certeza que deseja EXCLUIR o cliente (Código: ' + IntToStr(FCodigoAtual) + ')?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
        ModalResult := mrCancel;
        Exit;
      end;

      SQLText := 'DELETE FROM CLIENTES WHERE CODIGO = :CODIGO';
      qryAction.SQL.Text := SQLText;
      qryAction.ParamByName('CODIGO').AsInteger := FCodigoAtual;

      qryAction.ExecSQL;

      if qryAction.RowsAffected > 0 then
      begin
        ModalResult := mrOk;
      end
      else
      begin
        ModalResult := mrCancel;
      end;
    end
    else
    begin
      ModalResult := mrCancel;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro na operação: ' + E.Message);
      ModalResult := mrCancel;
    end;
  end;
  qryAction.Free;
  sbConfirmar.Enabled := true;
  sbCancelar.Enabled := true;
end;

end.
