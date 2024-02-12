unit View.Erro;

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
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  Tfrmerro = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    btncancelar: TSpeedButton;
    imgaviso: TImage;
    lblmsg: TLabel;
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmerro: Tfrmerro;

implementation

{$R *.dfm}

procedure Tfrmerro.btncancelarClick(Sender: TObject);
begin
  ModalResult  := mrCancel;
end;

procedure Tfrmerro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action    := caFree;
  frmerro   := nil;
end;

procedure Tfrmerro.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then btncancelarClick(Self);
end;

procedure Tfrmerro.FormShow(Sender: TObject);
begin
  lblmsg.Caption  := vMensagem;
  Exit;
end;

end.
