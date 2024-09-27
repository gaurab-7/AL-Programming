table 50122 "Ticket Line"
{
    Caption = 'Ticket Line';
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
            TableRelation = "Concert Header";
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
            Editable = false;
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
