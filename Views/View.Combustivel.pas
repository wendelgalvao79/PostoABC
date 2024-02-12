unit View.Combustivel;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Systems.Common,
  Classe.Combustivel,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,

  Data.DB;

type
  Tfrmcombustivel = class(TForm)
    pnlfundo: TPanel;
    pgcontrole: TPageControl;
    tbscadastro: TTabSheet;
    tbsconsulta: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    btnnovo: TSpeedButton;
    btnalterar: TSpeedButton;
    RadioGroup1: TRadioGroup;
    edtconsulta: TEdit;
    GridCombustivel: TDBGrid;
    btnsair: TBitBtn;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtcodigo: TEdit;
    Label2: TLabel;
    edtdescricao: TEdit;
    Label3: TLabel;
    edtvalor: TEdit;
    Label4: TLabel;
    edtimposto: TEdit;
    btngravar: TSpeedButton;
    btncancelar: TSpeedButton;
    DsCombustivel: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnsairClick(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtimpostoKeyPress(Sender: TObject; var Key: Char);
    procedure edtvalorKeyPress(Sender: TObject; var Key: Char);
    procedure btngravarClick(Sender: TObject);
    procedure edtconsultaEnter(Sender: TObject);
    procedure GridCombustivelEnter(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure GridCombustivelDblClick(Sender: TObject);
    procedure edtconsultaChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function PostCombustivel(Value: String): Boolean;
  public
    { Public declarations }
  end;

var
  frmcombustivel: Tfrmcombustivel;
  cOpc          : String;

implementation

uses
  Controllers.Combustivel,
  View.Confirmacao,
  View.Sucesso,
  View.Erro,
  Models.Dados;

{$R *.dfm}
procedure Tfrmcombustivel.btnsairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrmcombustivel.edtconsultaChange(Sender: TObject);
begin
  if Length(edtconsulta.Text) >= 3 then begin
     with ModelDados do begin
          try
            QryCombustivel.Filtered := True;
            QryCombustivel.Filter   := 'descricao like ' + QuotedStr('%' + edtconsulta.Text + '%');
          except
            QryCombustivel.Filtered := False;
            QryCombustivel.First;
          end;
     end;
  end
  else
  begin
    ModelDados.QryCombustivel.Filtered := False;
    ModelDados.QryCombustivel.First;
  end;
end;

procedure Tfrmcombustivel.edtconsultaEnter(Sender: TObject);
begin
  btnalterar.Enabled := not edtconsulta.Focused;
end;

procedure Tfrmcombustivel.edtimpostoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',',', #8]) then
     key := #0;
end;

procedure Tfrmcombustivel.edtvalorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',',', #8]) then
     key := #0;
end;

procedure Tfrmcombustivel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action         := caFree;
  frmcombustivel := nil;
end;

procedure Tfrmcombustivel.FormCreate(Sender: TObject);
begin
  TCombustivel.New.GetCombustivel(ModelDados.QryCombustivel);
end;

procedure Tfrmcombustivel.FormDestroy(Sender: TObject);
begin
  ModelDados.QryCombustivel.Close;
end;

procedure Tfrmcombustivel.FormShow(Sender: TObject);
begin
  LimparEdits(Self);
  btnalterar.Enabled    := False;
  pgcontrole.ActivePage := tbsconsulta;
  edtconsulta.SetFocus;
  Exit;
end;

procedure Tfrmcombustivel.GridCombustivelDblClick(Sender: TObject);
begin
  if not ModelDados.QryCombustivel.IsEmpty then
     btnalterarClick(Self);
end;

procedure Tfrmcombustivel.GridCombustivelEnter(Sender: TObject);
begin
  btnalterar.Enabled := not DsCombustivel.DataSet.IsEmpty;
end;

function Tfrmcombustivel.PostCombustivel(Value: String): Boolean;
begin
  var lCombustivel : TCadastroCombustivel := TCadastroCombustivel.Create;
  try
    case Value[1] of
         'I' : lCombustivel.Codigo    := 0;
         'U' : lCombustivel.Codigo    := Trim(edtcodigo.Text).ToInteger;
    end;

    lCombustivel.Descricao := Trim(edtdescricao.Text);
    lCombustivel.Valor     := ValFloat(edtvalor.Text);
    lCombustivel.Imposto   := ValFloat(edtimposto.Text);

    case Value[1] of
         'I' : Result  := lCombustivel.PostRegistro;
         'U' : Result  := lCombustivel.PutRegistro;
    end;
  finally
    lCombustivel.Free;
  end;
end;

procedure Tfrmcombustivel.btngravarClick(Sender: TObject);
begin
  CamposObrigatorios(Self);
  var lResult : Boolean;

  if Mensagem('Confima a manutenção do registro?', Tfrmconfirmar, frmconfirmar) = mrOk then
     lResult := PostCombustivel(cOpc);

  if lResult then begin
     Mensagem('Registro gravado com sucesso.', Tfrmsucesso, frmsucesso);
  end
  else
  begin
    Mensagem('Falha na manuteção do registro.', Tfrmerro, frmerro);
  end;

  cOpc := EmptyStr;
  TCombustivel.New.GetCombustivel(ModelDados.QryCombustivel);
  pgcontrole.ActivePage := tbsconsulta;
  edtconsulta.SetFocus;
  Exit;
end;

procedure Tfrmcombustivel.btnnovoClick(Sender: TObject);
begin
  cOpc                  := 'I';
  LimparEdits(Self);
  pgcontrole.ActivePage := tbscadastro;
  edtdescricao.SetFocus;
end;

procedure Tfrmcombustivel.btnalterarClick(Sender: TObject);
begin
  cOpc    := 'U';

  with ModelDados do begin
       edtcodigo.Text     := QryCombustivel.FieldByName('codigo').AsInteger.ToString;
       edtdescricao.Text  := QryCombustivel.FieldByName('descricao').AsString;
       edtvalor.Text      := FormatFloat(',0.00', QryCombustivel.FieldByName('valor').AsFloat);
       edtimposto.Text    := FormatFloat(',0.00', QryCombustivel.FieldByName('imposto').AsFloat);
  end;

  pgcontrole.ActivePage   := tbscadastro;
  edtdescricao.SetFocus;
  Exit;
end;

procedure Tfrmcombustivel.btncancelarClick(Sender: TObject);
begin
  if Mensagem('Cancelar a manutenção do registro?', Tfrmconfirmar, frmconfirmar) = mrOk then
     pgcontrole.ActivePage := tbsconsulta;
end;

end.
