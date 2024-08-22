table 50111 PostedPurchaseLine
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Qty; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Unit Price"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Line Total"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Item Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Amount after Tax"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
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