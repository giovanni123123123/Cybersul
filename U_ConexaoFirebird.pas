unit U_ConexaoFirebird;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.Provider, Datasnap.DBClient;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qryClientes: TFDQuery;
    cdsClientes: TClientDataSet;
    dspClientes: TDataSetProvider;
    dsClientes: TDataSource;
    cdsClientesCODIGO: TIntegerField;
    cdsClientesNOME: TWideStringField;
    cdsClientesCPF: TWideStringField;
    cdsClientesENDERECO: TWideStringField;
    cdsClientesCIDADE: TWideStringField;
    cdsClientesESTADO: TWideStringField;
    FDUpdateSQL1: TFDUpdateSQL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
