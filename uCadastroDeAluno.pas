unit uCadastroDeAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  Datasnap.Provider, Datasnap.DBClient, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

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
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    btNovo: TToolButton;
    btExcluir: TToolButton;
    btSalvar: TToolButton;
    btCancelar: TToolButton;
    btAlterar: TToolButton;
    btAnt: TToolButton;
    btProx: TToolButton;
    PCadastro: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    procedure ClientDataSetAfterPost(DataSet: TDataSet);
    procedure ClientDataSetAfterDelete(DataSet: TDataSet);
    procedure ClientDataSetAfterCancel(DataSet: TDataSet);
    procedure ClientDataSetAfterInsert(DataSet: TDataSet);
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btAntClick(Sender: TObject);
    procedure btProxClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure statusBarra(ds:TDataSet);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btAlterarClick(Sender: TObject);
begin
   ClientDataSet.Edit;
   statusBarra(ClientDataSet);
end;

procedure TForm1.btAntClick(Sender: TObject);
begin
    ClientDataSet.Prior;
end;

procedure TForm1.btCancelarClick(Sender: TObject);
begin
    ClientDataSet.Cancel;
    statusBarra(ClientDataSet);
end;

procedure TForm1.btExcluirClick(Sender: TObject);
begin
   if Application.MessageBox (PChar('Deseja Excluir o arquivo?'), 'Confirmação', MB_USEGLYPHCHARS + MB_DEFBUTTON2) = mrYes then
   begin
       ClientDataSet.Delete;
       statusBarra(ClientDataSet);
   end;

end;

procedure TForm1.btNovoClick(Sender: TObject);
begin
   ClientDataSet.Append;
   statusBarra(ClientDataSet);
   DBEdit2.SetFocus;
end;

procedure TForm1.btProxClick(Sender: TObject);
begin
   ClientDataSet.Next;
end;

procedure TForm1.btSalvarClick(Sender: TObject);
begin
   ClientDataSet.Post;

   Query.close;
   ClientDataSet.Close;
   ClientDataSet.Open;
   statusBarra(ClientDataSet);
end;

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
   ClientDataSetdataNascimento.AsDateTime := Date();
   ClientDataSetnecessidadesEspeciais.AsBoolean := false;
   ClientDataSetcidade.AsString := 'Colatina';
   ClientDataSetestado.AsString := 'ES';
end;

procedure TForm1.ClientDataSetAfterPost(DataSet: TDataSet);
begin
   ClientDataSet.ApplyUpdates(-1);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
    Query.Open;
    ClientDataSet.Open;
    statusBarra(ClientDataSet);
end;

procedure TForm1.statusBarra(ds: TDataSet);
begin
   btNovo.Enabled     := not(ds.State in [dsEdit, dsInsert]);
   btSalvar.Enabled   :=    (ds.State in [dsEdit, dsInsert]);
   btExcluir.Enabled  := not(ds.State in [dsEdit, dsInsert]) and not(ds.IsEmpty);
   btAlterar.Enabled  := not(ds.State in [dsEdit, dsInsert]) and not(ds.IsEmpty);;
   btCancelar.Enabled :=    (ds.State in [dsEdit, dsInsert]);
   btProx.Enabled     := not(ds.State in [dsEdit, dsInsert]) and not(ds.IsEmpty);
   btAnt.Enabled      := not(ds.State in [dsEdit, dsInsert]) and not(ds.IsEmpty);
   PCadastro.Enabled  :=    (ds.State in [dsEdit, dsInsert]);
end;

end.
