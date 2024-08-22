codeunit 50110 "Product Review Mgt."
{
    procedure CalculateAverageRating(ProductNo: Code[20]): Decimal
    var
        ReviewRec: Record "Product Review";
        SumRating: Decimal;
        CountRating: Integer;
    begin
        SumRating := 0;
        CountRating := 0;

        ReviewRec.SetRange("Product No.", ProductNo);
        if ReviewRec.FindSet() then
            repeat
                SumRating += ReviewRec.Rating;
                CountRating += 1;
            until ReviewRec.Next() = 0;

        if CountRating > 0 then
            exit(SumRating / CountRating)
        else
            exit(0);
    end;
}