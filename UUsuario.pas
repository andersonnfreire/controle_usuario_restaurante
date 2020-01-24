unit UUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, Grids, DBGrids, StdCtrls, ComCtrls, ToolWin,dao,
  Mask, DBCtrls, ExtCtrls;

type
  TFUsuario = class(TFPadrao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    corInterface: TColorBox;
    Label5: TLabel;
    corEditDesabilitado: TColorBox;
    Label6: TLabel;
    corEditFundo: TColorBox;
    Label7: TLabel;
    corBarraPrincipal: TColorBox;
    Label8: TLabel;
    corTelaFundo: TColorBox;
    gbEscolha: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    add: TPanel;
    remove: TPanel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBGrid2: TDBGrid;
    GBConfiguracao: TGroupBox;
    CBInserir: TCheckBox;
    CBAlterar: TCheckBox;
    CBPesquisar: TCheckBox;
    CBExcluir: TCheckBox;
    ComboBox1: TComboBox;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    procedure corInterfaceSelect(Sender: TObject);
    procedure corEditDesabilitadoSelect(Sender: TObject);
    procedure corEditFundoSelect(Sender: TObject);
    procedure corBarraPrincipalSelect(Sender: TObject);
    procedure corTelaFundoSelect(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure removeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure addInterfaceUsuario;
    procedure exibirTela;
    procedure apagarRegistros;
    procedure consultarTela;
    procedure validarCores;
  end;

var
  FUsuario: TFUsuario;
  valor: Boolean;
  num,idUsu: integer;

implementation

{$R *.dfm}
procedure TFUsuario.corInterfaceSelect(Sender: TObject);
begin
  inherited;
  dm.MUsuariocorInterface.AsString := corInterface.ColorNames[corInterface.ItemIndex];
  grDados.Color :=  StringToColor(dm.MUsuariocorInterface.AsString);
end;

procedure TFUsuario.corEditDesabilitadoSelect(Sender: TObject);
begin
  inherited;

  dm.MUsuariocorEditDesabilidato.AsString := corEditDesabilitado.ColorNames[corEditDesabilitado.ItemIndex];
  DBEdit1.Color := StringToColor(dm.MUsuariocorEditDesabilidato.AsString);
end;

procedure TFUsuario.corEditFundoSelect(Sender: TObject);
begin
  inherited;

  dm.MUsuariocorEditFundo.AsString := corEditFundo.ColorNames[corEditFundo.ItemIndex];
  DBEdit2.Color :=  StringToColor(dm.MUsuariocorEditFundo.AsString);
  DBEdit9.Color :=  StringToColor(dm.MUsuariocorEditFundo.AsString);
  DBEdit3.Color :=  StringToColor(dm.MUsuariocorEditFundo.AsString);
end;

procedure TFUsuario.corBarraPrincipalSelect(Sender: TObject);
begin
  inherited;

  dm.MUsuariocorBarraPrincipal.AsString := corBarraPrincipal.ColorNames[corBarraPrincipal.ItemIndex];
  ToolBar1.Color :=  StringToColor(dm.MUsuariocorBarraPrincipal.AsString);
end;

procedure TFUsuario.corTelaFundoSelect(Sender: TObject);
begin
  inherited;

  dm.MUsuariocorTelaFundoPrincipal.AsString:= corTelaFundo.ColorNames[corTelaFundo.ItemIndex];
  grFiltros.Color :=  StringToColor(dm.MUsuariocorTelaFundoPrincipal.AsString);
end;

procedure TFUsuario.btNovoClick(Sender: TObject);
begin
  inherited;
  gbEscolha.Enabled := false;
  gbEscolha.Visible := false;
  GBConfiguracao.Enabled := False;
  StatusBotoes(1);
end;

procedure TFUsuario.addInterfaceUsuario;
var
erro: Boolean;
begin
   if combobox1.items[combobox1.ItemIndex] <> '' then
   begin
      dm.QInterfaceUsu.Close;
      dm.QInterfaceUsu.SQL.Text := 'select idInterface, alterar,deletar,inserir,pesquisar from Usuario_Interface where idUsuario =:id and idInterface =:idI';
      dm.QInterfaceUsu.ParamByName('id').AsInteger := dm.MUsuarioidUsuario.AsInteger;
      dm.QInterfaceUsu.ParamByName('idI').AsInteger := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
      dm.QInterfaceUsu.Open;
      dm.QInterfaceUsu.RecordCount;

      if dm.QInterfaceUsu.RecordCount > 0 then
      begin
        ShowMessage('Erro: Tela duplicada');
        Abort;
      end
   else
     begin
        dm.QInterfaceUsu.close;
        dm.QInterfaceUsu.Open;
        dm.QInterfaceUsu.SQL.Text := 'insert into Usuario_Interface values (:idUsuario, :idInterface, :alterar,:deletar,:inserir, :pesquisar)';
        dm.QInterfaceUsu.ParamByName('idUsuario').AsInteger := dm.MUsuarioidUsuario.AsInteger;
        dm.QInterfaceUsu.ParamByName('idInterface').AsInteger := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
        dm.QInterfaceUsu.ParamByName('alterar').AsBoolean  :=  CBAlterar.Checked;
        dm.QInterfaceUsu.ParamByName('deletar').AsBoolean  :=  CBExcluir.Checked;
        dm.QInterfaceUsu.ParamByName('inserir').AsBoolean  :=  CBInserir.Checked;
        dm.QInterfaceUsu.ParamByName('pesquisar').AsBoolean  :=  CBPesquisar.Checked;
        dm.QInterfaceUsu.ExecSQL;
        ShowMessage('Cadastro INSERIDO com sucesso');
     end;
    end
    else
    begin
      ShowMessage('Erro: Não foi escolhida nenhuma tela');
      Abort;
    end;
end;

procedure TFUsuario.addClick(Sender: TObject);
begin
  inherited;
  addInterfaceUsuario;
  exibirTela;
end;


procedure TFUsuario.ComboBox1Enter(Sender: TObject);
begin
  inherited;
  ComboBox1.Items.Clear;
  dm.QInterface.Close;
  dm.QInterface.open;
  while not dm.QInterface.Eof do
  begin
    ComboBox1.Items.AddObject(dm.QInterfacelabel.AsString,TObject(dm.QInterfaceidInterface.AsInteger));
    dm.QInterface.Next;
  end;

end;

procedure TFUsuario.btSalvarClick(Sender: TObject);
begin
  validarCores;
  inherited;
  gbEscolha.Visible := True;
  gbEscolha.Enabled := true;
  GBConfiguracao.Enabled := True;
  StatusBotoes(2);
end;

procedure TFUsuario.exibirTela;
begin
   dm.QInterfaceUsu.Close;
   dm.QInterfaceUsu.SQL.Text := 'select idInterface, alterar,deletar,inserir,pesquisar from Usuario_Interface where idUsuario =:id';
   dm.QInterfaceUsu.ParamByName('id').AsInteger := dm.MUsuarioidUsuario.AsInteger;
   dm.QInterfaceUsu.Open;
   FPadrao.inserirLog('SELECT','Exibindo dados do usuario: '+dm.MUsuarionome.AsString,idUsu,Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]));
end;

procedure TFUsuario.btCancelarClick(Sender: TObject);
var
i:Integer;
begin
  inherited;
  if gbEscolha.Enabled = true then
  begin
    if Application.MessageBox('Deseja realizar a exclusão das permissões' , 'Aviso' ,Mb_OkCancel) = IDOk then
     begin

       for i := 0 to pred(DBGrid2.DataSource.DataSet.RecordCount)   do
       begin
          apagarRegistros;
       end;
       exibirTela;
      end;
  end;
end;

procedure TFUsuario.apagarRegistros;
begin
   dm.QInterfaceUsu.close;
   dm.QInterfaceUsu.SQL.text := 'DELETE FROM Usuario_Interface WHERE idUsuario = :parametro';
   dm.QInterfaceUsu.ParamByName('parametro').asinteger := dm.MUsuarioidUsuario.AsInteger;
   dm.QInterfaceUsu.ExecSQL;
   FPadrao.inserirLog('DELETE','Excluindo dados do usuario: '+dm.MUsuarionome.AsString,idUsu,Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]));
end;

procedure TFUsuario.removeClick(Sender: TObject);
var
texto: String;
num: Integer;
begin
  inherited;
  num := StrToInt(dbgrid2.Columns[0].Field.AsString);
  if DBGrid2.SelectedField.FieldName = 'idInterface' then
    begin
      dm.QInterfaceUsu.close;
      dm.QInterfaceUsu.SQL.text := 'DELETE FROM Usuario_Interface WHERE idUsuario = :id and idInterface =:parametro';
      dm.QInterfaceUsu.ParamByName('id').AsInteger := dm.MUsuarioidUsuario.AsInteger;
      dm.QInterfaceUsu.ParamByName('parametro').AsInteger := num;
      dm.QInterfaceUsu.ExecSQL;
      exibirTela;
    end
   else
   begin
      ShowMessage('Não há registros para serem EXCLUIDOS!!!');
   end;
end;

procedure TFUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  idUsu := dm.MUsuarioidUsuario.AsInteger;
end;

procedure TFUsuario.consultarTela;
begin
end;

procedure TFUsuario.validarCores;
begin
   if dm.MUsuariocorInterface.AsString = '' then
   begin
     ShowMessage('Escolha a cor da Interface !!!');
   end;
   if dm.MUsuariocorEditDesabilidato.AsString = '' then
   begin
     ShowMessage('Escolha a cor do Edit Desabilitado !!!');
     Abort;
   end;
   if dm.MUsuariocorEditFundo.AsString = '' then
   begin
     ShowMessage('Escolha a cor do Edit Fundo !!!');
     Abort;
   end;
   if dm.MUsuariocorBarraPrincipal.AsString = '' then
   begin
     ShowMessage('Escolha a cor da Barra Principal !!!');
     Abort;
   end;
   if dm.MUsuariocorTelaFundoPrincipal.AsString = '' then
   begin
     ShowMessage('Escolha a cor do Filtro !!!');
     Abort;
   end;
   if dm.MUsuarionome.AsString = '' then
   begin
     ShowMessage('Nome vazio!!!');
     Abort;
   end;
   if dm.MUsuariosenha.AsString = '' then
   begin
     ShowMessage('Senha vazia!!!');
     Abort;
   end;
   if dm.MUsuariologin.AsString = '' then
   begin
     ShowMessage('Login Vazio !!!');
     Abort;
   end;
end;

Initialization
  RegisterClass(TFUsuario);

Finalization
  UnRegisterClass(TFUsuario);
end.
