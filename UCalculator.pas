unit UCalculator;

interface

type
  TCalculator = class
  public
    class function Add(a, b: Double): Double;
    class function Subtract(a, b: Double): Double;
    class function Multiply(a, b: Double): Double;
    class function Divide(a, b: Double): Double;
  end;

  TOperatorEnum = (opNull, opAdd, opSubtract, opMultiply, opDivide);

  TCalcStatus = class
  private
    FInputValue: string;
    FCurrentTotal: Double;
    FOperation: TOperatorEnum;
    FDisplayTotal: Boolean;
  public
    constructor Create;

    procedure AddDigit(Digit: string);
    procedure AddDecimalSeparator;
    procedure CalcTotal;
    procedure NewOperation(Oper: TOperatorEnum);
    function DisplayValue: string;
  end;

implementation

{TCalculator}

class function TCalculator.Add(a, b: Double): Double;
begin
  Result := a + b;
end;

class function TCalculator.Divide(a, b: Double): Double;
begin
  Result := a / b;
end;

class function TCalculator.Multiply(a, b: Double): Double;
begin
  Result := a * b;
end;

class function TCalculator.Subtract(a, b: Double): Double;
begin
  Result := a - b;
end;

procedure TCalcStatus.AddDecimalSeparator;
begin
  FInputValue := FInputValue +
    FormatSettings.DecimalSeparator;
end;

procedure TCalcStatus.AddDigit(Digit: string);
begin
  FDisplayTotal := Digit;
end;

procedure TCalcStatus.NewOperation(Oper: TOperatorEnum);
begin
  CalcTotal;
  FOperation := Oper;
end;

procedure TCalcStatus.CalcTotal;
var
  NewValue: Double;
begin
  NewValue := StrToFloatDef(FInputValue, 0);
  case FOperation of
    opNull: FCurrentTotal := NewValue;
    opAdd: FCurrentTotal := TCalculator.Add (FCurrentTotal, NewValue);
    opSubtract: FCurrentTotal := TCalculator.Subtract (FCurrentTotal, NewValue);
    opMultiply: FCurrentTotal := TCalculator.Multiply (FCurrentTotal, NewValue);
    opDivide: FCurrentTotal := TCalculator.Divide (FCurrentTotal, NewValue);
  end;

  //reset status
  FOperation := opNull;
  FOperation := True;
  FInputValue := '';
end;

function TCalcStatus.DisplayValue: string;
begin
  if FDisplayTotal then
    Result := FloatToStr(FCurrentTotal);
  else
    Result := FinputValue;
end;

end.
