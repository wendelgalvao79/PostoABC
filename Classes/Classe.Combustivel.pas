unit Classe.Combustivel;

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
  TCadastroCombustivel = class
  private
    Indice    : Integer;
    QryExec   : TFDQuery;
    FConn     : TFDConnection;

    FValor    : Double;
    FDescricao: String;
    FCodigo   : Integer;
    FImposto  : Double;

    procedure SetCodigo   (const Value: Integer);
    procedure SetDescricao(const Value: String);
    procedure SetImposto  (const Value: Double);
    procedure SetValor    (const Value: Double);
  public
    constructor Create;
    destructor  Destroy; override;

    property Codigo    : Integer read FCodigo    write SetCodigo;
    property Descricao : String  read FDescricao write SetDescricao;
    property Valor     : Double  read FValor     write SetValor;
    property Imposto   : Double  read FImposto   write SetImposto;

    function PostRegistro: Boolean;
    function PutRegistro : Boolean;
  end;

implementation

uses
  View.Erro;

{ TCadastroCombustivel }
constructor TCadastroCombustivel.Create;
begin
  Indice    := Systems.Conexao.Conexao(PrefSys.PathBanco);
  FConn     := Systems.Conexao.FConnLista.Items[Indice];

  QryExec   := TFDQuery.Create(nil);
  QryExec.Connection := FConn;
end;

destructor TCadastroCombustivel.Destroy;
begin
  QryExec.Free;
  Systems.Conexao.Desconectar(Indice);

  inherited;
end;

function TCadastroCombustivel.PostRegistro: Boolean;
begin
  Systems.Conexao.StartTransaction(FConn);
  try
    QryExec.Close;
    QryExec.SQL.Clear;
    QryExec.SQL.Add('Insert Into Combustivel(Descricao, Valor, Imposto) ' +
                    '                Values(:Descricao,:Valor,:Imposto) ' );

    QryExec.ParamByName('Descricao').AsString   := Self.FDescricao;
    QryExec.ParamByName('Valor').AsFloat        := Self.FValor;
    QryExec.ParamByName('Imposto').AsFloat      := Self.FImposto;
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

function TCadastroCombustivel.PutRegistro: Boolean;
begin
  Systems.Conexao.StartTransaction(FConn);
  try
    QryExec.Close;
    QryExec.SQL.Clear;
    QryExec.SQL.Add('Update Combustivel Set     ' +
                    '  Descricao  = :Descricao, ' +
                    '      Valor  = :Valor,     ' +
                    '    Imposto  = :imposto    ' +
                    'Where Codigo = :Codigo     ' );

    QryExec.ParamByName('Codigo').AsInteger     := Self.FCodigo;
    QryExec.ParamByName('Descricao').AsString   := Self.FDescricao;
    QryExec.ParamByName('Valor').AsFloat        := Self.FValor;
    QryExec.ParamByName('Imposto').AsFloat      := Self.FImposto;
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

procedure TCadastroCombustivel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCadastroCombustivel.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TCadastroCombustivel.SetImposto(const Value: Double);
begin
  FImposto := Value;
end;

procedure TCadastroCombustivel.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.
