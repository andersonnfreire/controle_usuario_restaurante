unit UEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB,dao;

type
  TFEstoque = class(TForm)
    Edit1: TEdit;
    Panel1: TPanel;
    Image1: TImage;
    DataSource1: TDataSource;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    //procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstoque: TFEstoque;

implementation

{$R *.dfm}

procedure TFEstoque.Edit1KeyPress(Sender: TObject; var Key: Char);
var
valor: Integer;
begin
     if key = #13 then
     begin
     
         valor := StrToInt(Edit1.Text);

         dm.QAux.Close;
         dm.QAux.SQL.Text := 'SELECT i.codBarraP FROM Item as i where i.codBarraP =:valor';
         dm.QAux.ParamByName('valor').AsInteger := valor;
         dm.QAux.Open;

         if (dm.QAux.RecordCount > 0) then
         begin
           dm.QAux.Close;
           dm.QAux.SQL.Text := 'INSERT INTO Estoque values (:codProduto,:qtd)';
           dm.QAux.ParamByName('codProduto').AsInteger := valor ;
           dm.QAux.ParamByName('qtd').AsInteger    := 1;
           dm.QAux.ExecSQL;
           ShowMessage('+1 Quantidade!!');
           Edit1.Text:= '';
         end
         else
         begin
           ShowMessage('Não foi encontrado Produto !!');
           Edit1.Text:= '';
         end;
         abort;
     end;
end;

Initialization
  RegisterClass(TFEstoque);

Finalization
  UnRegisterClass(TFEstoque);
end.
