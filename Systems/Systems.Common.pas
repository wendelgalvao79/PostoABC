unit Systems.Common;

interface

uses
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Graphics,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.DBCtrls,

  System.SysUtils,
  System.Classes,
  System.Variants,

  Systems.Paramtrs,
  View.Aviso,

  IniFiles;

{=**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
                                                        SESSÃO DAS FUNCTION´S DO SISTEMA
=*==*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
function Mensagem(Value: String; FormClass: TFormClass; Form: TForm): TModalResult;
function EnterTabExit(const Key: Integer): Boolean;
function ValFloat(Value: String): Real;


{=**=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
                                                        SESSÃO DAS PROCEDURE´S DO SISTEMA
=*==*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=}
procedure ChamarForm(FormClass: TFormClass; Form: TForm; Panel: TPanel);
procedure CriarDll(Path: String; Arquivo: String; Secao: String; Chave: String; Value: String);
procedure ConexaoBD(Value: String);
procedure LimparEdits(Sender: TObject);
procedure CamposObrigatorios(Sender: TObject);

implementation

procedure ChamarForm(FormClass: TFormClass; Form: TForm; Panel: TPanel);
begin
  if Form = nil then
     Application.CreateForm(FormClass, Form);

  Form.Parent      := Panel;
  Form.Align       := alClient;
  Form.BorderStyle := bsNone;
  Form.Show;
end;

procedure CriarDll(Path: String; Arquivo: String; Secao: String; Chave: String; Value: String);
begin
  var vArq : TIniFile := TIniFile.Create(Format('%s%s',[Path, Arquivo]));
  try
    vArq.WriteString(Secao, Chave, Value);
  finally
    vArq.Free;
  end;
end;

procedure ConexaoBD(Value: String);
begin
  CriarDll(ExtractFilePath(Application.ExeName), 'conexao.dll','ABC','DataBase', Value);
end;

function Mensagem(Value: String; FormClass: TFormClass; Form: TForm): TModalResult;
begin
  Application.CreateForm(FormClass, Form);
  vMensagem  := Value;

  Form.BringToFront;
  Form.ShowModal;

  Result     := Form.ModalResult;
  FreeAndNil(Form);
end;

procedure LimparEdits(Sender: TObject);
begin
  for var lContar := 0 to Pred(TForm(Sender).ComponentCount) do begin
      if TForm(Sender).Components[lContar] is TEdit then
         TEdit(TForm(Sender).Components[lContar]).Text  := EmptyStr;
  end;
end;

function EnterTabExit(const Key: Integer): Boolean;
begin
  Result := GetKeyState(Key) and 128 > 0;
end;

procedure CamposObrigatorios(Sender: TObject);
begin
  for var lContar := 0 to Pred(TForm(Sender).ComponentCount) do begin
      if TForm(Sender).Components[lContar].Tag = 0 then begin
         if TForm(Sender).Components[lContar] is TEdit then begin
            if ((TForm(Sender).Components[lContar] as TEdit).Hint <> '') and
               ((TForm(Sender).Components[lContar] as TEdit).Visible)    and
               ((TForm(Sender).Components[lContar] as TEdit).Text = '') then begin
               Mensagem(Format('O preenchimento do campo %s é obrigatório.',[(TForm(Sender).Components[lContar] as TEdit).Hint]), Tfrmaviso, frmaviso);
               (TForm(Sender).Components[lContar] as TEdit).SetFocus;
               Abort;
            end;
         end;

         if TForm(Sender).Components[lContar] is TDBLookupComboBox then begin
            if ((TForm(Sender).Components[lContar] as TDBLookupComboBox).Hint <> '') and
               ((TForm(Sender).Components[lContar] as TDBLookupComboBox).Visible)    and
               ((TForm(Sender).Components[lContar] as TDBLookupComboBox).Text = '') then begin
               Mensagem(Format('O preenchimento do campo %s é obrigatório.',[(TForm(Sender).Components[lContar] as TDBLookupComboBox).Hint]), Tfrmaviso, frmaviso);
               (TForm(Sender).Components[lContar] as TDBLookupComboBox).SetFocus;
               Abort;
            end;
         end;
      end;
  end;
end;

function ValFloat(Value: String): Real;
begin
  var lMaux   : String  := '';
  var lDec    : Boolean := False;

  for var lContar := 1 to Length(Value) do begin
      if Value[lContar] in['0'..'9'] then
         lMaux := lMaux + Value[lContar]
      else
      if (Value[lContar] = '-') and (lContar = 1) then
         lMaux := lMaux + Value[lContar]
      else
      if Value[lContar] = FormatSettings.DecimalSeparator then begin
         if not lDec then begin
            lMaux := lMaux + Value[lContar];
            lDec  := True;
         end;
      end;
  end;

  if lMaux.Equals('') then
     lMaux := '0';

  Result := StrToFloat(lMaux);
end;

end.
