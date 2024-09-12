table 50119 "Terms and Cond. Entry NEP"
{
    DataClassification = CustomerContent;
    Caption = 'Terms & condition Entry';

    fields
    {
        field(90000; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
        }
        field(90001; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
        }
        field(90002; "Term Type"; Enum "Terms and Cond. Type NEP")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
        }
        field(90003; "Description"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(90004; "SNo."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'SNo.';
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "SNo." = 0 then
            "SNo." := GetNextEntryNo("Document No.");
    end;

    local procedure GetNextEntryNo(docNo: Code[20]): Integer
    var
        TermsAndCond: Record "Terms and Cond. Entry NEP";
    begin
        TermsAndCond.Reset();
        TermsAndCond.SetRange("Document No.", docNo);
        if TermsAndCond.FindLast() then
            exit(TermsAndCond."SNo." + 1)
        else
            exit(1);
    end;
}