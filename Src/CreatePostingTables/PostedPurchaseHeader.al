table 50110 PostedPurchaseHeader
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "User ID"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Buy From Vendor"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Address; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Received By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(99; "Amount After Tax"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}