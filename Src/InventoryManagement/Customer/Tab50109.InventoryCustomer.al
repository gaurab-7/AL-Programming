table 50109 "Inventory Customer"
{
    Caption = 'Inventory Customer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer/Vendor No.';
        }
        field(2; "Customer Name"; Text[50])
        {
            Caption = 'Customer/Vendor Name';
        }
        field(3; "Item No."; Code[50])
        {
            Caption = 'Item No.';
        }
        field(4; "Item Name"; Text[50])
        {
            Caption = 'Item Name';
        }
        field(5; "Item Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Type; Option)
        {
            OptionMembers = " ",Purchase,Sales;
        }
        field(8; "Transaction ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Amount; Decimal)
        {
            DataClassification = ToBeClassified;

            // Tried to calculate the amount itself in the table of inventory customer
            // trigger OnLookup()
            // var
            //     MainInventory: Record "Inventory Management";
            // begin
            //     MainInventory.Reset();
            //     MainInventory.SetRange("Item No.", Rec."Item No.");
            //     Rec.Amount := MainInventory."Unit Price" * Rec."Item Quantity";
            // end;
        }
    }
    keys
    {
        key(PK; "Transaction ID")
        {
            Clustered = true;
        }
    }
}
