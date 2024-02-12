unit View.Filtro.Relatorio;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  Systems.Common,
  Systems.Paramtrs,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons;

type
  Tfrmrelatorio = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    LabelDataInicial: TLabel;
    edtdataI: TDateTimePicker;
    edtdataF: TDateTimePicker;
    LabelDataFinal: TLabel;
    Panel3: TPanel;
    btnimprimir: TSpeedButton;
    btnsair: TBitBtn;
    procedure btnsairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelatorio: Tfrmrelatorio;

implementation

uses
 Controllers.Combustivel,
 View.Impresso,
 View.Aviso,
 Models.Dados;

{$R *.dfm}
procedure Tfrmrelatorio.btnimprimirClick(Sender: TObject);
begin
  if edtdataI.Date > edtdataF.Date then begin
     Mensagem('Data inicial não pode ser menor que data final.', Tfrmaviso, frmaviso);
     edtdataI.SetFocus;
     Exit;
  end;

  TCombustivel.New.GetRelatorio(edtdataI.DateTime, edtdataF.DateTime, ModelDados.QryRelatorio);
  PrefSys.DataI := edtdataI.DateTime;
  PrefSys.DataF := edtdataF.DateTime;


  if ModelDados.QryRelatorio.IsEmpty then begin
     Mensagem('Não existe dados no período informado, para impressão.', Tfrmaviso, frmaviso);
     edtdataI.SetFocus;
     Exit;
  end;

  if frmimpresso = nil then begin
     Application.CreateForm(Tfrmimpresso, frmimpresso);
     frmimpresso.ReportGerencial.Preview();
     frmimpresso.Destroy;

     frmimpresso := nil;
     ModelDados.QryRelatorio.Close;
  end;
end;

procedure Tfrmrelatorio.btnsairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrmrelatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action       := caFree;
  frmrelatorio := nil;
end;

procedure Tfrmrelatorio.FormShow(Sender: TObject);
begin
  edtdataI.Date  := Date;
  edtdataF.Date  := Date;
  edtdataI.SetFocus;
end;

end.
