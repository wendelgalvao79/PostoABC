unit Systems.Conexao;

interface

uses
  System.StrUtils,
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,

  Systems.Common,

  Winapi.Windows,
  Vcl.Forms,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client;

var
  FConnLista : TObjectList<TFDConnection>;

function Conexao(Value: String): Integer;

procedure StartTransaction (FConn: TFDConnection);
procedure CommitTransacao  (FConn: TFDConnection);
procedure RollbackTransacao(FConn: TFDConnection);
procedure Desconectar      (Value: Integer);

implementation

uses
  View.Erro;

function Conexao(Value: String): Integer;
begin
  if not Assigned(FConnLista) then
     FConnLista  := TObjectList<TFDConnection>.Create;

  FConnLista.Add(TFDConnection.Create(nil));
  Result  := Pred(FConnLista.Count);

  FConnLista.Items[Result].Connected                  := False;
  FConnLista.Items[Result].LoginPrompt                := False;
  FConnLista.Items[Result].Params.Clear;


  FConnLista.Items[Result].DriverName                 := 'FB';
  FConnLista.Items[Result].Params.Values['DriverID']  := 'FB';
  FConnLista.Items[Result].Params.Values['Server']    := 'localhost';
  FConnLista.Items[Result].Params.Values['DataBase']  := Value;
  FConnLista.Items[Result].Params.Values['User_Name'] := 'SYSDBA';
  FConnLista.Items[Result].Params.Values['Password']  := 'masterkey';
  FConnLista.Items[Result].Params.Values['Port']      := '3050';
  FConnLista.Items[Result].Connected  := True;

  if not FConnLista.Items[Result].Connected then begin
     Mensagem('Houve uma falha ao tentar conectar ao Banco de Dados.', Tfrmerro, frmerro);
     Application.Terminate;
     ExitProcess(0);
  end;
end;

procedure StartTransaction(FConn: TFDConnection);
begin
  if not FConn.InTransaction then
     FConn.StartTransaction;
end;

procedure CommitTransacao(FConn: TFDConnection);
begin
  if not FConn.InTransaction then
     FConn.Commit;
end;

procedure RollbackTransacao(FConn: TFDConnection);
begin
  if not FConn.InTransaction then
     FConn.Rollback;
end;

procedure Desconectar(Value: Integer);
begin
  FConnLista.Items[Value].Connected  := False;
  FConnLista.Items[Value].Free;
  FConnLista.TrimExcess;
end;

end.
