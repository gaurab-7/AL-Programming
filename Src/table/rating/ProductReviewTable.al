table 50112 "Product Review"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Review ID"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Product No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
        field(3; "Reviewer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Rating; Integer)
        {
            DataClassification = ToBeClassified;
            // trigger onValidate()
            // var
            //     item: Record item;
            //     ProductReview: Record "Product Review";
            //     sumrating: Integer;
            //     countRating: Integer;
            // begin
            //     ProductReview.SetRange("Product No.", item."No.");
            //     if ProductReview.FindSet() then begin
            //         repeat
            //             countRating += 1;
            //             sumrating += ProductReview.Rating;
            //         until ProductReview.Next() = 0;
            //     end;
            //     if countRating > 0 then
            //         item.Rating := sumrating / countRating
            //     else
            //         item.Rating := 0;
            // end;

            trigger OnValidate()
            begin
                if Rec.Rating > 10 then Error('The rating should not exceed 10');
            end;
        }
        field(5; "Review Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Comments; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Ratingg; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Review ID")
        {
            Clustered = true;
        }
    }
}
