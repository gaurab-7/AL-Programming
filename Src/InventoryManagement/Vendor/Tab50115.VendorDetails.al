table 50115 "Vendor Details"
{
    Caption = 'Vendor Details';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
        }
        field(2; "Vendor Name "; Text[20])
        {
            Caption = 'Vendor Name ';
        }
        field(3; Address; Text[20])
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
        key(PK; "Vendor No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Vendor No.", "Vendor Name ")
        {
        }
    }
}
