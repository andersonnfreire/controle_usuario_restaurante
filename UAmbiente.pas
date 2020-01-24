unit UAmbiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, Grids, DBGrids, StdCtrls, ComCtrls, ToolWin,dao,
  Mask, DBCtrls;

type
  TFAmbiente = class(TFPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAmbiente: TFAmbiente;

implementation

{$R *.dfm}
Initialization
  RegisterClass(TFAmbiente);

Finalization
  UnRegisterClass(TFAmbiente);
end.
