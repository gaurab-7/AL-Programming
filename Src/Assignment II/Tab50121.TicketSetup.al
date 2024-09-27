table 50121 "Ticket Setup"
{
    Caption = 'Ticket Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Concert No."; Code[20])
        {
            Caption = 'Concert No.';
            TableRelation = "Concert Header";
        }
        field(3; Gender; Option)
        {
            OptionMembers = Male,Female,Other;
        }
        field(4; Price; Decimal)
        {
            Caption = 'Price';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
