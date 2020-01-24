unit UCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, Grids, DBGrids, StdCtrls, ComCtrls, ToolWin,dao,
  Mask, DBCtrls;

type
  TFCategoria = class(TFPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCategoria: TFCategoria;

implementation

{$R *.dfm}
Initialization
  RegisterClass(TFCategoria);

Finalization
  UnRegisterClass(TFCategoria);

end.
