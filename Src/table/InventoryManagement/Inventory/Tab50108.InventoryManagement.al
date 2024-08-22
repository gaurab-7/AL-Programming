table 50108 "Inventory Management"
{
    Caption = 'Inventory Management';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(2; "Item Name"; Text[20])
        {
            Caption = 'Item Name';
        }
        field(3; "Quantity In Stock"; Integer)
        {
            Caption = 'Quantity In Stock';
        }
        field(4; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Item Name", "Item No.")
        {
        }
    }
}
