unit View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Systems.Common,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  Tfrmprincipal = class(TForm)
    pnlcontrole: TPanel;
    pnlcontainer: TPanel;
    pnlmenu: TPanel;
    pnlopcao: TPanel;
    btncombustivel: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure btncombustivelClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprincipal: Tfrmprincipal;

implementation

uses
  View.Combustivel,
  View.Tanques,
  View.Bombas,
  View.Abastecimento,
  View.Filtro.Relatorio;

{$R *.dfm}
procedure Tfrmprincipal.btncombustivelClick(Sender: TObject);
begin
  ChamarForm(Tfrmcombustivel, frmcombustivel, pnlcontainer);
end;

procedure Tfrmprincipal.SpeedButton2Click(Sender: TObject);
begin
  ChamarForm(Tfrmtanques, frmtanques, pnlcontainer);
end;

procedure Tfrmprincipal.SpeedButton3Click(Sender: TObject);
begin
  ChamarForm(Tfrmbombas, frmbombas, pnlcontainer);
end;

procedure Tfrmprincipal.SpeedButton4Click(Sender: TObject);
begin
  ChamarForm(Tfrmabastecto, frmabastecto, pnlcontainer);
end;

procedure Tfrmprincipal.SpeedButton5Click(Sender: TObject);
begin
  ChamarForm(Tfrmrelatorio, frmrelatorio, pnlcontainer);
end;

end.
