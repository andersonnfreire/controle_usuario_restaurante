unit UItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, Grids, DBGrids, StdCtrls, ComCtrls, ToolWin,dao,
  Mask, DBCtrls;

type
  TFItem = class(TFPadrao)
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
    cmbCategoria: TComboBox;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    procedure cmbCategoriaEnter(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
  private
    { Private declarations }
    procedure salvarCategoriaItem;
  public
    { Public declarations }
  end;

var
  FItem: TFItem;

implementation

{$R *.dfm}
procedure TFItem.cmbCategoriaEnter(Sender: TObject);
begin
  inherited;
  cmbCategoria.Items.Clear;
  dm.QCategoria.Close;
  dm.QCategoria.open;
  while not dm.QCategoria.Eof do
  begin
    cmbCategoria.Items.AddObject(dm.QCategorianome.AsString,TObject(dm.QCategoriaidCategoria.AsInteger));
    dm.QCategoria.Next;
  end;
end;

procedure TFItem.btSalvarClick(Sender: TObject);
begin
  inherited;
  salvarCategoriaItem;
end;

procedure TFItem.salvarCategoriaItem;
var
  erro: Boolean;
begin
 if cmbCategoria.items[cmbCategoria.ItemIndex] <> '' then
   begin
      dm.QAux.Close;
      dm.QAux.SQL.Text := 'select idItem,idCategoria from Item_Categoria where idItem =:id and idCategoria =:idC';
      dm.QAux.ParamByName('id').AsInteger := dm.MItemidItem.AsInteger;
      dm.QAux.ParamByName('idC').AsInteger := Integer(cmbCategoria.Items.Objects[cmbCategoria.ItemIndex]);
      dm.QAux.Open;
      dm.QAux.RecordCount;

      if dm.QAux.RecordCount > 0 then
      begin
        ShowMessage('Erro: O ITEM já possui uma categoria!');
        Abort;
      end
   else
     begin
        dm.QAux.close;
        dm.QAux.Open;
        dm.QAux.SQL.Text := 'insert into Item_Categoria values (:idItem,:idCategoria)';
        dm.QAux.ParamByName('idItem').AsInteger := dm.MItemidItem.AsInteger;
        dm.QAux.ParamByName('idCategoria').AsInteger := Integer(cmbCategoria.Items.Objects[cmbCategoria.ItemIndex]);
        dm.QAux.ExecSQL;
        ShowMessage('Cadastro INSERIDO com sucesso');
     end;
    end
    else
    begin
      ShowMessage('Erro: Não foi escolhida nenhuma categoria');
      Abort;
    end;
end;

procedure TFItem.btNovoClick(Sender: TObject);
begin
  inherited;
  dm.MItemqtd.AsInteger := 0;
  //dm.MItemcodBarraP.AsInteger := 0;
end;

Initialization
  RegisterClass(TFItem);

Finalization
  UnRegisterClass(TFItem);
end.
