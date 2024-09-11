table 50107 Try
{
    Caption = 'Try';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "TNo."; Code[20])
        {
            Caption = 'TNo.';
            TableRelation = Customer;
        }
        field(2; UName; Text[30])
        {
            Caption = 'UName';
        }
        field(3; Name; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("TNo.")));
        }
        field(4; "Contact Person"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Contact where("No." = field("TNo.")));
        }
        field(5; Address; Text[50])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "TNo.")
        {
            Clustered = true;
        }
    }
}
