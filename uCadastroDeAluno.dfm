object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 434
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Connection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Init' +
      'ial Catalog=db_Aluno_2;Data Source=DBRAG-PC;Initial File Name=""' +
      ';Server SPN="";password="123456"'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 176
    Top = 48
  end
  object Query: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Aluno')
    Left = 232
    Top = 48
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 472
    Top = 48
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    AfterInsert = ClientDataSetAfterInsert
    AfterPost = ClientDataSetAfterPost
    AfterCancel = ClientDataSetAfterCancel
    AfterDelete = ClientDataSetAfterDelete
    Left = 384
    Top = 48
    object ClientDataSetidAluno: TAutoIncField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'idAluno'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ClientDataSetnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object ClientDataSetcidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object ClientDataSetestado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object ClientDataSetdataNascimento: TDateTimeField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'dataNascimento'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/00;1;_'
    end
    object ClientDataSetcpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'cpf'
      ProviderFlags = [pfInUpdate]
      EditMask = '999.999.999-99;1;_'
      Size = 15
    end
    object ClientDataSetsexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'sexo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object ClientDataSetnecessidadesEspeciais: TBooleanField
      DisplayLabel = 'Necessidades Especiais'
      FieldName = 'necessidadesEspeciais'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSetobservacao: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'observacao'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
  end
  object DataSetProvider: TDataSetProvider
    DataSet = Query
    Left = 304
    Top = 48
  end
end
