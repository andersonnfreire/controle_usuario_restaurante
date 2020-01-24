unit UGarcon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, Grids, DBGrids, StdCtrls, ComCtrls, ToolWin,dao,
  Mask, DBCtrls;

type
  TFGarcon = class(TFPadrao)
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
    dataNasc: TDateTimePicker;
    procedure dataNascChange(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGarcon: TFGarcon;

implementation

{$R *.dfm}

procedure TFGarcon.dataNascChange(Sender: TObject);
begin
  inherited;
  dm.MGarcondataNasc.AsDateTime  := dataNasc.DateTime;
end;

procedure TFGarcon.btNovoClick(Sender: TObject);
begin
  inherited;
  dataNasc.Enabled := true;
end;

procedure TFGarcon.btAlterarClick(Sender: TObject);
begin
  inherited;
  dataNasc.Enabled := true;
end;

procedure TFGarcon.btSalvarClick(Sender: TObject);
begin
  inherited;
  dataNasc.Enabled := false;
end;

procedure TFGarcon.DBEdit3Change(Sender: TObject);
begin
  inherited;
  dataNasc.DateTime := dm.MGarcondataNasc.AsDateTime;
end;

Initialization
  RegisterClass(TFGarcon);

Finalization
  UnRegisterClass(TFGarcon);

end.
