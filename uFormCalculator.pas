unit uFormCalculator;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, UCalculator;

type
  TFormCalc = class(TForm)
    LayoutDisplay: TLayout;
    LabelDisplay: TLabel;
    GridLayoutButtons: TGridLayout;
    BtnNum1: TButton;
    BtnNum2: TButton;
    BtnNum3: TButton;
    BtnPlus: TButton;
    BtnNum4: TButton;
    BtnNum5: TButton;
    BtnNum6: TButton;
    BtnMinus: TButton;
    BtnNum7: TButton;
    BtnNum8: TButton;
    BtnNum9: TButton;
    BtnMultiply: TButton;
    BtnDecimal: TButton;
    BtnNum0: TButton;
    BtnResult: TButton;
    BtnDivide: TButton;
    procedure ButtonNumberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonDecimanlClick(Sender: TObject);
    procedure ButtonPlusClick(Sender: TObject);
    procedure ButtonMinusClick(Sender: TObject);
    procedure ButtonMultiplyClick(Sender: TObject);
    procedure ButtonDivideClick(Sender: TObject);
    procedure ButtonEqualsClick(Sender: TObject);
  private
    CalcStatus: TCalcStatus;
  public
    procedure Refresh;
  end;

var
  FormCalc: TFormCalc;

implementation

{$R *.fmx}

procedure TFormCalc.FormCreate(Sender: TObject);
begin
  CalcStatus := TCalcStatus.Create;
end;

procedure TFormCalc.FormDestroy(Sender: TObject);
begin
  CalcStatus.Free;
end;

procedure TFormCalc.ButtonDecimanlClick(Sender: TObject);
begin
  CalcStatus.AddDecimalSeparator;
  Refresh;
end;

procedure TFormCalc.ButtonEqualsClick(Sender: TObject);
begin
  CalcStatus.CalcTotal;
  Refresh;
end;

procedure TFormCalc.ButtonMultiplyClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opMultiply);
  Refresh;
end;

procedure TFormCalc.ButtonPlusClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opAdd);
  Refresh;
end;

procedure TFormCalc.ButtonMinusClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opSubtract);
  Refresh;
end;

procedure TFormCalc.ButtonDivideClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opDivide);
  Refresh;
end;

procedure TFormCalc.ButtonNumberClick(Sender: TObject);
begin
  CalcStatus.AddDigit ((Sender as TButton).Text);
  Refresh;
end;

procedure TFormCalc.Refresh;
begin
  LabelDisplay.Text := CalcStatus.DisplayValue;
end;

end.
