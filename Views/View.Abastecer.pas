unit View.Abastecer;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  Systems.Common,

  Controllers.Combustivel,
  Classe.Abastecimento,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.DBCtrls,

  Data.DB;

type
  Tfrmabastecer = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnnovo: TSpeedButton;
    btncancela: TSpeedButton;
    btnsair: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbbomba: TDBLookupComboBox;
    edttipo: TEdit;
    Label2: TLabel;
    edtvalorlitro: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtlitros: TEdit;
    Label4: TLabel;
    edtpagar: TEdit;
    DsAbastece: TDataSource;
    Label5: TLabel;
    edtqtde: TEdit;
    Label6: TLabel;
    edtimposto: TEdit;
    btnabastece: TBitBtn;
    procedure btnsairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure DsAbasteceDataChange(Sender: TObject; Field: TField);
    procedure edtlitrosKeyPress(Sender: TObject; var Key: Char);
    procedure btnabasteceClick(Sender: TObject);
    procedure btncancelaClick(Sender: TObject);
  private
    { Private declarations }
    procedure CalcularAbastecimento;
    function  PostAbastecer: Boolean;
  public
    { Public declarations }
  end;

var
  frmabastecer: Tfrmabastecer;

implementation

uses
  Models.Dados,
  View.Confirmacao,
  View.Sucesso,
  View.Erro,
  View.Aviso;

{$R *.dfm}
procedure Tfrmabastecer.btnabasteceClick(Sender: TObject);
begin
  CamposObrigatorios(Self);

  if ValFloat(edtqtde.Text) = 0 then begin
     Mensagem('Não ha quantidade em estoque para abastecimento!!', Tfrmaviso, frmaviso);
     btncancelaClick(Self);
     Exit;
  end;

  if ValFloat(edtqtde.Text) < ValFloat(edtlitros.Text) then begin
     Mensagem('Quantidade de litros para abastecimento, e superior a quantidade disponivel em estoque.', Tfrmaviso, frmaviso);
     edtlitros.SetFocus;
     Exit;
  end;

  var lResult : Boolean;

  if Mensagem('Confima abastecimento?', Tfrmconfirmar, frmconfirmar) = mrOk then
     lResult := PostAbastecer;

  if lResult then begin
     Mensagem('Abastecimento realizado com sucesso.', Tfrmsucesso, frmsucesso);
  end
  else
  begin
    Mensagem('Falha ao abastecer.', Tfrmerro, frmerro);
  end;

  if Mensagem('Realizar novo abastecimento?', Tfrmconfirmar, frmconfirmar) = mrOk then begin
     LimparEdits(Self);
     TCombustivel.New.GetAbastece(ModelDados.QryAbastece);
     cbbomba.KeyValue    := 0;
     btnnovo.Visible     := False;
     btncancela.Visible  := True;
     btnabastece.Visible := True;
     edtlitros.Enabled   := True;
     cbbomba.Enabled     := True;
     cbbomba.SetFocus;
     Exit;
  end
  else
  begin
    LimparEdits(Self);
    cbbomba.KeyValue    := 0;
    btnnovo.Visible     := True;
    btncancela.Visible  := False;
    btnabastece.Visible := False;
    edtlitros.Enabled   := False;
    cbbomba.Enabled     := False;
  end;
end;

procedure Tfrmabastecer.btncancelaClick(Sender: TObject);
begin
  if Mensagem('Deseja cancelar o abastecimento?', Tfrmconfirmar, frmconfirmar) = mrOk then begin
     LimparEdits(Self);
     cbbomba.KeyValue    := 0;
     btnnovo.Visible     := True;
     btncancela.Visible  := False;
     btnabastece.Visible := False;
     edtlitros.Enabled   := False;
     cbbomba.Enabled     := False;
  end;
end;

procedure Tfrmabastecer.btnnovoClick(Sender: TObject);
begin
  TCombustivel.New.GetAbastece(ModelDados.QryAbastece);
  btnnovo.Visible     := False;
  btncancela.Visible  := True;
  btnabastece.Visible := True;
  edtlitros.Enabled   := True;
  cbbomba.Enabled     := True;
  cbbomba.SetFocus;
end;

procedure Tfrmabastecer.btnsairClick(Sender: TObject);
begin
  if (btncancela.Visible) and (btnabastece.Visible) then begin
     if Mensagem(Format('O abastecimento sera cancelado.%sDeseja sair do abastecimento?',[sLineBreak]), Tfrmconfirmar, frmconfirmar) = mrOk then
        Close;
  end
  else Close;
end;

procedure Tfrmabastecer.CalcularAbastecimento;
begin
  var lPagar    : Double := ModelDados.QryAbastece.FieldByName('valor').AsFloat * ValFloat(edtlitros.Text);
  var lImposto  : Double := (lPagar * (ModelDados.QryAbastece.FieldByName('imposto').AsFloat/100));

  edtpagar.Text   := FormatFloat(',0.00', lPagar);
  edtimposto.Text := FormatFloat(',0.00', lImposto);
end;

procedure Tfrmabastecer.DsAbasteceDataChange(Sender: TObject; Field: TField);
begin
  if cbbomba.KeyValue > 0 then begin
     edttipo.Text        := ModelDados.QryAbastece.FieldByName('tipo').AsString;
     edtvalorlitro.Text  := FormatFloat(',0.00', ModelDados.QryAbastece.FieldByName('valor').AsFloat);
     edtqtde.Text        := FormatFloat(',0.000', ModelDados.QryAbastece.FieldByName('quantidade').AsFloat);
     edtlitros.SetFocus;
  end
  else
  begin
     edttipo.Text        := EmptyStr;
     edtvalorlitro.Text  := EmptyStr;
     edtqtde.Text        := EmptyStr;
  end;
end;

procedure Tfrmabastecer.edtlitrosKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',',', #8]) then
     key := #0;

  if (key = #0) then begin
     CalcularAbastecimento;
     btnabastece.SetFocus;
  end;
end;

procedure Tfrmabastecer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action       := caFree;
  frmabastecer := Nil;
end;

procedure Tfrmabastecer.FormShow(Sender: TObject);
begin
  LimparEdits(Self);
  btncancela.Visible  := False;
  btnabastece.Visible := False;
  btnnovo.Visible     := True;
  edtlitros.Enabled   := False;
  cbbomba.Enabled     := False;
end;

function Tfrmabastecer.PostAbastecer: Boolean;
begin
  var lAbastece : TAbastece := TAbastece.Create;
  try
    lAbastece.Data         := Now;
    lAbastece.Bomba        := cbbomba.KeyValue;
    lAbastece.Litros       := ValFloat(edtlitros.Text);
    lAbastece.Valor        := ValFloat(edtpagar.Text);
    lAbastece.Imposto      := ValFloat(edtimposto.Text);
    lAbastece.Tanque       := ModelDados.QryAbastece.FieldByName('codigo_tanque').AsInteger;
    lAbastece.Combustivel  := ModelDados.QryAbastece.FieldByName('codigo_combustivel').AsInteger;
    Result := lAbastece.PostAbastecimento;
  finally
    lAbastece.Free;
  end;
end;

end.
