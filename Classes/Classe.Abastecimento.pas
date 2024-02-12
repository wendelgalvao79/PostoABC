unit Classe.Abastecimento;

interface

uses
  Winapi.Windows,
  Vcl.Forms,

  Systems.Paramtrs,
  Systems.Conexao,
  Systems.Common,
  System.SysUtils,
  System.DateUtils,

  FireDAC.Comp.Client;

type
  TAbastece = class
  private
    Indice      : Integer;
    FConn       : TFDConnection;
    QryExec     : TFDQuery;

    FBomba      : Integer;
    FValor      : Double;
    FTanque     : Integer;
    FLitros     : Double;
    FCombustivel: Integer;
    FImposto    : Double;
    FData       : TDateTime;

    procedure SetBomba      (const Value: Integer);
    procedure SetCombustivel(const Value: Integer);
    procedure SetData       (const Value: TDateTime);
    procedure SetImposto    (const Value: Double);
    procedure SetLitros     (const Value: Double);
    procedure SetTanque     (const Value: Integer);
    procedure SetValor      (const Value: Double);

    procedure AtualizarLitrosTanqueDisponivel(Codigo: Integer; Litros: Double);
  public
    constructor Create;
    destructor  Destroy; override;

    property Data        : TDateTime read FData        write SetData;
    property Bomba       : Integer   read FBomba       write SetBomba;
    property Litros      : Double    read FLitros      write SetLitros;
    property Valor       : Double    read FValor       write SetValor;
    property Imposto     : Double    read FImposto     write SetImposto;
    property Tanque      : Integer   read FTanque      write SetTanque;
    property Combustivel : Integer   read FCombustivel write SetCombustivel;

    function PostAbastecimento: Boolean;
  end;

implementation

uses
  View.Erro;

{ TAbastece }
procedure TAbastece.AtualizarLitrosTanqueDisponivel(Codigo: Integer; Litros: Double);
begin
  QryExec.Close;
  QryExec.SQL.Clear;
  QryExec.SQL.Add('Update Tanques Set                 ' +
                  '   Quantidade = Quantidade - :Qtde ' +
                  'Where Codigo  = :Codigo            ' );

  QryExec.ParamByName('Codigo').AsInteger  := Codigo;
  QryExec.ParamByName('Qtde').AsFloat      := Litros;
  QryExec.ExecSQL;
end;

constructor TAbastece.Create;
begin
  Indice     := Systems.Conexao.Conexao(PrefSys.PathBanco);
  FConn      := Systems.Conexao.FConnLista.Items[Indice];

  QryExec    := TFDQuery.Create(nil);
  QryExec.Connection  := FConn;
end;

destructor TAbastece.Destroy;
begin
  QryExec.Free;
  Systems.Conexao.Desconectar(Indice);

  inherited;
end;

function TAbastece.PostAbastecimento: Boolean;
begin
  Systems.Conexao.StartTransaction(FConn);
  try
    QryExec.Close;
    QryExec.SQL.Clear;
    QryExec.SQL.Add('Insert Into Abastecimento(Data, Bomba, Litros, Valor_Abastecimento, Valor_Imposto, Codigo_Tanque, Codigo_Combustivel) ' +
                    '                  Values(:Data,:Bomba,:Litros,:Valor_Abastecimento,:Valor_Imposto,:Codigo_Tanque,:Codigo_Combustivel) ' );

    QryExec.ParamByName('Data').AsDateTime              := Self.Data;
    QryExec.ParamByName('Bomba').AsInteger              := Self.FBomba;
    QryExec.ParamByName('Litros').AsFloat               := Self.FLitros;
    QryExec.ParamByName('Valor_Abastecimento').AsFloat  := Self.FValor;
    QryExec.ParamByName('Valor_Imposto').AsFloat        := Self.FImposto;
    QryExec.ParamByName('Codigo_Tanque').AsInteger      := Self.FTanque;
    QryExec.ParamByName('Codigo_Combustivel').AsInteger := Self.FCombustivel;
    QryExec.ExecSQL;

    AtualizarLitrosTanqueDisponivel(Self.FTanque, Self.FLitros);
    Systems.Conexao.CommitTransacao(FConn);
    Result := True;
  except
    on e:exception do begin
       Systems.Conexao.RollbackTransacao(FConn);
       Result := False;
       vModal := Mensagem(e.message, Tfrmerro, frmerro);
    end;
  end;
end;

procedure TAbastece.SetBomba(const Value: Integer);
begin
  FBomba := Value;
end;

procedure TAbastece.SetCombustivel(const Value: Integer);
begin
  FCombustivel := Value;
end;

procedure TAbastece.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TAbastece.SetImposto(const Value: Double);
begin
  FImposto := Value;
end;

procedure TAbastece.SetLitros(const Value: Double);
begin
  FLitros := Value;
end;

procedure TAbastece.SetTanque(const Value: Integer);
begin
  FTanque := Value;
end;

procedure TAbastece.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.
