unit View.Conexao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.StrUtils,
  System.SysUtils,
  System.Variants,
  System.Classes,

  Systems.Common,
  Systems.Conexao,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  Tfrmconexao = class(TForm)
    pnlfundo: TPanel;
    Image1: TImage;
    Label1: TLabel;
    edtfilename: TEdit;
    btnabrir: TSpeedButton;
    Panel1: TPanel;
    btncancelar: TSpeedButton;
    btnconectar: TSpeedButton;
    OpenDialog: TOpenDialog;
    procedure btncancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnabrirClick(Sender: TObject);
    procedure btnconectarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconexao: Tfrmconexao;

implementation

uses
  View.Confirmacao,
  View.Aviso,
  View.Sucesso;

{$R *.dfm}
procedure Tfrmconexao.btnabrirClick(Sender: TObject);
begin
  OpenDialog.Execute;
  edtfilename.Text    := OpenDialog.FileName;
  btnconectar.Enabled := not Trim(edtfilename.Text).Equals('');
end;

procedure Tfrmconexao.FormShow(Sender: TObject);
begin
  btnconectar.Enabled := False;
  edtfilename.Text    := EmptyStr;
  edtfilename.SetFocus;
end;

procedure Tfrmconexao.btncancelarClick(Sender: TObject);
begin
  Application.Terminate;
  ExitProcess(0);
end;

procedure Tfrmconexao.btnconectarClick(Sender: TObject);
begin
  var vArquivo : String := RightStr(edtfilename.Text, 3);

  if not vArquivo.Equals('FDB') then begin
     Mensagem('O arquivo informado não corresponde ao um arquivo de Banco de Dados.', Tfrmaviso, frmaviso);
     edtfilename.SetFocus;
     Exit;
  end;

  if Mensagem('Confirmar conexão ao Banco de Dados?', Tfrmconfirmar, frmconfirmar) = mrOk then begin
     var lThread : TThread := TThread.CreateAnonymousThread(
                              procedure
                              begin
                                Systems.Conexao.Conexao(edtfilename.Text);
                                Sleep(1000);

                                TThread.Synchronize(TThread.CurrentThread,
                                                    procedure
                                                    begin
                                                      ConexaoBD(edtfilename.Text);
                                                      Mensagem('Banco Conectado...', Tfrmsucesso, frmsucesso);
                                                      Close;
                                                    end);
                              end);
     lThread.Start;
  end;
end;

end.
