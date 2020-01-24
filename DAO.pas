unit DAO;

interface

uses
  SysUtils, Classes, DB, DBTables, DBClient, Provider, ImgList, Controls;

type
  Tdm = class(TDataModule)
    dbLogin: TDatabase;
    QUsuario: TQuery;
    PUsuario: TDataSetProvider;
    MUsuario: TClientDataSet;
    QAux: TQuery;
    img: TImageList;
    QInterface: TQuery;
    QInterfaceidInterface: TIntegerField;
    QInterfacenome: TStringField;
    QInterfacelabel: TStringField;
    QUsuarioidUsuario: TIntegerField;
    QUsuarionome: TStringField;
    QUsuariosenha: TStringField;
    QUsuariocorInterface: TStringField;
    QUsuariocorEditDesabilidato: TStringField;
    QUsuariocorEditFundo: TStringField;
    QUsuariocorBarraPrincipal: TStringField;
    QUsuariocorTelaFundoPrincipal: TStringField;
    PInterface: TDataSetProvider;
    MInterface: TClientDataSet;
    MUsuarioidUsuario: TIntegerField;
    MUsuarionome: TStringField;
    MUsuariosenha: TStringField;
    MUsuariocorInterface: TStringField;
    MUsuariocorEditDesabilidato: TStringField;
    MUsuariocorEditFundo: TStringField;
    MUsuariocorBarraPrincipal: TStringField;
    MUsuariocorTelaFundoPrincipal: TStringField;
    MInterfaceidInterface: TIntegerField;
    MInterfacenome: TStringField;
    MInterfacelabel: TStringField;
    QInterfaceUsu: TQuery;
    QInterfaceUsuidInterface: TIntegerField;
    QInterfaceUsualterar: TBooleanField;
    QInterfaceUsudeletar: TBooleanField;
    QInterfaceUsuinserir: TBooleanField;
    QInterfaceUsupesquisar: TBooleanField;
    QUsuariologin: TStringField;
    MUsuariologin: TStringField;
    QItem: TQuery;
    PItem: TDataSetProvider;
    QItemidItem: TIntegerField;
    QItemnome: TStringField;
    QItemvalorCompra: TFloatField;
    QItemvalorVenda: TFloatField;
    MItem: TClientDataSet;
    MItemidItem: TIntegerField;
    MItemnome: TStringField;
    MItemvalorCompra: TFloatField;
    MItemvalorVenda: TFloatField;
    MItemcodBarraP: TIntegerField;
    QAmbiente: TQuery;
    QAmbienteidAmbiente: TIntegerField;
    QAmbientenome: TStringField;
    QAmbientemesa: TIntegerField;
    PAmbiente: TDataSetProvider;
    MAmbiente: TClientDataSet;
    MAmbienteidAmbiente: TIntegerField;
    MAmbientenome: TStringField;
    MAmbientemesa: TIntegerField;
    QCategoria: TQuery;
    QCategoriaidCategoria: TIntegerField;
    QCategorianome: TStringField;
    PCategoria: TDataSetProvider;
    MCategoria: TClientDataSet;
    MCategoriaidCategoria: TIntegerField;
    MCategorianome: TStringField;
    QAux2: TQuery;
    QGarcon: TQuery;
    MGarcon: TClientDataSet;
    PGarcon: TDataSetProvider;
    QItemqtd: TIntegerField;
    MItemqtd: TIntegerField;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1idProduto: TIntegerField;
    ClientDataSet1nomeProduto: TStringField;
    ClientDataSet1valorProduto: TFloatField;
    ClientDataSet2: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    ClientDataSet3: TClientDataSet;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    FloatField2: TFloatField;
    ClientDataSet4: TClientDataSet;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    FloatField3: TFloatField;
    ClientDataSet5: TClientDataSet;
    IntegerField4: TIntegerField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    QGarconidGarcom: TIntegerField;
    QGarconnome: TStringField;
    QGarcondataNasc: TDateTimeField;
    QGarconcodBarra: TIntegerField;
    QGarconcomissao: TFloatField;
    MGarconidGarcom: TIntegerField;
    MGarconnome: TStringField;
    MGarcondataNasc: TDateTimeField;
    MGarconcodBarra: TIntegerField;
    MGarconcomissao: TFloatField;
    QResumo: TQuery;
    Qrelatorio: TQuery;
    Qrelatoriodata: TDateTimeField;
    Qrelatoriomesa: TIntegerField;
    Qrelatorioqtd: TIntegerField;
    Qrelatorionome: TStringField;
    QComissao: TQuery;
    QComissaodata: TDateTimeField;
    QComissaonome: TStringField;
    QComissaoComissao: TFloatField;
    QItemcodBarraP: TIntegerField;
    procedure MUsuarioAfterPost(DataSet: TDataSet);
    procedure MUsuarioAfterCancel(DataSet: TDataSet);
    procedure MUsuarioAfterDelete(DataSet: TDataSet);
    procedure MUsuarioAfterInsert(DataSet: TDataSet);
    procedure MInterfaceAfterCancel(DataSet: TDataSet);
    procedure MInterfaceAfterPost(DataSet: TDataSet);
    procedure MInterfaceAfterDelete(DataSet: TDataSet);
    procedure MInterfaceAfterInsert(DataSet: TDataSet);
    procedure MUsuarioBeforeDelete(DataSet: TDataSet);
    procedure MUsuarioAfterScroll(DataSet: TDataSet);
    procedure MItemAfterPost(DataSet: TDataSet);
    procedure MItemAfterCancel(DataSet: TDataSet);
    procedure MItemAfterDelete(DataSet: TDataSet);
    procedure MAmbienteAfterPost(DataSet: TDataSet);
    procedure MAmbienteAfterDelete(DataSet: TDataSet);
    procedure MAmbienteAfterCancel(DataSet: TDataSet);
    procedure MCategoriaAfterCancel(DataSet: TDataSet);
    procedure MCategoriaAfterPost(DataSet: TDataSet);
    procedure MCategoriaAfterDelete(DataSet: TDataSet);
    procedure MCategoriaAfterInsert(DataSet: TDataSet);
    procedure MAmbienteAfterInsert(DataSet: TDataSet);
    procedure MItemAfterInsert(DataSet: TDataSet);
    procedure MGarconAfterInsert(DataSet: TDataSet);
    procedure MGarconAfterCancel(DataSet: TDataSet);
    procedure MGarconAfterPost(DataSet: TDataSet);
    procedure MGarconAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.MUsuarioAfterPost(DataSet: TDataSet);
begin
   MUsuario.ApplyUpdates(-1);
end;

procedure Tdm.MUsuarioAfterCancel(DataSet: TDataSet);
begin
   MUsuario.CancelUpdates;
end;

procedure Tdm.MUsuarioAfterDelete(DataSet: TDataSet);
begin
   MUsuario.ApplyUpdates(-1);
end;

procedure Tdm.MUsuarioAfterInsert(DataSet: TDataSet);
var cod : integer;
begin
     QAux.SQL.Text := 'select valor from parametro where parametro = :p';
     qaux.ParamByName('p').AsString := 'seqUsuario';
     qaux.Open;
     cod := strtoint(trim(qaux.Fields[0].Asstring))+1;
     MUsuarioidUsuario.AsInteger := cod;

     qaux.SQL.text := 'update parametro set valor = :v where parametro = :p';
     qaux.ParamByName('v').asstring :=  inttostr(cod);
     qaux.ParamByName('p').AsString := 'seqUsuario';
     qaux.ExecSQL;
end;

procedure Tdm.MInterfaceAfterCancel(DataSet: TDataSet);
begin
   MInterface.CancelUpdates;
end;

procedure Tdm.MInterfaceAfterPost(DataSet: TDataSet);
begin
  MInterface.ApplyUpdates(-1);
end;

procedure Tdm.MInterfaceAfterDelete(DataSet: TDataSet);
begin
   MInterface.ApplyUpdates(-1);
end;

procedure Tdm.MInterfaceAfterInsert(DataSet: TDataSet);
var cod : integer;
begin
     QAux.SQL.Text := 'select valor from parametro where parametro = :p';
     qaux.ParamByName('p').AsString := 'seqInterface';
     qaux.Open;
     cod := strtoint(trim(qaux.Fields[0].Asstring))+1;
     MInterfaceidInterface.AsInteger := cod;

     qaux.SQL.text := 'update parametro set valor = :v where parametro = :p';
     qaux.ParamByName('v').asstring :=  inttostr(cod);
     qaux.ParamByName('p').AsString := 'seqInterface';
     qaux.ExecSQL;
end;

procedure Tdm.MUsuarioBeforeDelete(DataSet: TDataSet);
begin
   QAux.close;
   QAux.SQL.Text := 'DELETE FROM Usuario_Interface WHERE idUsuario = :parametro';
   QAux.ParamByName('parametro').asinteger := MUsuarioidUsuario.AsInteger;
   QAux.ExecSQL;
end;

procedure Tdm.MUsuarioAfterScroll(DataSet: TDataSet);
begin
   QInterfaceUsu.close;
   QInterfaceUsu.SQL.text := 'select idInterface, alterar,deletar,inserir,pesquisar from Usuario_Interface where idUsuario =:id';
   QInterfaceUsu.ParamByName('id').asinteger := MUsuarioidUsuario.AsInteger;
   QInterfaceUsu.Open;
end;

procedure Tdm.MItemAfterPost(DataSet: TDataSet);
begin
  MItem.ApplyUpdates(-1);
end;

procedure Tdm.MItemAfterCancel(DataSet: TDataSet);
begin
  MItem.CancelUpdates;
end;

procedure Tdm.MItemAfterDelete(DataSet: TDataSet);
begin
  MItem.ApplyUpdates(-1);
end;

procedure Tdm.MAmbienteAfterPost(DataSet: TDataSet);
begin
  MAmbiente.ApplyUpdates(-1);
end;

procedure Tdm.MAmbienteAfterDelete(DataSet: TDataSet);
begin
  MAmbiente.CancelUpdates;
end;

procedure Tdm.MAmbienteAfterCancel(DataSet: TDataSet);
begin
  MAmbiente.ApplyUpdates(-1);
end;

procedure Tdm.MCategoriaAfterCancel(DataSet: TDataSet);
begin
  MCategoria.CancelUpdates;
end;

procedure Tdm.MCategoriaAfterPost(DataSet: TDataSet);
begin
  MCategoria.ApplyUpdates(-1);
end;

procedure Tdm.MCategoriaAfterDelete(DataSet: TDataSet);
begin
  MCategoria.ApplyUpdates(-1);
end;

procedure Tdm.MCategoriaAfterInsert(DataSet: TDataSet);
var cod : integer;
begin
     QAux.SQL.Text := 'select valor from parametro where parametro = :p';
     qaux.ParamByName('p').AsString := 'seqCategoria';
     qaux.Open;
     cod := strtoint(trim(qaux.Fields[0].Asstring))+1;
     MCategoriaidCategoria.AsInteger := cod;

     qaux.SQL.text := 'update parametro set valor = :v where parametro = :p';
     qaux.ParamByName('v').asstring :=  inttostr(cod);
     qaux.ParamByName('p').AsString := 'seqCategoria';
     qaux.ExecSQL;
end;
procedure Tdm.MAmbienteAfterInsert(DataSet: TDataSet);
var cod : integer;
begin
     QAux.SQL.Text := 'select valor from parametro where parametro = :p';
     qaux.ParamByName('p').AsString := 'seqAmbiente';
     qaux.Open;
     cod := strtoint(trim(qaux.Fields[0].Asstring))+1;
     MAmbienteidAmbiente.AsInteger := cod;

     qaux.SQL.text := 'update parametro set valor = :v where parametro = :p';
     qaux.ParamByName('v').asstring :=  inttostr(cod);
     qaux.ParamByName('p').AsString := 'seqAmbiente';
     qaux.ExecSQL;
end;
procedure Tdm.MItemAfterInsert(DataSet: TDataSet);
var cod : integer;
begin
     QAux.SQL.Text := 'select valor from parametro where parametro = :p';
     qaux.ParamByName('p').AsString := 'seqItem';
     qaux.Open;
     cod := strtoint(trim(qaux.Fields[0].Asstring))+1;
     MItemidItem.AsInteger := cod;

     qaux.SQL.text := 'update parametro set valor = :v where parametro = :p';
     qaux.ParamByName('v').asstring :=  inttostr(cod);
     qaux.ParamByName('p').AsString := 'seqItem';
     qaux.ExecSQL;
end;

procedure Tdm.MGarconAfterInsert(DataSet: TDataSet);
var cod : integer;
begin
     QAux.SQL.Text := 'select valor from parametro where parametro = :p';
     qaux.ParamByName('p').AsString := 'seqGarcom';
     qaux.Open;
     cod := strtoint(trim(qaux.Fields[0].Asstring))+1;
     MGarconidGarcom.AsInteger := cod;

     qaux.SQL.text := 'update parametro set valor = :v where parametro = :p';
     qaux.ParamByName('v').asstring :=  inttostr(cod);
     qaux.ParamByName('p').AsString := 'seqGarcom';
     qaux.ExecSQL;
end;

procedure Tdm.MGarconAfterCancel(DataSet: TDataSet);
begin
    MGarcon.CancelUpdates;
end;

procedure Tdm.MGarconAfterPost(DataSet: TDataSet);
begin
    MGarcon.ApplyUpdates(-1);
end;

procedure Tdm.MGarconAfterDelete(DataSet: TDataSet);
begin
    MGarcon.ApplyUpdates(-1);
end;

end.
