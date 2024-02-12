unit View.Confirmacao;

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
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons;

type
  Tfrmconfirmar = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    btncancelar: TSpeedButton;
    lblmsg: TLabel;
    imgaviso: TImage;
    btnconfirmar: TSpeedButton;
    procedure btnconfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btncancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconfirmar: Tfrmconfirmar;

implementation

{$R *.dfm}
procedure Tfrmconfirmar.btncancelarClick(Sender: TObject);
begin
  ModalResult  := mrCancel;
end;

procedure Tfrmconfirmar.btnconfirmarClick(Sender: TObject);
begin
  ModalResult  := mrOk;
end;

procedure Tfrmconfirmar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action       := caFree;
  frmconfirmar := nil;
end;

procedure Tfrmconfirmar.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then btncancelarClick(Self);
end;

procedure Tfrmconfirmar.FormShow(Sender: TObject);
begin
  lblmsg.Caption  := vMensagem;
end;

end.
