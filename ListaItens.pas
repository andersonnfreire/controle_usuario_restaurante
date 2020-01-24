unit ListaItens;

interface
uses Classes, Produto, Dialogs;

Type
 TListaItens = class
 private
 { private declarations }
  FListaItens : TList;
 protected
 { protected declarations }
 public
 constructor Create;
 procedure Adicionar(pItem: TProduto);
 procedure Remover(Index: Integer);
 function Count: Integer;
 function GetProduto(i:integer): TProduto;

 published
 { published declarations }
 end;


implementation

{ TListaItens }

constructor TListaItens.Create;
begin
  inherited Create;
  FListaItens := TList.Create;
end;

procedure TListaItens.Adicionar(pItem: TProduto);
begin
   FListaItens.Add(pItem);
end;

function TListaItens.Count: Integer;
begin
  Result := FListaItens.Count;
end;

procedure TListaItens.Remover(Index: Integer);
begin
  if Index < Count then
     FListaItens.Delete(Index)
  else
    ShowMessage('Item não encontrado!');

end;
function TListaItens.GetProduto(i: integer): TProduto;
begin
    GetProduto := TProduto(FListaItens.Items[i]);
end;

end.
