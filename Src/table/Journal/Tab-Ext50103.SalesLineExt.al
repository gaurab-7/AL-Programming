tableextension 50103 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50100; "Tax Amount"; Decimal)
        {
            Caption = 'Tax Amount';
            DataClassification = ToBeClassified;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                Item: Record Item;
            begin
                if Type = Type::Item then begin
                    Item.Get("No.");
                    "Tax Amount" := Quantity * (Item."Unit Price" * 0.13) + Item."Unit Price";
                end;
            end;
        }
    }
}
