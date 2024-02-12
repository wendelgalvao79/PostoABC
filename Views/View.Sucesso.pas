unit View.Sucesso;

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
  Vcl.StdCtrls,
  Vcl.Imaging.jpeg;

type
  Tfrmsucesso = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    lblmensagem: TLabel;
    tmpSucesso: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Simples        (Sender: TObject);
    procedure ContagemSimples(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmsucesso: Tfrmsucesso;

implementation
{$R *.dfm}

{ Tfrmsucesso }
procedure Tfrmsucesso.ContagemSimples(Sender: TObject);
begin
  Application.ProcessMessages;
  BringToFront;
end;

procedure Tfrmsucesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action      := caFree;
  frmsucesso  := nil;
end;

procedure Tfrmsucesso.FormCreate(Sender: TObject);
begin
  tmpSucesso.Interval   := 2000;
  tmpSucesso.OnTimer    := Simples;
  tmpSucesso.Enabled    := True;
end;

procedure Tfrmsucesso.FormShow(Sender: TObject);
begin
  lblmensagem.Caption  := vMensagem;
end;

procedure Tfrmsucesso.Simples(Sender: TObject);
begin
  Application.ProcessMessages;
  BringToFront;

  ModalResult  := mrOk;
  vModal       := ModalResult;
end;

end.
