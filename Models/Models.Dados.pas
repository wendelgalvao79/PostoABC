unit Models.Dados;

interface

uses
  System.SysUtils,
  System.Classes,

  IniFiles,
  Systems.Paramtrs,

  Vcl.Forms,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Stan.Async,
  FireDAC.DApt,

  Data.DB;

type
  TModelDados = class(TDataModule)
    QryCombustivel: TFDQuery;
    QryCombustivelCODIGO: TIntegerField;
    QryCombustivelDESCRICAO: TStringField;
    QryCombustivelVALOR: TFMTBCDField;
    QryCombustivelIMPOSTO: TFMTBCDField;
    QryTanques: TFDQuery;
    QryTanquesCODIGO: TIntegerField;
    QryTanquesDESCRICAO: TStringField;
    QryTanquesCODIGO_COMBUSTIVEL: TIntegerField;
    QryTanquesTIPO: TStringField;
    QryTanquesQUANTIDADE: TFMTBCDField;
    QryBombas: TFDQuery;
    QryBombasCODIGO: TIntegerField;
    QryBombasDESCRICAO: TStringField;
    QryBombasCODIGO_TANQUE: TIntegerField;
    QryBombasCODIGO_COMBUSTIVEL: TIntegerField;
    QryBombasTANQUE: TStringField;
    QryBombasCOMBUSTIVEL: TStringField;
    QryAbastecimento: TFDQuery;
    QryAbastecimentoCODIGO: TIntegerField;
    QryAbastecimentoBOMBA: TIntegerField;
    QryAbastecimentoDESCRICAO: TStringField;
    QryAbastecimentoLITROS: TFMTBCDField;
    QryAbastecimentoVALOR_ABASTECIMENTO: TFMTBCDField;
    QryAbastecimentoCODIGO_TANQUE: TIntegerField;
    QryAbastecimentoCODIGO_COMBUSTIVEL: TIntegerField;
    QryAbastecimentoTIPO: TStringField;
    QryAbastecimentoVALOR_IMPOSTO: TFMTBCDField;
    QryAbastece: TFDQuery;
    QryAbasteceCODIGO: TIntegerField;
    QryAbasteceDESCRICAO: TStringField;
    QryAbasteceTIPO: TStringField;
    QryAbasteceVALOR: TFMTBCDField;
    QryAbasteceIMPOSTO: TFMTBCDField;
    QryAbasteceQUANTIDADE: TFMTBCDField;
    QryAbasteceCODIGO_TANQUE: TIntegerField;
    QryAbasteceCODIGO_COMBUSTIVEL: TIntegerField;
    QryAbastecimentoDATA: TSQLTimeStampField;
    QryRelatorio: TFDQuery;
    QryRelatorioDATA: TSQLTimeStampField;
    QryRelatorioCOMBUSTIVEL: TStringField;
    QryRelatorioBOMBA: TStringField;
    QryRelatorioLITROS: TFMTBCDField;
    QryRelatorioVALOR: TFMTBCDField;
    QryRelatorioVALOR_ABASTECIMENTO: TFMTBCDField;
    QryRelatorioVALOR_IMPOSTO: TFMTBCDField;
    QryRelatorioCODIGO_COMBUSTIVEL: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModelDados: TModelDados;

implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  View.Conexao;

{$R *.dfm}
procedure TModelDados.DataModuleCreate(Sender: TObject);
begin
  if not FileExists(Format('%s\conexao.dll',[ExtractFilePath(ParamStr(0))])) then begin
     Application.CreateForm(Tfrmconexao, frmconexao);
     frmconexao.ShowModal;
     FreeAndNil(frmconexao);
  end;

  var lArquivo : TIniFile := TIniFile.Create(Format('%s\conexao.dll',[ExtractFilePath(ParamStr(0))]));
  PrefSys.PathBanco       := lArquivo.ReadString('ABC','DataBase','');
end;

end.
