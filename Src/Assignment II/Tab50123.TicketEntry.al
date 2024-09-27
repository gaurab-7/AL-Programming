table 50123 "Ticket Entry"
{
    Caption = 'Ticket Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Ticket No."; Code[20])
        {
            Caption = 'Ticket No.';
        }
        field(2; "Concert Code"; Code[20])
        {
            Caption = 'Concert Code';
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(4; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
        }
        field(5; Price; Decimal)
        {
            Caption = 'Price';
        }
    }
    keys
    {
        key(PK; "Ticket No.")
        {
            Clustered = true;
        }
    }
}
