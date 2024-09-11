tableextension 50105 ReveiwItemExt extends Item
{
    fields
    {
        field(50100; Rating; Decimal)
        {
            Caption = 'Rating';
            // FieldClass = FlowField;
            // CalcFormula = average("Product Review".Rating where("Product No." = field("No.")));
        }
    }

    // trigger onOpenPage()
    // var
    // ReviewMgt : Codeunit "Product Review Mgt.";
    // begin
    //     Rating := ReviewMgt.CalculateAverageRating("No.");
    // end;
}
