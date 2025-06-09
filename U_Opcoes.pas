unit U_Opcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TF_Opcoes = class(TForm)
    lblMsg: TLabel;
    Panel1: TPanel;
    bAlterar: TButton;
    bExcluir: TButton;
    bCancelar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetMessage(const Msg: String);
  end;

var
  F_Opcoes: TF_Opcoes;

implementation

{$R *.dfm}

{ TF_Opcoes }

procedure TF_Opcoes.SetMessage(const Msg: String);
begin
  lblMsg.Caption := Msg;
end;

end.
