unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls,Menus, DB;

type
  TFLogin = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    txtLogin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtSenha: TEdit;
    btnOK: TPanel;
    ds1: TDataSource;
    Image2: TImage;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function validarLogin(login, senha: string): boolean;

  public
    { Public declarations }
    procedure criarForm;
    procedure abrirPrograma;
  end;

var
  FLogin: TFLogin;

implementation

uses UTelaMenu, DAO;

{$R *.dfm}


procedure TFLogin.btnOKClick(Sender: TObject);
begin
   if (txtLogin.Text = '') then //Verifica se o campo "Login" foi preenchido
    begin
        Messagedlg('O campo "Login" deve ser preenchido!', mtInformation, [mbOk], 0);
          if txtLogin.CanFocus then
              txtLogin.SetFocus;
          Exit;
    end;
    if (txtSenha.Text = '') then //Verifica se o campo "Senha" foi preenchido
    begin
       Messagedlg('O campo "Senha" deve ser preenchido!', mtInformation, [mbOk], 0);
          if txtSenha.CanFocus then
             txtSenha.SetFocus;
          Exit;
    end;
    if validarLogin(txtLogin.Text, txtSenha.text) = true then //Verifica se o login é válido
    begin
        Messagedlg('Login realizado com sucesso!', mtInformation, [mbOk], 0);
        criarForm;
    end
    else //Caso o login nao seja válido entao
    begin
       Messagedlg('Login INVÁLIDO!', mtInformation, [mbOk], 0);
    end;
end;

procedure TFLogin.criarForm;
begin
   FTelaMenu := TFTelaMenu.Create(self);
   FTelaMenu.Show;
end;

function TFLogin.validarLogin(login, senha: string): boolean;
begin
  dm.QUsuario.close;
  dm.QUsuario.SQL.Text := 'SELECT * FROM Usuario WHERE (login=:Login) AND (senha=:Senha)';
  dm.QUsuario.ParamByName('Login').AsString := login;
  dm.QUsuario.ParamByName('Senha').AsString := senha;
  dm.QUsuario.open;
  if dm.QUsuario.RecordCount<>0 then
  begin
     Result := true;
  end;
  
end;

procedure TFLogin.abrirPrograma;
var
  Linhas, Ambiente:TStringList;
  caminho: string;
  i,j:integer;
begin
  Linhas := TStringList.Create;
  Ambiente := TStringList.Create;
  try
    caminho := extractFilepath(application.exename);
    Linhas.LoadFromFile(caminho+'\'+'ultimo.txt'); //Carregando arquivo
    for i := 0 to Pred(Linhas.Count) do
    begin
      {Transformando os dados das colunas em Linhas}
      Ambiente.text := StringReplace(Linhas.Strings[i],'',#13,[rfReplaceAll]);
      for j := 0 to Pred(Ambiente.Count) do
      begin
        txtLogin.Text := Ambiente.Strings[j];
      end;
    end;
  finally
    Linhas.Free;
    Ambiente.Free;
  end;
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
   abrirPrograma;
end;

end.
