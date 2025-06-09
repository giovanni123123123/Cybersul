program ProjetoTesteCyberSul;

uses
  Vcl.Forms,
  U_Cadastro in 'U_Cadastro.pas' {Form1},
  U_Cadastro1 in 'U_Cadastro1.pas' {F_Cadastro1},
  U_ConexaoFirebird in 'U_ConexaoFirebird.pas' {DataModule1: TDataModule},
  U_Opcoes in 'U_Opcoes.pas' {F_Opcoes},
  U_ImpressaoClientes in 'U_ImpressaoClientes.pas' {F_ImpressaoClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TF_Cadastro, F_Cadastro);
  Application.CreateForm(TF_Opcoes, F_Opcoes);
  Application.CreateForm(TF_ImpressaoClientes, F_ImpressaoClientes);
  Application.Run;
end.
