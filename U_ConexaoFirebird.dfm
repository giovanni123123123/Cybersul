object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\giova\OneDrive\Documentos\Embarcadero\Studio\P' +
        'rojects\ProjetoCyberSul\Dados\DADOSTESTECYBERSUL.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'DriverID=FB')
    Connected = True
    Left = 88
    Top = 64
  end
  object qryClientes: TFDQuery
    Connection = FDConnection1
    UpdateOptions.KeyFields = 'CODIGO'
    SQL.Strings = (
      'Select CODIGO, NOME, CPF, ENDERECO, CIDADE, ESTADO from CLIENTES')
    Left = 176
    Top = 64
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 264
    Top = 64
    object cdsClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsClientesNOME: TWideStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object cdsClientesCPF: TWideStringField
      FieldName = 'CPF'
      Required = True
      Size = 14
    end
    object cdsClientesENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 200
    end
    object cdsClientesCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 70
    end
    object cdsClientesESTADO: TWideStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = qryClientes
    Left = 344
    Top = 64
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 416
    Top = 64
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO CLIENTES (NOME, CPF, ENDERECO, CIDADE, ESTADO)'
      'VALUES (:NOME, :CPF, :ENDERECO, :CIDADE, :ESTADO)'
      'RETURNING CODIGO')
    ModifySQL.Strings = (
      'UPDATE CLIENTES'
      'SET NOME = :NEW_NOME'
      'WHERE CODIGO = :OLD_CODIGO'
      'RETURNING CODIGO')
    DeleteSQL.Strings = (
      'DELETE FROM CLIENTES'
      'WHERE CODIGO = :OLD_CODIGO')
    FetchRowSQL.Strings = (
      'SELECT CODIGO, NOME, CPF, ENDERECO, CIDADE, ESTADO'
      'FROM CLIENTES'
      'WHERE CODIGO = :OLD_CODIGO')
    Left = 176
    Top = 144
  end
end
