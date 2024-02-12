unit Classe.Tanques;

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
  TTanques = class
  private
    Indice  : Integer;
    FConn   : TFDConnection;
    QryExec : TFDQuery;

    FDescricao  : String;
    FCodigo     : Integer;
    FCombustivel: Integer;
    FQuantidade : Double;

    procedure SetCodigo     (const Value: Integer);
    procedure SetCombustivel(const Value: Integer);
    procedure SetDescricao  (const Value: String);
    procedure SetQuantidade (const Value: Double);
  public
    constructor Create;
    destructor  Destroy; override;

    property Codigo      : Integer read FCodigo       write SetCodigo;
    property Descricao   : String  read FDescricao    write SetDescricao;
    property Combustivel : Integer read FCombustivel  write SetCombustivel;
    property Quantidade  : Double  read FQuantidade   write SetQuantidade;

    function PostTanques: Boolean;
    function PutTanques : Boolean;
  end;

implementation

uses
  View.Erro;

{ TTanques }
constructor TTanques.Create;
begin
  Indice   := Systems.Conexao.Conexao(PrefSys.PathBanco);
  FConn    := Systems.Conexao.FConnLista.Items[Indice];

  QryExec  := TFDQuery.Create(nil);
  QryExec.Connection := FConn;
end;

destructor TTanques.Destroy;
begin
  QryExec.Free;
  Systems.Conexao.Desconectar(Indice);

  inherited;
end;

function TTanques.PostTanques: Boolean;
begin
  Systems.Conexao.StartTransaction(FConn);
  try
    QryExec.Close;
    QryExec.SQL.Clear;
    QryExec.SQL.Add('Insert Into Tanques(Descricao, Codigo_Combustivel, Quantidade) ' +
                    '            Values(:Descricao,:Codigo_Combustivel,:Quantidade) ' );

    QryExec.ParamByName('Descricao').AsString           := Self.FDescricao;
    QryExec.ParamByName('Codigo_Combustivel').AsInteger := Self.FCombustivel;
    QryExec.ParamByName('Quantidade').AsFloat           := Self.FQuantidade;
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

function TTanques.PutTanques: Boolean;
begin
  Systems.Conexao.StartTransaction(FConn);
  try
    QryExec.Close;
    QryExec.SQL.Clear;
    QryExec.SQL.Add('Update Tanques Set                         ' +
                    '          Descricao = :Descricao,          ' +
                    ' Codigo_Combustivel = :Codigo_Combustivel, ' +
                    '         Quantidade = :Quantidade          ' +
                    'Where  Codigo = :Codigo                    ' );

    QryExec.ParamByName('Codigo').AsInteger             := Self.FCodigo;
    QryExec.ParamByName('Descricao').AsString           := Self.FDescricao;
    QryExec.ParamByName('Codigo_Combustivel').AsInteger := Self.FCombustivel;
    QryExec.ParamByName('Quantidade').AsFloat           := Self.FQuantidade;
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

procedure TTanques.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TTanques.SetCombustivel(const Value: Integer);
begin
  FCombustivel := Value;
end;

procedure TTanques.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TTanques.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

end.
