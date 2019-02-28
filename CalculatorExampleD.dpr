program CalculatorExampleD;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormCalculator in 'uFormCalculator.pas' {FormCalc},
  UCalculator in 'UCalculator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCalc, FormCalc);
  Application.Run;
end.
