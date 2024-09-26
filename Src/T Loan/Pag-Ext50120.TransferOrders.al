pageextension 50120 "Transfer Orders" extends "Transfer Orders"
{
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Rec.SetRange(TLoan, false);
    end;
}
