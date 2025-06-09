unit U_Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, U_Cadastro1, Vcl.StdCtrls, U_Opcoes;

type
  TF_Cadastro = class(TForm)
    Panel1: TPanel;
    sbAtualizar: TSpeedButton;
    DBGrid1: TDBGrid;
    sbIncluir: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbAlterar: TSpeedButton;
    Panel2: TPanel;
    Label2: TLabel;
    edNome: TEdit;
    Label3: TLabel;
    edCPF: TEdit;
    sbLimparFiltros: TSpeedButton;
    sbRelatorio: TSpeedButton;
    procedure sbAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbIncluirClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbLimparFiltrosClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure sbRelatorioClick(Sender: TObject);
  private
    FBaseSQL: String;
    procedure CarregarSQL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cadastro: TF_Cadastro;

implementation

uses U_ConexaoFirebird, U_ImpressaoClientes;

{$R *.dfm}

procedure TF_Cadastro.CarregarSQL;
begin
  FBaseSQL := 'SELECT CODIGO, NOME, CPF, ENDERECO, CIDADE, ESTADO FROM CLIENTES';
end;

procedure TF_Cadastro.DBGrid1DblClick(Sender: TObject);
var
  ClienteSelecionado: Integer;
  NomeDoCliente: String;
  FormOpcoes: TF_Opcoes;
begin
  ClienteSelecionado := U_ConexaoFirebird.DataModule1.cdsClientes.FieldByName('CODIGO').AsInteger;
  NomeDoCliente := U_ConexaoFirebird.DataModule1.cdsClientes.FieldByName('NOME').AsString;

  FormOpcoes := TF_Opcoes.Create(Self);
  try
    FormOpcoes.SetMessage('O que deseja fazer com o cliente "' + NomeDoCliente + '" (Código: ' + IntToStr(ClienteSelecionado) + ')?');
    case FormOpcoes.ShowModal of
      mrYes:
        begin
          sbAlterarClick(nil);
        end;
      mrNo:
        begin
          sbExcluirClick(nil);
        end;
      mrCancel:
        begin
          ShowMessage('Operação cancelada pelo usuário.');
        end;
    end;
  finally
    FormOpcoes.Free;
  end;
end;

procedure TF_Cadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if U_ConexaoFirebird.DataModule1.cdsClientes.Active then
    U_ConexaoFirebird.DataModule1.cdsClientes.Close;
  if U_ConexaoFirebird.DataModule1.qryClientes.Active then
    U_ConexaoFirebird.DataModule1.qryClientes.Close;
end;

procedure TF_Cadastro.FormCreate(Sender: TObject);
begin
  if not U_ConexaoFirebird.DataModule1.FDConnection1.Connected then
    U_ConexaoFirebird.DataModule1.FDConnection1.Connected := True;

  CarregarSQL;
  U_ConexaoFirebird.DataModule1.qryClientes.SQL.Text := FBaseSQL;
  U_ConexaoFirebird.DataModule1.cdsClientes.Open;
end;

procedure TF_Cadastro.sbAlterarClick(Sender: TObject);
var
  FormCadastro: TF_Cadastro1;
  ClienteSelecionado: Integer;
begin
  ClienteSelecionado := U_ConexaoFirebird.DataModule1.cdsClientes.FieldByName('CODIGO').AsInteger;
  FormCadastro := TF_Cadastro1.Create(Self);
  try
    FormCadastro.Caption := 'Alterar Cliente';
    FormCadastro.CarregarCliente(ClienteSelecionado);

    if FormCadastro.ShowModal = mrOk then
    begin
      U_ConexaoFirebird.DataModule1.cdsClientes.Refresh;
      ShowMessage('Cliente alterado com sucesso!');
    end
    else
    begin
      ShowMessage('Alteração cancelada.');
    end;
  finally
    FormCadastro.Free;
  end;
end;

procedure TF_Cadastro.sbAtualizarClick(Sender: TObject);
var
  SQLFilter: String;
  HasFilter: Boolean;
begin
  SQLFilter := '';
  HasFilter := False;

  if (Trim(edNome.Text) <> '') or (Trim(edCPF.Text) <> '') then
    HasFilter := True;

  U_ConexaoFirebird.DataModule1.qryClientes.SQL.Text := FBaseSQL;

  if HasFilter then
  begin
    if Trim(edNome.Text) <> '' then
    begin
      SQLFilter := SQLFilter + ' WHERE NOME CONTAINING :NOME_FILTRO';
    end;

    if Trim(edCPF.Text) <> '' then
    begin
      if Trim(edNome.Text) <> '' then
        SQLFilter := SQLFilter + ' AND CPF CONTAINING :CPF_FILTRO'
      else
        SQLFilter := SQLFilter + ' WHERE CPF CONTAINING :CPF_FILTRO';
    end;
    U_ConexaoFirebird.DataModule1.qryClientes.SQL.Text := FBaseSQL + SQLFilter;

    U_ConexaoFirebird.DataModule1.cdsClientes.Close;
    U_ConexaoFirebird.DataModule1.qryClientes.Close;

    if Trim(edNome.Text) <> '' then
      U_ConexaoFirebird.DataModule1.qryClientes.ParamByName('NOME_FILTRO').AsString := Trim(edNome.Text);

    if Trim(edCPF.Text) <> '' then
      U_ConexaoFirebird.DataModule1.qryClientes.ParamByName('CPF_FILTRO').AsString := Trim(edCPF.Text);

    U_ConexaoFirebird.DataModule1.qryClientes.Open;
    U_ConexaoFirebird.DataModule1.cdsClientes.Open;
  end
  else
  begin
    U_ConexaoFirebird.DataModule1.qryClientes.SQL.Text := FBaseSQL;
    if not U_ConexaoFirebird.DataModule1.cdsClientes.Active then
      U_ConexaoFirebird.DataModule1.cdsClientes.Open
    else
      U_ConexaoFirebird.DataModule1.cdsClientes.Refresh;
  end;
end;

procedure TF_Cadastro.sbExcluirClick(Sender: TObject);
var
  FormCadastro: TF_Cadastro1;
  ClienteSelecionado: Integer;
begin
  ClienteSelecionado := U_ConexaoFirebird.DataModule1.cdsClientes.FieldByName('CODIGO').AsInteger;

  FormCadastro := TF_Cadastro1.Create(Self);
  try
    FormCadastro.Caption := 'Excluir Cliente';
    FormCadastro.CarregarCliente(ClienteSelecionado, 'EXCLUIR');
    if FormCadastro.ShowModal = mrOk then
    begin
      U_ConexaoFirebird.DataModule1.cdsClientes.Refresh;
      ShowMessage('Cliente excluído com sucesso!');
    end
    else
    begin
      ShowMessage('Exclusão cancelada.');
    end;
  finally
    FormCadastro.Free;
  end;
end;

procedure TF_Cadastro.sbIncluirClick(Sender: TObject);
var
  FormCadastro: TF_Cadastro1;
begin
  FormCadastro := TF_Cadastro1.Create(Self);
  try
    FormCadastro.Caption := 'Incluir Novo Cliente';

    if FormCadastro.ShowModal = mrOk then
    begin
      U_ConexaoFirebird.DataModule1.cdsClientes.Refresh;
      ShowMessage('Cliente incluído com sucesso!');
    end
    else
    begin
      ShowMessage('Inclusão cancelada.');
    end;
  finally
    FormCadastro.Free;
  end;
end;

procedure TF_Cadastro.sbLimparFiltrosClick(Sender: TObject);
begin
  edNome.Text := '';
  edCPF.Text := '';
end;

procedure TF_Cadastro.sbRelatorioClick(Sender: TObject);
begin
  F_ImpressaoClientes.Relatorioclientes.Preview();
end;

end.
