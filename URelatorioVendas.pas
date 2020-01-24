unit URelatorioVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls,dao, DB,
  ppParameter, ppDesignLayer, ppCtrls, ppBands, ppClass, ppPrnabl, ppCache,
  ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppStrtch, ppPageBreak,
  ppVar, ppRichTx;

type
  TFRelatorioVendas = class(TForm)
    Panel1: TPanel;
    dataInicio: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dataFim: TDateTimePicker;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DataSource1: TDataSource;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppLabel8: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppSystemVariable1: TppSystemVariable;
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioVendas: TFRelatorioVendas;

implementation

{$R *.dfm}

procedure TFRelatorioVendas.Panel2Click(Sender: TObject);
var
data1, data2: String;

begin
   if dataFim.date < dataInicio.date then
   begin
     ShowMessage('Intervalo invalido');
   end
   else
   begin
   dm.Qrelatorio.Close;
   dm.Qrelatorio.Params[0].AsString := 'Aprovado';
   dm.Qrelatorio.Params[1].AsDateTime := dataInicio.DateTime;
   dm.Qrelatorio.Params[2].AsDateTime := dataFim.DateTime;
   dm.Qrelatorio.Open;
   ppReport1.Print;
   end;
end;
Initialization
  RegisterClass(TFRelatorioVendas);

Finalization
  UnRegisterClass(TFRelatorioVendas);
end.
