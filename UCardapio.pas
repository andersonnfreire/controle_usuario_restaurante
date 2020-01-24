unit UCardapio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids,dao, Spin, DB,
  DBClient, uRestaurante;
type
  TnomeValor = class (TLabel)

  private

  public
    valor:Double;//caso o clique for na imagem e passado o diretorio do album.
  end;
type
  TFCardapio = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    ds10: TDataSource;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure criarCardapio;
    procedure clickCardapio(Sender:TObject);
    procedure listaProdutos(Sender:TObject);
    procedure escolhendoProduto(idGarcom:Integer;idProduto:Integer;preco:Double;quantidade:Integer);
    procedure excluirComponente;
  public
    { Public declarations }
    procedure addlistaProdutos(idProduto: Integer;idGarcom:Integer; nome: String;valorTotal: Double;qtd:Integer;qtdEstoque:Integer);
  end;

var
  FCardapio: TFCardapio;
  ambienteSelecionado: TObject;

  categoria: TScrollBox;
  count: Integer;
  topPos:Integer;
  ladoEsquerdo: Integer = 0;
  qtdDesejado: Integer;
  lista:TStringList;
  nomeProduto:String;
  idProduto:Integer;
  preco:Double;
  codGarcom:Integer;
implementation

uses Math;

{$R *.dfm}

{ TFCardapio }



procedure TFCardapio.clickCardapio(Sender: TObject);
begin
  ambienteSelecionado := sender;
end;

procedure TFCardapio.criarCardapio;
var
  tab: TTabSheet;
  PageControl1: TPageControl;
  i,j: Integer;

  scrol:TScrollBox;
  nomeItem,valorItem:TLabel;
  qtdItem:TSpinEdit;
  nomeValor:TnomeValor;
  entrou: Boolean;
  palavra,subpalavra: string;
begin

  PageControl1 := TPageControl.Create(self);
  PageControl1.Parent := self;
  PageControl1.Height    := 400;
  PageControl1.Width     := 845;
  PageControl1.Top       := 57;
  PageControl1.Align     := alLeft;
  PageControl1.Name      := 'PageControl1';

  dm.QAux.Close;
  dm.QAux.SQl.Text := 'select ic.idItem as id,c.nome as n,i.nome as i, i.valorVenda as vv, i.qtd as qtd from Categoria c, Item i, Item_Categoria ic where c.idCategoria = ic.idCategoria and i.idItem = ic.idItem';
  dm.QAux.Open;
  for i := 0  to dm.QAux.RecordCount+1  do
  begin
      // Cria a Aba
     subpalavra      := dm.QAux.Fieldbyname('n').AsString;
     if CompareStr(palavra,subpalavra)=0 then // se a categoria for igual
     begin
        if count > 2 then
        begin
          TopPos := TopPos+140;
          ladoEsquerdo := 0;
          count :=  0;
        end;

        categoria             := TScrollBox.Create(scrol);
        categoria.Parent      := scrol;
        categoria.Top         := topPos+8;
        categoria.Left        := ladoEsquerdo + 10;
        categoria.Height      := 120;
        categoria.Width       := 120;
        ladoEsquerdo          := categoria.Left +categoria.Width + 10;
        categoria.Color       := clLime;
        categoria.OnClick     := listaProdutos;

        nomeItem              := TLabel.Create(categoria);
        nomeItem.Parent       := categoria;
        nomeItem.top          := 20;
        nomeItem.Left         := 20;
        nomeItem.Caption      := dm.QAux.Fieldbyname('i').AsString;
        nomeItem.Alignment    := tacenter;
        nomeItem.Tag         := dm.QAux.Fieldbyname('id').AsInteger;

        nomeValor              := TnomeValor.Create(categoria);
        nomeValor.Parent       := categoria;
        nomeValor.top          := 40;
        nomeValor.Left         := 20;
        nomeValor.Caption      := 'R$ '+dm.QAux.Fieldbyname('vv').AsString;
        nomeValor.Alignment    := tacenter;
        nomeValor.valor        := dm.QAux.Fieldbyname('vv').AsFloat;
        nomeValor.Enabled      := false;
        
        qtdItem                := TSpinEdit.Create(categoria);
        qtdItem.Parent         := categoria;
        qtdItem.Width          := 50;
        qtdItem.Left           := 20;
        qtdItem.top            := 60;
        qtdItem.Value          := dm.QAux.Fieldbyname('qtd').AsInteger;
        qtdItem.Enabled        := false;
        qtdItem.TabStop        := false;

        Count                     := Count + 1;
        entrou                    := true;
        dm.QAux.Next;
     end else  //se a categoria NÃO for igual
     begin
       if entrou = false then // verificar a posicao e criar nova categoria
       begin

         tab             := TTabSheet.Create(PageControl1);
         tab.PageControl := PageControl1;
         tab.Name        := 'Categoria'+IntToStr(i);
         tab.Caption     := dm.QAux.Fieldbyname('n').AsString;
         palavra         := dm.QAux.Fieldbyname('n').AsString;
         tab.ImageIndex  := i;
         tab.OnHide      := clickCardapio;

         scrol                  := TScrollBox.Create(tab);
         scrol.Parent           := tab;
         scrol.Height           := 400;
         scrol.Width            := 900;
         scrol.Top              := 121;
         scrol.Align            := alLeft;

          if count > 2 then
          begin
            TopPos := TopPos+140;
            ladoEsquerdo := 0;
            count :=  0;
          end;

          categoria             := TScrollBox.Create(scrol);
          categoria.Parent      := scrol;
          categoria.Top         := topPos+8;
          categoria.Left        := ladoEsquerdo + 10;
          categoria.Height      := 120;
          categoria.Width       := 120;
          ladoEsquerdo          := categoria.Left +categoria.Width + 10;
          categoria.Color       := clLime;
          categoria.OnClick     := listaProdutos;


          nomeItem              := TLabel.Create(categoria);
          nomeItem.Parent       := categoria;
          nomeItem.top          := 20;
          nomeItem.Left         := 20;
          nomeItem.Caption      := dm.QAux.Fieldbyname('i').AsString;
          nomeItem.Alignment    := tacenter;
          nomeItem.Tag         := dm.QAux.Fieldbyname('id').AsInteger;

          nomeValor              := TnomeValor.Create(categoria);
          nomeValor.Parent       := categoria;
          nomeValor.top          := 40;
          nomeValor.Left         := 20;
          nomeValor.Caption      := 'R$'+dm.QAux.Fieldbyname('vv').AsString;
          nomeValor.Alignment    := tacenter;
          nomeValor.Enabled      := false;
          nomeValor.valor         := dm.QAux.Fieldbyname('vv').AsInteger;

          qtdItem                := TSpinEdit.Create(categoria);
          qtdItem.Parent         := categoria;
          qtdItem.Width          := 50;
          qtdItem.Left           := 20;
          qtdItem.top            := 60;
          qtdItem.Value          := dm.QAux.Fieldbyname('qtd').AsInteger;
          qtdItem.Enabled        := false;
          qtdItem.TabStop        := false;

          Count            := Count + 1;
          dm.QAux.Next;
       end else
       begin
         topPos :=0;
         ladoEsquerdo:=0;
         count:=0;
         entrou:=false;
       end;
     end;
  end;
  topPos :=0;
  ladoEsquerdo:=0;
  count:=0;
end;
procedure TFCardapio.FormCreate(Sender: TObject);
begin
   codGarcom:= StrtoInt(InputBox('CÓDIGO DE BARRA','Informe o código de barra do garçom:',''));
   criarCardapio;
end;

procedure TFCardapio.listaProdutos(Sender: TObject);
var
i,qtd:Integer;
begin
     lista   := TStringList.Create;
     for i := 0 to TScrollBox(Sender).ControlCount-1  do
     begin
        if (TScrollBox(Sender).Controls[i] is TLabel) then
        begin
          if (TScrollBox(Sender).Controls[i] as TLabel).Enabled = true then
            begin
               lista.Add((TScrollBox(Sender).Controls[i] as TLabel).Caption);
               lista.Add(IntToStr((TScrollBox(Sender).Controls[i] as TLabel).tag));
            end else
            begin
               lista.Add(floatToStr((TScrollBox(Sender).Controls[i] as TnomeValor).valor));
            end;
        end;

        if (TScrollBox(Sender).Controls[i] is TSpinEdit)then
        begin
           lista.Add(IntToStr((TScrollBox(Sender).Controls[i] as TSpinEdit).Value));
        end;
     end;
    qtdDesejado:= StrtoInt(InputBox('Quantidade','Informe a quantidade:',''));
    nomeProduto := lista[0];
    idProduto   := StrToInt(lista[1]);
    preco       := StrToFloat(lista[2]);
    qtd         := StrToInt(lista[3]);
    addlistaProdutos(idProduto,codGarcom,nomeProduto,preco,qtdDesejado,qtd);
    excluirComponente;
    criarCardapio;
    lista.Clear;
    abort;
end;


procedure TFCardapio.Panel4Click(Sender: TObject);
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then
  begin
     ShowMessage('Não possui pedidos !!');
  end
  else
  begin
    dm.QAux.Close;
    dm.QAux.SQL.Text := 'DELETE from Venda where codBarraGarcom =:idG and idAmbiente =:iAmb and mesa =:iMesa and status =:staApr and idItem =  (select i.idItem from Item i where i.nome =:nomeP)';
    dm.QAux.ParamByName('iAmb').AsInteger  := iAmbiente;
    dm.QAux.ParamByName('idG').AsInteger := codGarcom;
    dm.QAux.ParamByName('iMesa').AsInteger  := TPanel(mesaMarcada).tag;
    dm.QAux.ParamByName('staApr').AsString  := 'Escolhendo';
    dm.QAux.ParamByName('nomeP').AsString  := dm.QAux2.fieldbyname('nome').AsString;
    dm.QAux.ExecSQL;
    excluirComponente;
    criarCardapio;
    dm.QAux2.Close;
    dm.QAux2.Open;
    abort;
  end;
end;

procedure TFCardapio.Panel3Click(Sender: TObject);
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then
  begin
     ShowMessage('Não possui pedidos !!');
  end
  else
  begin

    dm.QAux2.Close;
    dm.QAux2.Open;
    dm.QAux2.First;
    while not DBGrid1.DataSource.DataSet.Eof do
    begin
      dm.QAux.Close;
      dm.QAux.SQL.Text := 'DELETE from Venda where codBarraGarcom =:idG and idAmbiente =:iAmb and mesa =:iMesa and status =:staApr and idItem =  (select i.idItem from Item i where i.nome =:nomeP)';
      dm.QAux.ParamByName('iAmb').AsInteger  := iAmbiente;
      dm.QAux.ParamByName('idG').AsInteger := codGarcom;
      dm.QAux.ParamByName('iMesa').AsInteger  := TPanel(mesaMarcada).tag;
      dm.QAux.ParamByName('staApr').AsString  := 'Escolhendo';
      dm.QAux.ParamByName('nomeP').AsString  := dm.QAux2.fieldbyname('nome').AsString;
      dm.QAux.ExecSQL;
      dm.QAux2.Next;
    end;
    dm.QAux2.Close;
    dm.QAux2.Open;
    excluirComponente;
    criarCardapio;
    abort;
  end;
end;

procedure TFCardapio.Panel5Click(Sender: TObject);
var
i,j:Integer;

total: TStringList;
soma: Double;
begin
   total     := TStringList.Create;
   if DBGrid1.DataSource.DataSet.RecordCount = 0 then
   begin
      TPanel(mesaMarcada).Color:= clLime; // Mesa Desocupada
      TPanel(mesaMarcada).Hint := '';
      ShowMessage('Não foi feito pedido');
      FCardapio.Close;
   end else
   begin

     dm.QAux2.Close;
     dm.QAux2.Open;
     dm.QAux2.First;
     for i := 0 to pred(DBGrid1.DataSource.DataSet.RecordCount) do
     begin
         dm.QAux.Close;
         dm.QAux.SQL.Text := 'UPDATE Venda SET status =:m WHERE codBarraGarcom =:idG and idAmbiente =:iDA and mesa =:mes and status=:sta and idItem =  (select i.idItem from Item i where i.nome =:nom)';
         dm.QAux.ParamByName('m').AsString := 'Esperando';
         dm.QAux.ParamByName('idG').AsInteger := codGarcom;
         dm.QAux.ParamByName('iDA').AsInteger := iAmbiente;
         dm.QAux.ParamByName('mes').AsInteger := TPanel(mesaMarcada).Tag;
         dm.QAux.ParamByName('sta').AsString  := 'Escolhendo';
         dm.QAux.ParamByName('nom').AsString  := dm.QAux2.fieldbyname('nome').AsString;
         dm.QAux.ExecSQL;

         soma := soma + dm.QAux2.fieldbyname('ValorTotalItem').AsFloat;

     end;
     ShowMessage('Total  '+FloatToStr(soma));
     TPanel(mesaMarcada).Color:= clRed; // Mesa Ocupada
     TPanel(mesaMarcada).Hint := 'Valor Total R$ '+ floatToStr(soma);
     ShowMessage('Pedido feito com sucesso');
     FCardapio.Close;
   end;
end;

procedure TFCardapio.addlistaProdutos(idProduto, idGarcom: Integer;
  nome: String; valorTotal: Double; qtd: Integer; qtdEstoque:Integer);
begin
  if qtdEstoque > 0 then
  begin
    dm.QAux.Close;
    dm.QAux.SQL.Text := 'insert into Venda values (:codBarraGarcom,:idItem,:idAmbiente, :mesa, :status,:data,:preco,:qtd)';
    dm.QAux.ParamByName('codBarraGarcom').AsInteger := idGarcom;
    dm.QAux.ParamByName('idAmbiente').AsInteger := iAmbiente;
    dm.QAux.ParamByName('idItem').AsInteger     := idProduto;
    dm.QAux.parambyname('mesa').AsInteger   := TPanel(mesaMarcada).Tag;// n°Mesa
    dm.QAux.ParamByName('status').AsString   := 'Escolhendo';//status
    dm.QAux.ParamByName('data').AsDateTime := Now; // data
    dm.QAux.ParamByName('preco').AsFloat    := valorTotal;
    dm.QAux.ParamByName('qtd').AsInteger   := qtd;
    dm.QAux.ExecSQL;
    escolhendoProduto(idGarcom,idProduto,preco,qtd);
  end
  else
  begin
    ShowMessage('Quantidade Inválida, estoque vazio');
  end;
end;

procedure TFCardapio.escolhendoProduto(idGarcom, idProduto: Integer;
  preco: Double; quantidade: Integer);
begin
  dm.QAux2.Close;
  dm.QAux2.SQL.Clear;
  dm.QAux2.SQL.Add('select v.codBarraGarcom,i.nome, v.mesa,v.preco,v.qtd, v.preco * v.qtd as ValorTotalItem from Item i');
  dm.QAux2.SQL.Add(', Venda v where v.idAmbiente =:vIa and v.mesa=:vMe and v.codBarraGarcom =:ivG and (v.status =:stat or v.status =:vSta) and i.idItem = v.idItem  group by v.idComanda,v.codBarraGarcom,i.nome,v.mesa,v.preco,v.qtd');
  dm.QAux2.ParamByName('vIa').AsInteger := iAmbiente;
  dm.QAux2.ParamByName('vMe').AsInteger := TPanel(mesaMarcada).Tag;
  dm.QAux2.ParamByName('ivG').AsInteger := codGarcom;
  dm.QAux2.ParamByName('stat').AsString := 'Esperando';
  dm.QAux2.ParamByName('vSta').AsString := 'Escolhendo';
  dm.QAux2.Open;
end;

procedure TFCardapio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.QAux2.Close; // fechando pedido
end;

procedure TFCardapio.excluirComponente;
var
campo :TComponent;
begin
  campo       := FindComponent('PageControl1');

  if not (campo = nil) then
  begin
    campo.Free;
  end;
end;

procedure TFCardapio.FormShow(Sender: TObject);
begin
  dm.QAux2.Close;
  dm.QAux2.SQL.Clear;
  dm.QAux2.SQL.Add('select v.codBarraGarcom,i.nome, v.mesa,v.preco,v.qtd, v.preco * v.qtd as ValorTotalItem from Item i');
  dm.QAux2.SQL.Add(', Venda v where v.idAmbiente =:vIa and v.mesa=:vMe and v.codBarraGarcom =:ivG and (v.status =:stat or v.status =:vSta)  and i.idItem = v.idItem  group by v.idComanda,v.codBarraGarcom,i.nome,v.mesa,v.preco,v.qtd');
  dm.QAux2.ParamByName('vIa').AsInteger := iAmbiente;
  dm.QAux2.ParamByName('vMe').AsInteger := TPanel(mesaMarcada).Tag;
  dm.QAux2.ParamByName('ivG').AsInteger := codGarcom;
  dm.QAux2.ParamByName('stat').AsString := 'Esperando';
  dm.QAux2.ParamByName('vSta').AsString := 'Escolhendo';
  dm.QAux2.Open;
end;

end.
