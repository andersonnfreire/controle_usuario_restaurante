unit UPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ComCtrls, ToolWin, Grids, DBGrids, StdCtrls, DBCtrls, DB,dao,UTelaMenu;

type
  TFPadrao = class(TForm)
    ToolBar1: TToolBar;
    btNovo: TToolButton;
    btDeletar: TToolButton;
    btAlterar: TToolButton;
    btCancelar: TToolButton;
    btPesquisar: TToolButton;
    btSalvar: TToolButton;
    btPrimeiro: TToolButton;
    btProx: TToolButton;
    btUltimo: TToolButton;
    btAnt: TToolButton;
    ds: TDataSource;
    PageControl1: TPageControl;
    tbDados: TTabSheet;
    tbFiltros: TTabSheet;
    grFiltros: TGroupBox;
    DBGrid1: TDBGrid;
    grDados: TGroupBox;
    ds1: TDataSource;
    ds2: TDataSource;
    ds3: TDataSource;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btDeletarClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btPrimeiroClick(Sender: TObject);
    procedure btAntClick(Sender: TObject);
    procedure btProxClick(Sender: TObject);
    procedure btUltimoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure permissoes;
    procedure NivelAcesso(inserir,pesquisar,alterar,excluir:Integer);
    function BooleanToInt(valor: Boolean): Integer;
    procedure exibirCor(Sender:TObject);
    procedure inserirLog(operacao,mensagem:string; lUsuario,lInterface:Integer);
    procedure StatusBotoes(e:Integer);
    procedure Usuarios;
  end;

var
  FPadrao: TFPadrao;
  Usuario:Integer;
  status:String;
  opcao: Boolean;
  idUsu:Integer;

implementation

uses Math;
{$R *.dfm}

procedure TFPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ds.DataSet.Close;
end;

procedure TFPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = vk_return)
      and not (ActiveControl is TMemo )
      and not (ActiveControl is TdbMemo )
      and not (ActiveControl is TDBGrid ) then
      Perform(VK_NEXT,0,0);
end;

procedure TFPadrao.dsStateChange(Sender: TObject);
begin
   tbFiltros.TabVisible := ds.DataSet.State in [dsbrowse, dsinactive];
   grDados.Enabled      := ds.DataSet.State in dsEditModes;
   if ds.DataSet.State in dsEditModes then
      StatusBotoes(1)
   else
      StatusBotoes(2);
end;

procedure TFPadrao.FormShow(Sender: TObject);
begin
   permissoes;
   exibirCor(sender);
   idUsu:= dm.MUsuarioidUsuario.AsInteger;
end;

procedure TFPadrao.btNovoClick(Sender: TObject);
begin
   if not ds.DataSet.Active then
     ds.DataSet.Open;
   ds.DataSet.Append;
   status:='INSERT';
   PageControl1.ActivePageIndex := 0;
   opcao :=True;
end;

procedure TFPadrao.btAlterarClick(Sender: TObject);
begin
   if ds.DataSet.Active then
   begin
      if not ds.DataSet.IsEmpty then
        begin
          ds.DataSet.Edit;
          PageControl1.ActivePageIndex := 0;
          status:='UPDATE';
          opcao:=True;
        end
        else
          ShowMessage('Não há registros para alteração');
   end;
end;

procedure TFPadrao.btSalvarClick(Sender: TObject);
begin
   if opcao = true then
   begin
    ds.DataSet.Post;
    if status = 'INSERT' then
    begin
      inserirLog(status,'Inserindo dados do usuario: '+dm.MUsuarionome.AsString,idUsu,dm.QInterfaceidInterface.AsInteger);
    end
    else
    begin
      inserirLog(status,'Alterando dados do usuario: '+dm.MUsuarionome.AsString,idUsu,dm.QInterfaceidInterface.AsInteger);
    end;
   end
   else
   begin
    ShowMessage('Não há dados para salvar');
   end;
end;

procedure TFPadrao.btCancelarClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja cancelar?','Cancelar',MB_YESNO+MB_ICONQUESTION)=id_yes then
    begin
      ds.DataSet.Cancel;
    end;

end;

procedure TFPadrao.btDeletarClick(Sender: TObject);
begin
   if ds.DataSet.Active then
   begin
      if not ds.DataSet.IsEmpty then
      begin
        if Application.MessageBox('Deseja deletar?','Deletar',MB_YESNO+MB_ICONQUESTION)=id_yes then
        begin
          ds.DataSet.Delete;
          inserirLog('DELETE','Excluindo dados do usuario: '+dm.MUsuarionome.AsString,idUsu,dm.QInterfaceidInterface.AsInteger);
        end
      else
        ShowMessage('Não há registros');
      end;
   end;
end;

procedure TFPadrao.btPesquisarClick(Sender: TObject);
begin
   ds.DataSet.Close;
   ds.DataSet.Open;
   inserirLog('SELECT','Pesquisando dados do usuario : '+dm.MUsuarionome.AsString,idUsu,dm.MInterfaceidInterface.AsInteger);
end;

procedure TFPadrao.btPrimeiroClick(Sender: TObject);
begin
   ds.DataSet.First;
end;

procedure TFPadrao.btAntClick(Sender: TObject);
begin
   ds.DataSet.Prior;
end;

procedure TFPadrao.btProxClick(Sender: TObject);
begin
   ds.DataSet.Next;
end;

procedure TFPadrao.btUltimoClick(Sender: TObject);
begin
  ds.DataSet.Last;
end;

procedure TFPadrao.exibirCor(Sender:TObject);
var
i: Integer;
begin
  grDados.Color :=  StringToColor(dm.QUsuariocorInterface.AsString);
  grFiltros.Color := StringToColor(dm.QUsuariocorEditDesabilidato.AsString);
  ToolBar1.Color  := StringToColor(dm.QUsuariocorBarraPrincipal.AsString);

  for i := 0 to grDados.ControlCount-1  do
  begin
      if (grDados.Controls[i] is TDBEdit) then
      begin
        if (grDados.Controls[i] as TDBEdit).Enabled = false then
          begin
            (grDados.Controls[i] as TDBEdit).Color := StringToColor(dm.QUsuariocorTelaFundoPrincipal.AsString);
          end
          else
          begin
            (grDados.Controls[i] as TDBEdit).Color := StringToColor(dm.QUsuariocorEditFundo.AsString);
          end;
      end;
  end;
end;
procedure TFPadrao.permissoes;
var
inserir,pesquisar,alterar,excluir,i: Integer;
begin
   dm.QAux.close;
   dm.QAux.SQL.Text := 'select ui.alterar as Alterar,ui.deletar as Excluir, ui.inserir as Inserir, ui.pesquisar as Pesquisar  from Usuario_Interface ui, Usuario u where ui.idUsuario =:id group by  ui.alterar,ui.deletar, ui.inserir, ui.pesquisar';
   dm.QAux.ParamByName('id').AsInteger := dm.QUsuarioidUsuario.AsInteger;
   dm.QAux.Open;
   for i := 0  to pred(dm.QAux.RecordCount)  do
   begin
      alterar :=  BooleanToInt(dm.QAux.fieldbyname('Alterar').AsBoolean);
      excluir :=  BooleanToInt(dm.QAux.fieldbyname('Excluir').AsBoolean);
      inserir :=  BooleanToInt(dm.QAux.fieldbyname('Inserir').AsBoolean);
      pesquisar :=  BooleanToInt(dm.QAux.fieldbyname('Pesquisar').AsBoolean);
      dm.QAux.Next;
   end;
   NivelAcesso(inserir,pesquisar,alterar,excluir);
end;

function TFPadrao.BooleanToInt(valor: Boolean): Integer;
begin
    if valor = true then
    begin
      Result := 2;
    end
    else
    begin
      Result := 1;
    end;
end;
procedure TFPadrao.NivelAcesso(inserir, pesquisar, alterar, excluir:Integer);
begin
    if inserir = 2 then
    begin
        btNovo.Visible        := true;
    end
    else
    begin
       btNovo.Visible        := false;
    end;
    if pesquisar = 2 then
    begin
       btPesquisar.Visible   :=  true;
    end
    else
    begin
       btPesquisar.Visible   :=  false;
    end;
    if alterar = 2 then
    begin
       btAlterar.Visible     :=  true;
    end
    else
    begin
       btAlterar.Visible     :=  false;
    end;
    if excluir = 2 then
    begin
       btDeletar.Visible     :=  True;
    end
    else
    begin
       btDeletar.Visible     :=  false;
    end;
end;

procedure TFPadrao.inserirLog(operacao,mensagem:string;lUsuario,lInterface: Integer);
begin
  dm.QAux.close;
  dm.QAux.SQL.Text := 'insert into Log values (:mensagem,:operacao,:data,:IdUsuario, :idInterface)';
  dm.QAux.ParamByName('mensagem').AsString  := mensagem;
  dm.QAux.ParamByName('operacao').AsString  :=  Operacao;
  dm.QAux.ParamByName('data').AsDateTime    := Now;
  dm.QAux.ParamByName('idUsuario').AsInteger  :=  lUsuario;
  dm.QAux.ParamByName('idInterface').AsInteger :=  lInterface;
  dm.QAux.ExecSQL;
end;

procedure TFPadrao.StatusBotoes(e: Integer);
begin
   btSalvar.Enabled := e=1;
   btCancelar.Enabled := e=1;

   btAnt.Enabled         :=  (e=2);
   btProx.Enabled        :=  (e=2);
   btPrimeiro.Enabled    :=  (e=2);
   btUltimo.Enabled      :=  (e=2);

   btNovo.Enabled    :=  e=2;
   btDeletar.Enabled := (e=2);
   btAlterar.Enabled := (e=2);
   btPesquisar.Enabled := e=2;
end;

procedure TFPadrao.Usuarios;
begin
    dm.QUsuario.Close;
    dm.QUsuario.SQL.Text := 'select * from Usuario';
    dm.QUsuario.Open;
end;

procedure TFPadrao.FormCreate(Sender: TObject);
begin
   Usuarios;
end;

end.
