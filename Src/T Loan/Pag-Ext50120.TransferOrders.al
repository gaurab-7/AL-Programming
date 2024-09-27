pageextension 50120 "Transfer Orders" extends "Transfer Orders"
{
    trigger OnOpenPage()
    begin
        Rec.SetRange(TLoan, false);
    end;
}
