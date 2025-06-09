unit U_ImpressaoClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLFilters, RLPDFFilter,
  RLXLSXFilter;

type
  TF_ImpressaoClientes = class(TForm)
    Relatorioclientes: TRLReport;
    rl_cabecalho: TRLBand;
    rl_colunas: TRLBand;
    rl_detail: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSXFilter1: TRLXLSXFilter;
  private

    { Private declarations }
  public
    { Public declarations }

  end;

var
  F_ImpressaoClientes: TF_ImpressaoClientes;

implementation

{$R *.dfm}

Uses U_ConexaoFirebird, U_Cadastro;

end.
