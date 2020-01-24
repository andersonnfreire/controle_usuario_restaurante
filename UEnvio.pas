unit UEnvio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, DBClient, Grids, DBGrids, StdCtrls, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdBaseComponent,
  IdMessage,IdSSLOpenSSL;

type
  TFEnvio = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    MLista: TClientDataSet;
    Panel1: TPanel;
    MListanome: TStringField;
    MListaemail: TStringField;
    IdMessage: TIdMessage;
    IdSMTP: TIdSMTP;
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ed_Assunto: TEdit;
    Label2: TLabel;
    ed_nome: TEdit;
    Arquivo: TLabel;
    ed_arquivo: TEdit;
    Panel3: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure recuperarLista;
  end;

var
  FEnvio: TFEnvio;
  listaAmbiente:TStringList;

implementation

{$R *.dfm}

procedure TFEnvio.FormCreate(Sender: TObject);
begin
   MLista.CreateDataSet;
   listaAmbiente     := TStringList.Create;
   recuperarLista;
end;

procedure TFEnvio.recuperarLista;
var
  Linhas, Ambiente:TStringList;
  caminho: string;
  i,j,cont:integer;
begin
  Linhas := TStringList.Create;
  Ambiente := TStringList.Create;
  cont := 0;
  try
    caminho := extractFilepath(application.exename);
    Linhas.LoadFromFile(caminho+'\'+'listaCliente.txt'); //Carregando arquivo
    for i := 0 to Pred(Linhas.Count) do
    begin
      {Transformando os dados das colunas em Linhas}
      Ambiente.text := StringReplace(Linhas.Strings[i],';',#13,[rfReplaceAll]);
      for j := 0 to Pred(Ambiente.Count) do
      begin
         if Ambiente.Strings[0] <> '' then
         begin
           cont := cont + 1;
           if cont > 1 then
           begin
             MLista.Append;
             MListanome.AsString := Ambiente.Strings[0];
             MListaemail.AsString:= Ambiente.Strings[1];
             MLista.Post;
             cont := 0;
           end;
         end;
      end;
    end;
  finally
    Linhas.Free;
    Ambiente.Free;
  end;
end;
procedure TFEnvio.Panel2Click(Sender: TObject);
var i : integer;
IdSSLIOHandlerSocket: TIdSSLIOHandlerSocket;
sucesso:Boolean;
begin
     MLista.First;
     IdSSLIOHandlerSocket := TIdSSLIOHandlerSocket.Create(Self);
     while not MLista.Eof do
     begin
       IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
       IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;
       IdSMTP.IOHandler := IdSSLIOHandlerSocket;
       IdSMTP.AuthenticationType := atLogin;

       IdMessage.Recipients.EMailAddresses := MListaemail.AsString;
       IdMessage.Subject := ed_Assunto.Text;


       IdMessage.From.Text              := 'Anderson Restaurante';
       IdMessage.From.Address           := 'coolerinformatica1995@gmail.com';
       IdMessage.From.Name              := ed_nome.Text;

       IdSMTP.Username := 'coolerinformatica1995@gmail.com';
       IdSMTP.Password := 'F+guandu2018';

       IdMessage.ContentType:='text/plain';
       IdMessage.Headers.Values['X-Library'] := '';
       //idmessage.SaveToFile('c:\MSG.txt');

     if trim(ed_arquivo.Text )<> '' then
         TIdAttachment.Create(idmessage.MessageParts, tfilename(ed_arquivo.Text));


        try
         IdSMTP.Connect;
         IdSMTP.Send(idmessage);
         sucesso := true;

        finally

          IdSMTP.Disconnect;
          IdMessage.MessageParts.Clear;
          IdMessage.Recipients.EMailAddresses := '';
          idmessage.Body.Clear;
        end;
       MLista.Next;
    end;
    if sucesso = true then
    begin
       showmessage('Email enviado com sucesso');
    end;
end;
procedure TFEnvio.Panel3Click(Sender: TObject);
begin
   OpenDialog1.Execute;
   ed_arquivo.Text := OpenDialog1.FileName;
end;
Initialization
  RegisterClass(TFEnvio);

Finalization
  UnRegisterClass(TFEnvio);
end.
