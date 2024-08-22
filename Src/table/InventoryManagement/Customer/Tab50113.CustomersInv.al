table 50113 CustomersInv
{
    Caption = 'CustomersInv';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(3; Address; Text[30])
        {
            Caption = 'Address';
        }
        field(4; "Contact No."; Integer)
        {
            Caption = 'Contact No.';
        }
    }
    keys
    {
        key(PK; "Customer No.")
        {
            Clustered = true;
        }
    }
}
