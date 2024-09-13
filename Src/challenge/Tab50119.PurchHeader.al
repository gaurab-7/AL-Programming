table 50119 "Purch Header"
{
    Caption = 'Purch Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionMembers = Quote,Order1,Invoice,"Credit Memo","Blanket Order","Return Order";
        }
    }
    keys
    {
        key(PK; "Document Type")
        {
            Clustered = true;
        }
    }
}
