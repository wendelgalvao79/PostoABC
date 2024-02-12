unit View.Impresso;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  Systems.Paramtrs,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  RLReport,
  Data.DB;

type
  Tfrmimpresso = class(TForm)
    ReportGerencial: TRLReport;
    DsRelatorio: TDataSource;
    RLBandTitle: TRLBand;
    RLLabel2: TRLLabel;
    RLBand1: TRLBand;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLBandDetail: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel9: TRLLabel;
    RLBandSumary: TRLBand;
    rltotlitros: TRLLabel;
    rltotvalor: TRLLabel;
    rltotimposto: TRLLabel;
    RLDraw1: TRLDraw;
    RLBand4: TRLBand;
    rlitrostot: TRLLabel;
    rvalortot: TRLLabel;
    rimpostotot: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDraw2: TRLDraw;
    rlperiodo: TRLLabel;
    procedure RLBandSumaryBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBandDetailBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBandTitleBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    FValorLitros : Currency;
    FValor       : Currency;
    FImpostos    : Currency;

    FTotLitros   : Currency;
    FTotValor    : Currency;
    FTotImposto  : Currency;
  public
    { Public declarations }
  end;

var
  frmimpresso: Tfrmimpresso;

implementation

uses
  Models.Dados;

{$R *.dfm}

procedure Tfrmimpresso.RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  rlitrostot.Caption  := FormatFloat(',0.000', FTotLitros);
  rvalortot.Caption   := FormatFloat(',0.00', FTotValor);
  rimpostotot.Caption := FormatFloat(',0.00', FTotImposto);

  FTotLitros  := 0;
  FTotValor   := 0;
  FTotImposto := 0;
end;

procedure Tfrmimpresso.RLBandDetailBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  FValorLitros := FValorLitros + ModelDados.QryRelatorio.FieldByName('litros').AsFloat;
  FValor       := FValor + ModelDados.QryRelatorio.FieldByName('valor_abastecimento').AsFloat;
  FImpostos    := FImpostos + ModelDados.QryRelatorio.FieldByName('valor_imposto').AsFloat;

  FTotLitros   := FTotLitros + ModelDados.QryRelatorio.FieldByName('litros').AsFloat;
  FTotValor    := FTotValor + ModelDados.QryRelatorio.FieldByName('valor_abastecimento').AsFloat;
  FTotImposto  := FTotImposto + ModelDados.QryRelatorio.FieldByName('valor_imposto').AsFloat;
end;

procedure Tfrmimpresso.RLBandSumaryBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  rltotlitros.Caption  := FormatFloat(',0.000', FValorLitros);
  rltotvalor.Caption   := FormatFloat(',0.00', FValor);
  rltotimposto.Caption := FormatFloat(',0.00', FImpostos);

  FValorLitros  := 0;
  FValor        := 0;
  FImpostos     := 0;
end;

procedure Tfrmimpresso.RLBandTitleBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  rlperiodo.Caption := Format('Periodo de: %s a %s',[FormatDateTime('dd.mm.yyyy', PrefSys.DataI), FormatDateTime('dd.mm.yyyy', PrefSys.DataF)]);
end;

end.
