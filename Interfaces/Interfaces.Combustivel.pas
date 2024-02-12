unit Interfaces.Combustivel;

interface

uses
  FireDAC.Comp.Client;

type
  ICombustivel = interface
    ['{EFFBBEBF-6A2D-46C8-8E34-6CBC03F45220}']
    procedure GetCombustivel  (Value: TFDQuery);
    procedure GetTanques      (Value: TFDQuery);
    procedure GetBombas       (Value: TFDQuery);
    procedure GetAbastecimento(Value: TFDQuery);
    procedure GetAbastece     (Value: TFDQuery);
    procedure GetRelatorio    (DataI: TDate; DataF: TDate; Value: TFDQuery);
  end;

implementation

end.
