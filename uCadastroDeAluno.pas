unit uCadastroDeAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  Datasnap.Provider, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    Connection: TADOConnection;
    Query: TADOQuery;
    DataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    ClientDataSetidAluno: TAutoIncField;
    ClientDataSetnome: TStringField;
    ClientDataSetcidade: TStringField;
    ClientDataSetestado: TStringField;
    ClientDataSetdataNascimento: TDateTimeField;
    ClientDataSetcpf: TStringField;
    ClientDataSetsexo: TStringField;
    ClientDataSetnecessidadesEspeciais: TBooleanField;
    ClientDataSetobservacao: TMemoField;
    procedure ClientDataSetAfterPost(DataSet: TDataSet);
    procedure ClientDataSetAfterDelete(DataSet: TDataSet);
    procedure ClientDataSetAfterCancel(DataSet: TDataSet);
    procedure ClientDataSetAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ClientDataSetAfterCancel(DataSet: TDataSet);
begin
    ClientDataSet.Cancel;
end;

procedure TForm1.ClientDataSetAfterDelete(DataSet: TDataSet);
begin
   ClientDataSet.ApplyUpdates(-1);
end;

procedure TForm1.ClientDataSetAfterInsert(DataSet: TDataSet);
begin
   ClientDataSetdataNascimento.AsDateTime = Date();
   ClientDataSetnecessidadesEspeciais.AsBoolean = false;
   ClientDataSetcidade.AsString = 'Colatina';
   ClientDataSetestado.AsString = 'ES';
end;

procedure TForm1.ClientDataSetAfterPost(DataSet: TDataSet);
begin
   ClientDataSet.ApplyUpdates(-1);
end;

end.
