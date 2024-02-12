unit View.Aviso;

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
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  Tfrmaviso = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    btnok: TSpeedButton;
    imgaviso: TImage;
    lblmsg: TLabel;
    procedure btnokClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmaviso: Tfrmaviso;

implementation

{$R *.dfm}

procedure Tfrmaviso.btnokClick(Sender: TObject);
begin
  ModalResult  := mrOk;
end;

procedure Tfrmaviso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action   := caFree;
  frmaviso := nil;
end;

procedure Tfrmaviso.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then btnokClick(Self);
end;

procedure Tfrmaviso.FormShow(Sender: TObject);
begin
  lblmsg.Caption  := vMensagem;
end;

end.
