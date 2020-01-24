unit UTelaMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,DB;
type
  TMenuClasse = class (TMenuItem)

  private

  public
    caminhoDiretorio:string;//caso o clique for na imagem e passado o diretorio do album.
  end;
type
  TFTelaMenu = class(TForm)
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AdicionarGuiaMenu(pMenuPrincipal: TMainMenu; pCaptionItem: string);
    procedure AdicionarItem(pMenuPrincipal: TMainMenu; pPosHoriz: Byte; pCaptionItem: string);
    {procedure AdicionarSubItem(pMenuPrincipal: TMainMenu; pPosHoriz, pPosVert: Byte;
pCaptionSubItem: string);}
    procedure criarMenu;
    procedure listaTela;
    procedure codigoNome;
    procedure clique(Sender: TObject);
    //procedure cores;
    function Remove(str: string):string;
    procedure salvarPrograma;
  end;

var
  FTelaMenu: TFTelaMenu;
  listaNome: TStringList;
  listaLabel: TStringList;
  nome:string;
implementation

uses DAO, UPadrao, DateUtils,UPrincipal;

{$R *.dfm}

procedure TFTelaMenu.AdicionarGuiaMenu(pMenuPrincipal: TMainMenu;
  pCaptionItem: string);
var
  NovoItem: TMenuItem;
begin
  NovoItem:= TMenuClasse.Create(self);
  NovoItem.Caption:= pCaptionItem;
  pMenuPrincipal.Items.Add(NovoItem);
end;

procedure TFTelaMenu.AdicionarItem(pMenuPrincipal: TMainMenu;
  pPosHoriz: Byte; pCaptionItem: string);
var
  NovoItem: TMenuClasse;
  i: Integer;
begin
  NovoItem:= TMenuClasse.Create(Self);
  NovoItem.Caption:= pCaptionItem;
  for i := 0 to pred(listaNome.Count) do
  begin
      NovoItem.caminhoDiretorio := listaNome.Strings[i];
  end;

  NovoItem.OnClick:= clique;
  pMenuPrincipal.Items[pPosHoriz].Add(NovoItem);
end;
{
procedure TFTelaMenu.AdicionarSubItem(pMenuPrincipal: TMainMenu; pPosHoriz,
  pPosVert: Byte; pCaptionSubItem: string);
var
  NovoSubItem: TMenuItem;
begin
  NovoSubItem:= TMenuItem.Create(Self);
  NovoSubItem.Caption:= pCaptionSubItem;
  NovoSubItem.OnClick := clique;
  pMenuPrincipal.Items[pPosHoriz].Items[pPosVert].Add(NovoSubItem);
end;
}
procedure TFTelaMenu.clique(Sender:TObject);
var
pc: TPersistentClass;
tela:String;
begin
 tela := TMenuClasse(Sender).Caption;
 tela := Remove(tela);
 pc := GetClass('TF' + trim(tela)); //capiturar o nome da tela do banco de dados
 if (pc <> nil) then
 begin
    with tFormClass(pc).Create(Application) do
      try
      Name := tela;
      Caption := tela;
      ShowModal;
      finally
      Free;
      tFormClass(pc) := nil;
   end;
end;
end;

procedure TFTelaMenu.criarMenu;
var
main : TMainMenu;
i : Integer;
begin

  main := TMainMenu.Create(self);

  dm.MUsuario.Close;
  dm.MUsuario.Open;
  dm.MInterface.Close;
  dm.MInterface.Open;
  dm.MAmbiente.Close;
  dm.MAmbiente.Open;
  dm.MGarcon.Close;
  dm.MGarcon.Open;
  dm.MItem.Close;
  dm.MItem.Open;
  dm.MCategoria.Close;
  dm.MCategoria.Open;

  
  listaTela;

  if dm.MUsuarionome.AsString = 'Administrador' then
  begin
    AdicionarGuiaMenu(main,'Gerenciar');

    for i := 0  to pred(listaLabel.Count)  do
    begin
     AdicionarItem(main,0,listaLabel.Strings[i]);
    end;
  end
  else
  begin
    AdicionarGuiaMenu(main,'Acessar');
    begin
      for i := 0  to pred(listaLabel.Count)  do
         AdicionarItem(main,0,listaLabel.Strings[i]);
    end;
  end;

end;

procedure TFTelaMenu.FormCreate(Sender: TObject);
begin
  criarMenu;
  codigoNome;
end;

procedure TFTelaMenu.listaTela;
var
i: Integer;

begin
   listaNome := TStringList.Create;
   listaLabel := TStringList.Create;
   dm.QAux.Close;
   dm.QAux.SQL.Text := 'SELECT i.nome as nome,i.label as Label FROM Interface i, Usuario_Interface ui, Usuario u WHERE i.idInterface = ui.idInterface and ui.idUsuario =:id group by i.nome,i.label';
   dm.QAux.ParamByName('id').AsInteger := dm.MUsuarioidUsuario.AsInteger;
   dm.QAux.Open;
   for i := 0  to pred(dm.QAux.RecordCount)  do
   begin
      listaNome.Add(dm.QAux.fieldbyname('nome').AsString);
      listaLabel.Add(dm.QAux.fieldbyname('label').AsString);
      dm.QAux.Next;
   end;
end;
function TFTelaMenu.Remove(str: string): string;
var
   x: integer;
   st: string;
begin
st:='';
for x:=1 to length(str) do
    begin
    if (str[x] <> '&') and
       (str[x] <> '.') and
       (str[x] <> ',') and
       (str[x] <> '/') then
    st:=st + str[x];
    end;
Remove:=st;
end;
procedure TFTelaMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   salvarPrograma;
end;

procedure TFTelaMenu.codigoNome;
begin
  dm.MUsuario.Close;
  dm.MUsuario.Open;
  nome:= dm.MUsuariologin.AsString;
end;


procedure TFTelaMenu.salvarPrograma;
var
  F: TextFile;
  cLinha: string;
  caminho: string;
begin
  caminho := extractFilepath(application.exename);
  AssignFile(F, caminho+'\'+'ultimo.txt');
  cLinha := '';

  // salvando o ultimo usuario no arquivo txt
  if FileExists('ultimo.txt') then
    begin
      Rewrite(F);
        Writeln(F,nome);
    end;
  Closefile(F);
end;

end.
