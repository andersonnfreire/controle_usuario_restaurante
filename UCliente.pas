unit UCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, Grids, DBGrids, StdCtrls, ComCtrls, ToolWin,dao;

type
  TFCliente = class(TFPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCliente: TFCliente;

implementation

{$R *.dfm}
Initialization
  RegisterClass(TFCliente);

Finalization
  UnRegisterClass(TFCliente);

end.
