unit MemberPointReportShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Inherit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls, cxStyles, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton;

type
  TMemberPointReportForm = class(TInheritForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemberPointReportForm: TMemberPointReportForm;

implementation
{
  vChartXml := '<chart caption='''' SYAxisName="증가율" formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'yAxisMaxValue="1200" basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''0'' rotatevalues=''0'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';


	vChartXml := vChartXml + '  <categories>  ';
  for vIndex := 0 to ClassGridTableView1.DataController.RecordCount-1 do
   	vChartXml := vChartXml + Format('<category name ="%s"/> ',[Replace(ClassGridTableView1.DataController.Values[vIndex, ClassGridTableView1ClassName.Index],' ','')]);
	vChartXml := vChartXml + '  </categories>  ';

	vChartXml := vChartXml + '<dataset seriesname="비교일자" color="008E8E"> ';
  for vIndex := 0 to ClassGridTableView1.DataController.RecordCount-1 do
   	vChartXml := vChartXml + Format('<set value ="%s"/> ',[FormatFloat('#0',ClassGridTableView1.DataController.Values[vIndex, ClassGridTableView1SaleAmt.Index])]);
	vChartXml := vChartXml + '  </dataset>  ';

	vChartXml := vChartXml + '<dataset seriesname="기준일자" color="FF0000"> ';
  for vIndex := 0 to ClassGridTableView.DataController.RecordCount-1 do
   	vChartXml := vChartXml + Format('<set value ="%s"/> ',[FormatFloat('#0',ClassGridTableView.DataController.Values[vIndex, ClassGridTableViewSaleAmt.Index])]);
	vChartXml := vChartXml + '  </dataset> </chart> ';
  ShowChart(ClassChart, 'ClassChart', 'mscolumn3d', vChartXml);

}

{$R *.dfm}

end.
