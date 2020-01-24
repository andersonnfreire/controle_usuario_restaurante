unit URestaurante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, ComCtrls,dao, DB, jpeg;
type
  TFRestaurante = class(TForm)
    Panel1: TPanel;
    addMesa: TPanel;
    Label1: TLabel;
    Image1: TImage;
    fecharResumo: TPanel;
    Label3: TLabel;
    Image3: TImage;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Label5: TLabel;
    Image4: TImage;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    statusCompra: TPanel;
    valorTotal: TEdit;
    Label4: TLabel;
    procedure addMesaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel4Click(Sender: TObject);
    procedure fecharResumoClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
  private
    { Private declarations }
    procedure criarAmbiente;
    procedure criarFundo;
    procedure clickAmbiente(sender:TObject);
    procedure botaoClick(sender:TObject);
    procedure adicionarMesas(sender:TObject);
    procedure recuperarMesas(sender: TObject);
    procedure criarMaisMesa;
    procedure zerarVariaveis;
  public
    { Public declarations }
    ambienteSelecionado: TObject;
  end;

var
  FRestaurante: TFRestaurante;
  statusVenda:String;
  mesa: TPanel;
  mesaMarcada : TObject;
  iAmbiente: Integer;
  count: Integer;
  topPos:Integer;
  ladoEsquerdo: Integer;
  ladoEsquerdoTexto: Integer;
  scrolFundo:TScrollBox;
  scrolAmbiente: TScrollBox;
  gb: TGroupBox;
  valorT:String;
implementation

uses UCardapio, Math, URelatorioVendas, URelatorioComissao;

{$R *.dfm}

procedure TFRestaurante.botaoClick(sender: TObject);
var
cor: String;
mesaID,j:Integer;
statusCor:Boolean;
somaTotal: Double;
begin
  mesaMarcada := sender;
  cor         := ColorToString(TPanel(mesaMarcada).Color);
  mesaID      := TPanel(mesaMarcada).Tag;

  if TComponent(mesaMarcada) is TImage then
  begin
     iAmbiente   := TGroupBox(TScrollBox(TPanel(TImage(mesaMarcada).Parent).Parent).Parent).tag;
  end else if TComponent(mesaMarcada) is TPanel then
  begin
     iAmbiente   := TGroupBox(TScrollBox(TPanel(mesaMarcada).Parent).Parent).tag;
  end;
  if statusVenda = 'Aprovado' then
  begin
     if cor = 'clRed' then
     begin

        dm.QResumo.Close;
        dm.QResumo.SQL.Text := 'select i.nome, v.preco ,v.qtd, v.preco * v.qtd as Total  from Venda v, Item i where v.idAmbiente =:idA and v.mesa =:mMesa and i.idItem = v.idItem and (status=:Sta or v.status =:vSta)';
        dm.QResumo.ParamByName('idA').AsInteger := iAmbiente;
        dm.QResumo.ParamByName('mMesa').AsInteger := mesaID;
        dm.QResumo.ParamByName('Sta').AsString  := 'Esperando';
        dm.QResumo.ParamByName('vSta').AsString := 'Escolhendo';
        dm.QResumo.Open;

        for j := 0  to pred(dm.QResumo.RecordCount)  do
        begin
           dm.QAux.Close;
           dm.QAux.SQL.Text := 'UPDATE VENDA set status=:st where idAmbiente =:IAmb and mesa =:IMesa';
           dm.QAux.ParamByName('st').AsString := 'Aprovado';
           dm.QAux.ParamByName('IAmb').AsInteger := iAmbiente;
           dm.QAux.ParamByName('IMesa').AsInteger := mesaID;
           dm.QAux.ExecSQL;
           somaTotal := somaTotal + dm.QResumo.FieldByName('Total').AsFloat;
           statusCor := true;
        end;
        if statusCor = true then
        begin
          TPanel(mesaMarcada).Color := clLime;
          statusCompra.Color        := clBlue;
          valorTotal.Text           := floatToStr(somaTotal);
          ShowMessage('Compra realizada com Sucesso');
        end;
     end else
     begin
        statusVenda := 'Esperando';
        TPanel(mesaMarcada).Hint     := '';
        statusCompra.Color  := clGray;
        valorTotal.Text              := '';
     end;
  end
  else
  begin
      FCardapio := TFCardapio.Create(Application);
      FCardapio.Show;
  end;
end;

procedure TFRestaurante.clickAmbiente(sender: TObject);
begin
   ambienteSelecionado := sender;
end;

procedure TFRestaurante.criarFundo;
begin
  scrolFundo             :=  TScrollBox.Create(self);
  scrolFundo.Parent      :=  self;
  scrolFundo.Align       :=  alLeft;
  scrolFundo.Top         :=  140;
  scrolFundo.Height      :=  400;
  scrolFundo.Width       :=  855;
end;

procedure TFRestaurante.criarAmbiente;
var
  i,j: Integer;
  img: TImage;

begin

  dm.MAmbiente.Close;
  dm.MAmbiente.open;
  dm.MAmbiente.First;

  while not dm.MAmbiente.Eof do
  begin
      gb                    :=  TGroupBox.Create(scrolFundo);
      gb.Parent             :=  scrolFundo;
      gb.Top                :=  0;
      gb.Height             :=  520;
      gb.Width              :=  420;
      gb.Left               :=  ladoEsquerdoTexto+10;
      gb.Caption            :=  dm.MAmbientenome.AsString;
      gb.Tag                :=  dm.MAmbienteidAmbiente.AsInteger;
      ladoEsquerdoTexto     :=  gb.Left + gb.Width + 30;

      scrolAmbiente             := TScrollBox.Create(gb);
      scrolAmbiente.Parent      := gb;
      scrolAmbiente.Top         := 5;
      scrolAmbiente.Align       := alClient;
      scrolAmbiente.Color       := clSkyBlue;
      scrolAmbiente.OnClick     := clickAmbiente;
      //Criar Mesa
        for j := 0 to pred(dm.MAmbientemesa.AsInteger)  do
        begin
            if count > 2 then
            begin
              TopPos := TopPos+110;
              ladoEsquerdo := 0;
              count :=  0;
            end;
            mesa             := TPanel.Create(scrolAmbiente);
            mesa.Parent      := scrolAmbiente;
            mesa.Top         := topPos+15;
            mesa.Left        := ladoEsquerdo + 10;
            mesa.Height      := 105;
            mesa.Width       := 113;
            ladoEsquerdo     := mesa.Left +mesa.Width + 10;
            mesa.Color       := clLime;
            mesa.OnClick     := botaoClick;
            mesa.Tag         := j;
            mesa.ShowHint    := true;
            //mesa.Caption     := 'Mesa '+IntToStr(j);

            img                      := TImage.Create(mesa);
            img.Parent               := mesa;
            img.Height               := 85;
            img.Width                := 90;
            img.Left                 := 10;
            img.Top                  := 10;
            img.Picture.LoadFromFile('C:\Users\Ander\Área de Trabalho\Controle de usuario\iconMesa.jpg');
            img.OnClick              :=mesa.OnClick;
            img.Stretch               := True;
            Count            := Count + 1;
            recuperarMesas(scrolAmbiente);
          end;
      //zerando os dados
      topPos:=0;
      ladoEsquerdo:=0;
      count:=0;
      dm.MAmbiente.Next;
     end;

end;

procedure TFRestaurante.addMesaClick(Sender: TObject);
begin
   criarMaisMesa;
end;

procedure TFRestaurante.adicionarMesas(sender: TObject);
var
i,j:Integer;
sValor,qtd,soma: Integer;
mesaAdd:TPanel;
imgAdd:TImage;
begin
   sValor:= StrtoInt(InputBox('Quantidade','Informe a quantidade de mesas:',''));
   iAmbiente := TGroupBox(TScrollBox(sender).Parent).Tag;
   qtd   := TPanel(Sender).ComponentCount;
   soma  := qtd + sValor;
   dm.QAux.Close;
   dm.QAux.SQL.Text := 'UPDATE AMBIENTE SET mesa =:m WHERE idAmbiente =:iDA';
   dm.QAux.ParamByName('m').AsInteger := soma;
   dm.QAux.ParamByName('iDA').AsInteger := iAmbiente;
   dm.QAux.ExecSQL;
   zerarVariaveis;
   gb.Free;
   scrolFundo.Free;
   criarFundo;
   criarAmbiente;//Recriando Mesas
end;

procedure TFRestaurante.recuperarMesas(sender:TObject);
var
i:Integer;
idAmb,qtdMesa:Integer;
entrou:Boolean;
soma: Double;
begin
  dm.QAux.Close;
  dm.QAux.SQL.Text := 'select idAmbiente, mesa,status, preco , qtd, preco * qtd as ValorTotal from Venda where idAmbiente =:id and mesa=:m and (status=:stas or status=:vSta)';
  dm.QAux.ParamByName('id').AsInteger := dm.MAmbienteidAmbiente.AsInteger;
  dm.QAux.ParamByName('m').AsInteger := mesa.tag;
  dm.QAux.ParamByName('stas').AsString := 'Esperando';
  dm.QAux.ParamByName('vSta').AsString := 'Escolhendo';
  dm.QAux.Open;

  idAmb := dm.MAmbienteidAmbiente.AsInteger;
  while not dm.QAux.Eof do
  begin
    if dm.QAux.FieldByName('idAmbiente').AsInteger = idAmb then
    begin
        if dm.QAux.FieldByName('mesa').AsInteger = mesa.tag then
        begin
           if (dm.QAux.FieldByName('status').AsString = 'Esperando') or (dm.QAux.FieldByName('status').AsString = 'Escolhendo') then
           begin
              mesa.Color := clRed;
              soma :=  soma + dm.QAux.FieldByName('ValorTotal').AsFloat;
              mesa.Hint  := 'Valor Total R$ '+ FloatToStr(soma);
              entrou:= true;
           end;
        end;
    end;
    dm.QAux.Next;
  end;
  if entrou = true then
  begin
    valorTotal.Text  := FloatToStr(soma);
  end else
  begin
    valorTotal.Text := '';
  end;
end;


procedure TFRestaurante.criarMaisMesa;
var
cor :string;
begin
   cor := TGroupBox(TScrollBox(ambienteSelecionado).Parent).Caption;
   if  cor <> '' then
   begin
     adicionarMesas(ambienteSelecionado);
   end
   else
   begin
     ShowMessage('Escolha o ambiente');
   end;

end;

procedure TFRestaurante.FormCreate(Sender: TObject);
begin
  criarFundo;
  criarAmbiente;
end;

procedure TFRestaurante.zerarVariaveis;
begin
   count := 0;
   topPos := 0;
   ladoEsquerdo:= 0;
   ladoEsquerdoTexto:=0;
end;

procedure TFRestaurante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    zerarVariaveis;
end;

procedure TFRestaurante.Panel4Click(Sender: TObject);
begin
   statusVenda := 'Aprovado';
end;

procedure TFRestaurante.fecharResumoClick(Sender: TObject);
begin
   valorTotal.Text     := '';
   statusCompra.Color  := clGray;
   dm.QResumo.Close;
end;

procedure TFRestaurante.Panel2Click(Sender: TObject);
begin
   FRelatorioVendas := TFRelatorioVendas.Create(Application);
   FRelatorioVendas.Show;
end;

procedure TFRestaurante.Panel3Click(Sender: TObject);
begin
   FRelatorioComissao := TFRelatorioComissao.Create(application);
   FRelatorioComissao.Show;
end;

Initialization
  RegisterClass(TFRestaurante);

Finalization
  UnRegisterClass(TFRestaurante);
end.
