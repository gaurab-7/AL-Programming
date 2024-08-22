codeunit 50103 MyCodeunit
{
    procedure add(num1: Integer; num2: Integer): Decimal
    var
        myInt: Integer;
    begin
        myInt := num1 + num2;
        exit(myInt);
        Error('Successful');
    end;
}