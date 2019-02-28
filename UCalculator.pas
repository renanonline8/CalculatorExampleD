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

end.
