unit View.Tanques;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Systems.Common,
  Classe.Tanques,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.DBCtrls,

  Data.DB;

type
  Tfrmtanques = class(TForm)
    pnlfundo: TPanel;
    pgcontrole: TPageControl;
    tbscadastro: TTabSheet;
    Panel3: TPanel;
    btngravar: TSpeedButton;
    btncancelar: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edtcodigo: TEdit;
    edtdescricao: TEdit;
    tbsconsulta: TTabSheet;
    Panel2: TPanel;
    btnnovo: TSpeedButton;
    btnalterar: TSpeedButton;
    btnsair: TBitBtn;
    RadioGroup1: TRadioGroup;
    edtconsulta: TEdit;
    GridTanques: TDBGrid;
    Panel1: TPanel;
    cbcombustivel: TDBLookupComboBox;
    DsCombustivel: TDataSource;
    Label3: TLabel;
    edtqtde: TEdit;
    DsTanques: TDataSource;
    procedure btnsairClick(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure edtconsultaEnter(Sender: TObject);
    procedure edtqtdeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridTanquesDblClick(Sender: TObject);
    procedure GridTanquesEnter(Sender: TObject);
    procedure btngravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edtconsultaChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function ManutencaoTanques(Value: String): Boolean;
  public
    { Public declarations }
  end;

var
  frmtanques: Tfrmtanques;
  cOpcT     : String;

implementation

uses
  Models.Dados,
  Controllers.Combustivel,

  View.Confirmacao,
  View.Sucesso,
  View.Erro;

{$R *.dfm}
procedure Tfrmtanques.btnalterarClick(Sender: TObject);
begin
  cOpcT    := 'U';
  TCombustivel.New.GetCombustivel(ModelDados.QryCombustivel);

  with ModelDados do begin
       edtcodigo.Text         := QryTanques.FieldByName('codigo').AsInteger.ToString;
       edtdescricao.Text      := QryTanques.FieldByName('descricao').AsString;
       cbcombustivel.KeyValue := QryTanques.FieldByName('codigo_combustivel').AsInteger;
       edtqtde.Text           := FormatFloat(',0.00', QryTanques.FieldByName('quantidade').AsFloat);
  end;

  pgcontrole.ActivePage   := tbscadastro;
  edtdescricao.SetFocus;
  Exit;
end;

procedure Tfrmtanques.btncancelarClick(Sender: TObject);
begin
  if Mensagem('Cancelar a manutenção do registro?', Tfrmconfirmar, frmconfirmar) = mrOk then
     pgcontrole.ActivePage := tbsconsulta;
end;

procedure Tfrmtanques.btngravarClick(Sender: TObject);
begin
  CamposObrigatorios(Self);
  var lResult : Boolean;

  if Mensagem('Confima a manutenção do registro?', Tfrmconfirmar, frmconfirmar) = mrOk then
     lResult := ManutencaoTanques(cOpcT);

  if lResult then begin
     Mensagem('Registro gravado com sucesso.', Tfrmsucesso, frmsucesso);
  end
  else
  begin
    Mensagem('Falha na manuteção do registro.', Tfrmerro, frmerro);
  end;

  cOpcT := EmptyStr;
  TCombustivel.New.GetTanques(ModelDados.QryTanques);
  pgcontrole.ActivePage := tbsconsulta;
  edtconsulta.SetFocus;
  Exit;
end;

procedure Tfrmtanques.btnnovoClick(Sender: TObject);
begin
  cOpcT  := 'I';
  LimparEdits(Self);
  TCombustivel.New.GetCombustivel(ModelDados.QryCombustivel);
  pgcontrole.ActivePage := tbscadastro;
  edtdescricao.SetFocus;
end;

procedure Tfrmtanques.btnsairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrmtanques.edtconsultaChange(Sender: TObject);
begin
  if Length(edtconsulta.Text) >= 3 then begin
     with ModelDados do begin
          try
            QryTanques.Filtered := True;
            QryTanques.Filter   := 'descricao like ' + QuotedStr('%' + edtconsulta.Text + '%');
          except
            QryTanques.Filtered := False;
            QryTanques.First;
          end;
     end;
  end
  else
  begin
    ModelDados.QryTanques.Filtered := False;
    ModelDados.QryTanques.First;
  end;
end;

procedure Tfrmtanques.edtconsultaEnter(Sender: TObject);
begin
  btnalterar.Enabled  := not edtconsulta.Focused;
end;

procedure Tfrmtanques.edtqtdeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',',', #8]) then
     key := #0;
end;

procedure Tfrmtanques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action     := caFree;
  frmtanques := nil;
end;

procedure Tfrmtanques.FormCreate(Sender: TObject);
begin
  TCombustivel.New.GetTanques(ModelDados.QryTanques);
end;

procedure Tfrmtanques.FormDestroy(Sender: TObject);
begin
  ModelDados.QryTanques.Close;
  ModelDados.QryCombustivel.Close;
end;

procedure Tfrmtanques.FormShow(Sender: TObject);
begin
  LimparEdits(Self);
  btnalterar.Enabled    := False;
  pgcontrole.ActivePage := tbsconsulta;
  edtconsulta.SetFocus;
  Exit;
end;

procedure Tfrmtanques.GridTanquesDblClick(Sender: TObject);
begin
  if not ModelDados.QryTanques.IsEmpty then
     btnalterarClick(Self);
end;

procedure Tfrmtanques.GridTanquesEnter(Sender: TObject);
begin
  btnalterar.Enabled  := not DsTanques.DataSet.IsEmpty;
end;

function Tfrmtanques.ManutencaoTanques(Value: String): Boolean;
begin
  var lTanques : TTanques := TTanques.Create;
  try
    case Value[1] of
         'I' : lTanques.Codigo   := 0;
         'U' : lTanques.Codigo   := Trim(edtcodigo.Text).ToInteger;
    end;

    lTanques.Descricao    := Trim(edtdescricao.Text);
    lTanques.Combustivel  := cbcombustivel.KeyValue;
    lTanques.Quantidade   := ValFloat(edtqtde.Text);

    case Value[1] of
         'I' : Result := lTanques.PostTanques;
         'U' : Result := lTanques.PutTanques;
    end;
  finally
    lTanques.Free;
  end;
end;

end.
