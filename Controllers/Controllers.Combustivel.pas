unit Controllers.Combustivel;

interface

uses
  Systems.Conexao,
  Systems.Paramtrs,
  System.DateUtils,
  System.Classes,
  System.SysUtils,

  FireDAC.Comp.Client,
  Interfaces.Combustivel;

type
  TCombustivel = class(TInterfacedObject, ICombustivel)
  private
    Indice  : Integer;
    FConn   : TFDConnection;
  public
    constructor Create;
    destructor  Destroy; override;

    class function New: ICombustivel;

    procedure GetCombustivel  (Value: TFDQuery);
    procedure GetTanques      (Value: TFDQuery);
    procedure GetBombas       (Value: TFDQuery);
    procedure GetAbastecimento(Value: TFDQuery);
    procedure GetAbastece     (Value: TFDQuery);
    procedure GetRelatorio    (DataI: TDate; DataF: TDate; Value: TFDQuery);
  end;

implementation

{ TCombustivel }
constructor TCombustivel.Create;
begin
  Indice   := Systems.Conexao.Conexao(PrefSys.PathBanco);
  FConn    := Systems.Conexao.FConnLista.Items[Indice];
end;

destructor TCombustivel.Destroy;
begin
  inherited;
end;

procedure TCombustivel.GetAbastece(Value: TFDQuery);
begin
  Value.Connection   := FConn;

  Value.Close;
  Value.SQL.Clear;
  Value.SQL.Add('Select b.codigo, b.descricao, c.descricao as Tipo, c.valor, c.imposto, t.quantidade,  ' +
                '       b.codigo_tanque, b.codigo_combustivel                                          ' +
                'From bombas b inner join Tanques t     on(b.codigo = t.codigo)                        ' +
                '              inner join Combustivel c on(t.codigo_combustivel = c.codigo)            ' );

  Value.Open;
end;

procedure TCombustivel.GetAbastecimento(Value: TFDQuery);
begin
  Value.Connection   := FConn;

  Value.Close;
  Value.SQL.Clear;
  Value.SQL.Add('Select a.codigo, a.data, a.bomba, b.descricao, a.litros, a.valor_abastecimento,     ' +
                '       a.codigo_tanque, a.codigo_combustivel, c.descricao as Tipo, a.valor_imposto  ' +
                'From Abastecimento a inner join Bombas b      on(a.bomba = b.codigo)                ' +
                '                     inner join Combustivel c on(b.codigo_combustivel = c.codigo)   ' +
                'order by data desc, a.bomba                                                         ' );

  Value.Open;
end;

procedure TCombustivel.GetBombas(Value: TFDQuery);
begin
  Value.Connection   := FConn;

  Value.Close;
  Value.SQL.Clear;
  Value.SQL.Add('Select b.codigo, b.descricao, b.codigo_tanque, b.codigo_combustivel, ' +
                '       t.descricao as tanque, c.descricao as combustivel             ' +
                'From Bombas b inner join Tanques     t on(b.codigo = t.codigo)       ' +
                '              inner join Combustivel c on(c.codigo = t.codigo)       ' +
                'Order By b.codigo                                                    ' );

  Value.Open;
end;

procedure TCombustivel.GetCombustivel(Value: TFDQuery);
begin
  Value.Connection   := FConn;

  Value.Close;
  Value.SQL.Clear;
  Value.SQL.Add('Select Codigo, Descricao, Valor, Imposto ' +
                'From Combustivel                         ' +
                'Order By Codigo                          ' );

  Value.Open;
end;

procedure TCombustivel.GetRelatorio(DataI, DataF: TDate; Value: TFDQuery);
begin
  Value.Connection   := FConn;

  Value.Close;
  Value.SQL.Clear;
  Value.SQL.Add('Select a.data, c.descricao as combustivel, b.descricao as bomba, a.litros, c.valor,  ' +
                '       a.valor_abastecimento, valor_imposto, a.codigo_combustivel                    ' +
                'From Abastecimento a inner join Bombas b      on(a.bomba = b.codigo)                 ' +
                '                     inner join Combustivel c on(c.codigo = b.codigo_combustivel)    ' +
                'Where a.data between :pDataI and :pDataF                                             ' +
                'Order By a.codigo_combustivel, a.data                                                ' );

  Value.ParamByName('pDataI').AsDateTime := StrToDateTime(Format('%s%s',[DateToStr(DataI), '00:00:00']));
  Value.ParamByName('pDataF').AsDateTime := StrToDateTime(Format('%s%s',[DateToStr(DataF), '23:59:59']));
  Value.Open;
end;

procedure TCombustivel.GetTanques(Value: TFDQuery);
begin
  Value.Connection   := FConn;

  Value.Close;
  Value.SQL.Clear;
  Value.SQL.Add('Select t.codigo, t.descricao, t.codigo_combustivel, c.descricao as tipo, quantidade ' +
                'From Tanques t inner join Combustivel c on(t.codigo = c.codigo)                     ' +
                'Order By t.codigo                                                                   ' );

  Value.Open;
end;

class function TCombustivel.New: ICombustivel;
begin
  Result := Self.Create;
end;

end.
