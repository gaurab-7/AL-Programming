tableextension 50106 VendorTableExt extends Vendor
{
    fields
    {
        field(50100; "Count of items"; Integer)
        {
            Caption = 'Count of items';
            // FieldClass = FlowField;
            // CalcFormula = count(Item where("Vendor No." = field("No.")));
        }
    }
}
