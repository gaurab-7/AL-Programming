page 50123 "Armstrong Card"
{
    Caption = 'Armstrong Card';
    PageType = Card;
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
            }
        }
    }
    trigger OnOpenPage()
    var
    // Counter1, Counter2, Number, Result, PowerNumber : Integer;
    // CounterText: Text[5];
    // ResultList: List of [Integer];
    // ArmstrongNumbers, Newline : Text;
    // Ch10, Ch13 : char;
    begin
        // Ch10 := 10;
        // Ch13 := 13;
        // Newline := Format(Ch10) + Format(Ch13);
        // for Counter1 := 0 to 10000 do begin
        //     CounterText := Format(Counter1);
        //     Evaluate(PowerNumber, CopyStr(CounterText, StrLen(CounterText), 1));
        //     for Counter2 := 1 to StrLen(CounterText) do begin
        //         Evaluate(Number, CopyStr(CounterText, Counter2, 1));
        //         Result += Power(Number, PowerNumber);
        //     end;

        //     if Result = Counter1 then
        //         ResultList.Add(Result);
        //     Clear(Result);
        // end;

        // foreach Counter1 in ResultList do
        //     ArmstrongNumbers += Newline + Format(Counter1);
        // Message(ArmstrongNumbers);

        for Number := 0 to 10000 do begin
            PowerNumber := Number mod 10;
            split := Number;
            result := 0;
            repeat
                remainder := split mod 10;
                result += Power(remainder, PowerNumber);
                split := split div 10;
            until split = 0;

            if result = Number then Message('%1', Number);
        end;
    end;

    var
        remainder, split, PowerNumber, Number, result : Integer;
}
