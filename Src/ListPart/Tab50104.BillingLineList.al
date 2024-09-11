table 50104 "Billing Line List"
{
    Caption = 'Billing Line List';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Item No"; Code[50])
        {
            TableRelation = Item;
            DataClassification = ToBeClassified;
        }
        field(3; "Line No."; Integer)
        {
            TableRelation = Item;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Itms: Record Item;
            begin
                if Itms.Get("Item No") then
                    Validate(Description, Itms.Description);
            end;
        }
        field(4; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Quantity; Decimal)
        {
            trigger OnValidate()
            begin
                Rec."Line Total" := Rec.Quantity * Rec."Unit Price";
            end;
        }
        field(6; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Line Total"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No")
        {
            Clustered = true;
        }
    }
}
