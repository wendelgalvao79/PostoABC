unit Classe.Bombas;

interface

uses
  Winapi.Windows,
  Vcl.Forms,

  Systems.Paramtrs,
  Systems.Conexao,
  Systems.Common,
  System.SysUtils,

  FireDAC.Comp.Client;

type
  TBicos = class
  private
    Indice   : Integer;
    FConn    : TFDConnection;
    QryExec  : TFDQuery;

    FDescricao  : String;
    FCodigo     : Integer;
    FTanque     : Integer;
    FCombustivel: Integer;

    procedure SetCodigo     (const Value: Integer);
    procedure SetCombustivel(const Value: Integer);
    procedure SetDescricao  (const Value: String);
    procedure SetTanque     (const Value: Integer);
  public
    constructor Create;
    destructor  Destroy; override;

    property Codigo      : Integer read FCodigo      write SetCodigo;
    property Descricao   : String  read FDescricao   write SetDescricao;
    property Tanque      : Integer read FTanque      write SetTanque;
    property Combustivel : Integer read FCombustivel write SetCombustivel;

    function PostBicosBombas: Boolean;
    function PutBicosBombas: Boolean;
  end;

implementation

uses
  View.Erro;

{ TBicos }
constructor TBicos.Create;
begin
  Indice    := Systems.Conexao.Conexao(PrefSys.PathBanco);
  FConn     := Systems.Conexao.FConnLista.Items[Indice];

  QryExec   := TFDQuery.Create(nil);
  QryExec.Connection  := FConn;
end;

destructor TBicos.Destroy;
begin
  QryExec.Free;
  Systems.Conexao.Desconectar(Indice);

  inherited;
end;

function TBicos.PostBicosBombas: Boolean;
begin
  Systems.Conexao.StartTransaction(FConn);
  try
    QryExec.Close;
    QryExec.SQL.Clear;
    QryExec.SQL.Add('Insert Into Bombas(Descricao, Codigo_Tanque, Codigo_Combustivel) ' +
                    '           Values(:Descricao,:Codigo_Tanque,:Codigo_Combustivel) ' );

    QryExec.ParamByName('Descricao').AsString           := Self.FDescricao;
    QryExec.ParamByName('Codigo_Tanque').AsInteger      := Self.FTanque;
    QryExec.ParamByName('Codigo_Combustivel').AsInteger := Self.FCombustivel;
    QryExec.ExecSQL;

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

function TBicos.PutBicosBombas: Boolean;
begin
  Systems.Conexao.StartTransaction(FConn);
  try
    QryExec.Close;
    QryExec.SQL.Clear;
    QryExec.SQL.Add('Update Bombas Set                          ' +
                    '          Descricao = :Descricao,          ' +
                    ' Codigo_Combustivel = :Codigo_Combustivel, ' +
                    '      Codigo_Tanque = :Codigo_Tanque       ' +
                    'Where  Codigo = :Codigo                    ' );

    QryExec.ParamByName('Codigo').AsInteger             := Self.FCodigo;
    QryExec.ParamByName('Descricao').AsString           := Self.FDescricao;
    QryExec.ParamByName('Codigo_Combustivel').AsInteger := Self.FCombustivel;
    QryExec.ParamByName('Codigo_Tanque').AsInteger      := Self.FTanque;
    QryExec.ExecSQL;

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

procedure TBicos.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TBicos.SetCombustivel(const Value: Integer);
begin
  FCombustivel := Value;
end;

procedure TBicos.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TBicos.SetTanque(const Value: Integer);
begin
  FTanque := Value;
end;

end.
