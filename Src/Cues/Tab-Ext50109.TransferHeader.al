tableextension 50109 "Transfer Header" extends "Transfer Header"
{
    fields
    {
        field(50100; "Start Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "End Date" <> 0D then begin
                    if "End Date" < "Start Date" then
                        Error('End Date cannot be less than the Start Date.');
                end;
            end;
        }
        field(50101; "End Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "End Date" < "Start Date" then
                    Error('End Date cannot be less than the Start Date.');
            end;
        }
        field(50103; TLoan; Boolean)
        {
            Caption = 'T-Loan';
            DataClassification = ToBeClassified;
        }
    }
}
