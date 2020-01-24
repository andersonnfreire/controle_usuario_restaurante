unit URelatorioComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ppParameter, ppDesignLayer, ppCtrls, ppBands, ppClass,
  ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls, ppVar;

type
  TFRelatorioComissao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dataInicio: TDateTimePicker;
    dataFim: TDateTimePicker;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    DataSource1: TDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioComissao: TFRelatorioComissao;

implementation

uses DAO;

{$R *.dfm}

procedure TFRelatorioComissao.Panel2Click(Sender: TObject);
var
data1, data2: String;

begin
   if dataFim.date < dataInicio.date then
   begin
     ShowMessage('Intervalo invalido');
   end
   else
   begin
   dm.QComissao.Close;
   dm.QComissao.Params[0].AsString := 'Aprovado';
   dm.QComissao.Params[1].AsDateTime := dataInicio.DateTime;
   dm.QComissao.Params[2].AsDateTime := dataFim.DateTime;
   dm.QComissao.Open;
   ppReport1.Print;
   end;
end;
Initialization
  RegisterClass(TFRelatorioComissao);

Finalization
  UnRegisterClass(TFRelatorioComissao);

end.
