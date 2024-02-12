unit View.Bombas;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Systems.Common,
  Classe.Bombas,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.DBCtrls,
  Vcl.ComCtrls,

  Data.DB, Vcl.Mask;

type
  Tfrmbombas = class(TForm)
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
    Label3: TLabel;
    edtcodigo: TEdit;
    edtdescricao: TEdit;
    cbtanque: TDBLookupComboBox;
    tbsconsulta: TTabSheet;
    Panel2: TPanel;
    btnnovo: TSpeedButton;
    btnalterar: TSpeedButton;
    btnsair: TBitBtn;
    RadioGroup1: TRadioGroup;
    edtconsulta: TEdit;
    GridBombas: TDBGrid;
    Panel1: TPanel;
    DsBombas: TDataSource;
    DsTanque: TDataSource;
    DBEdit1: TDBEdit;
    procedure btnsairClick(Sender: TObject);
    procedure edtconsultaChange(Sender: TObject);
    procedure edtconsultaEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridBombasDblClick(Sender: TObject);
    procedure GridBombasEnter(Sender: TObject);
    procedure btngravarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
  private
    { Private declarations }
    function PostBicosBomba(Value: String): Boolean;
  public
    { Public declarations }
  end;

var
  frmbombas: Tfrmbombas;
  cOpcB    : String;

implementation

uses
  Controllers.Combustivel,
  View.Confirmacao,
  View.Sucesso,
  View.Erro,
  Models.Dados;

{$R *.dfm}
procedure Tfrmbombas.btnalterarClick(Sender: TObject);
begin
  cOpcB    := 'U';
  TCombustivel.New.GetTanques(ModelDados.QryTanques);

  with ModelDados do begin
       edtcodigo.Text         := QryBombas.FieldByName('codigo').AsInteger.ToString;
       edtdescricao.Text      := QryBombas.FieldByName('descricao').AsString;
       cbtanque.KeyValue      := QryBombas.FieldByName('codigo_tanque').AsInteger;
  end;

  pgcontrole.ActivePage   := tbscadastro;
  edtdescricao.SetFocus;
  Exit;
end;

procedure Tfrmbombas.btncancelarClick(Sender: TObject);
begin
  if Mensagem('Cancelar a manutenção do registro?', Tfrmconfirmar, frmconfirmar) = mrOk then
     pgcontrole.ActivePage := tbsconsulta;
end;

procedure Tfrmbombas.btngravarClick(Sender: TObject);
begin
  CamposObrigatorios(Self);
  var lResult : Boolean;

  if Mensagem('Confima a manutenção do registro?', Tfrmconfirmar, frmconfirmar) = mrOk then
     lResult := PostBicosBomba(cOpcB);

  if lResult then begin
     Mensagem('Registro gravado com sucesso.', Tfrmsucesso, frmsucesso);
  end
  else
  begin
    Mensagem('Falha na manuteção do registro.', Tfrmerro, frmerro);
  end;

  cOpcB := EmptyStr;
  TCombustivel.New.GetBombas(ModelDados.QryBombas);
  pgcontrole.ActivePage := tbsconsulta;
  edtconsulta.SetFocus;
  Exit;
end;

procedure Tfrmbombas.btnnovoClick(Sender: TObject);
begin
  cOpcB  := 'I';
  LimparEdits(Self);
  TCombustivel.New.GetTanques(ModelDados.QryTanques);
  pgcontrole.ActivePage   := tbscadastro;
  cbtanque.KeyValue       := ModelDados.QryTanquesCODIGO_COMBUSTIVEL.AsInteger;
  edtdescricao.SetFocus;
end;

procedure Tfrmbombas.btnsairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrmbombas.edtconsultaChange(Sender: TObject);
begin
  if Length(edtconsulta.Text) >= 3 then begin
     with ModelDados do begin
          try
            QryBombas.Filtered := True;
            QryBombas.Filter   := 'descricao like ' + QuotedStr('%' + edtconsulta.Text + '%');
          except
            QryBombas.Filtered := False;
            QryBombas.First;
          end;
     end;
  end
  else
  begin
    ModelDados.QryBombas.Filtered := False;
    ModelDados.QryBombas.First;
  end;
end;

procedure Tfrmbombas.edtconsultaEnter(Sender: TObject);
begin
  btnalterar.Enabled  := not edtconsulta.Focused;
end;

procedure Tfrmbombas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action    := caFree;
  frmbombas := Nil;
end;

procedure Tfrmbombas.FormCreate(Sender: TObject);
begin
  TCombustivel.New.GetBombas(ModelDados.QryBombas);
end;

procedure Tfrmbombas.FormDestroy(Sender: TObject);
begin
  ModelDados.QryBombas.Close;
  ModelDados.QryTanques.Close;
end;

procedure Tfrmbombas.FormShow(Sender: TObject);
begin
  LimparEdits(Self);
  btnalterar.Enabled    := False;
  pgcontrole.ActivePage := tbsconsulta;
  edtconsulta.SetFocus;
  Exit;
end;

procedure Tfrmbombas.GridBombasDblClick(Sender: TObject);
begin
  if not ModelDados.QryBombas.IsEmpty then
     btnalterarClick(Self);
end;

procedure Tfrmbombas.GridBombasEnter(Sender: TObject);
begin
  btnalterar.Enabled  := not DsBombas.DataSet.IsEmpty;
end;

function Tfrmbombas.PostBicosBomba(Value: String): Boolean;
begin
  var lBombas : TBicos := TBicos.Create;
  try
    case Value[1] of
         'I' : lBombas.Codigo    := 0;
         'U' : lBombas.Codigo    := Trim(edtcodigo.Text).ToInteger;
    end;

    lBombas.Descricao   := Trim(edtdescricao.Text);
    lBombas.Tanque      := cbtanque.KeyValue;
    lBombas.Combustivel := ModelDados.QryTanquesCODIGO_COMBUSTIVEL.AsInteger;

    case Value[1] of
         'I' : Result  := lBombas.PostBicosBombas;
         'U' : Result  := lBombas.PutBicosBombas;
    end;
  finally
    lBombas.Free;
  end;
end;

end.
