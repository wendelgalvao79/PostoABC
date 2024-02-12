unit Systems.Paramtrs;

interface

uses
  System.SysUtils,
  System.StrUtils,

  Vcl.Forms,
  Vcl.Controls;

var
  vMensagem : String;
  vModal    : TModalResult;

  PrefSys: record
     PathBanco : String;
     DataI     : TDate;
     DataF     : TDate;
  end;

implementation

end.
