unit View.Abastecimento;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,

  Controllers.Combustivel,

  Data.DB;

type
  Tfrmabastecto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btngravar: TSpeedButton;
    btnsair: TBitBtn;
    GridAbastecimento: TDBGrid;
    DsAbastecimento: TDataSource;
    procedure btnsairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btngravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmabastecto: Tfrmabastecto;

implementation

uses
  Models.Dados,
  View.Abastecer;

{$R *.dfm}
procedure Tfrmabastecto.btngravarClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmabastecer, frmabastecer);
  frmabastecer.ShowModal;
  FreeAndNil(frmabastecer);

  TCombustivel.New.GetAbastecimento(ModelDados.QryAbastecimento);
end;

procedure Tfrmabastecto.btnsairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrmabastecto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action       := caFree;
  frmabastecto := nil;
end;

procedure Tfrmabastecto.FormCreate(Sender: TObject);
begin
  TCombustivel.New.GetAbastecimento(ModelDados.QryAbastecimento);
end;

procedure Tfrmabastecto.FormDestroy(Sender: TObject);
begin
  ModelDados.QryAbastecimento.Close;
end;

end.
