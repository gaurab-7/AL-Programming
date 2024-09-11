page 50115 "Product Review List"
{
    PageType = List;
    SourceTable = "Product Review";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Review ID"; Rec."Review ID")
                {
                    ApplicationArea = All;
                }
                field("Product No."; Rec."Product No.")
                {
                    ApplicationArea = All;
                }
                field("Reviewer Name"; Rec."Reviewer Name")
                {
                    ApplicationArea = All;
                }
                field(Rating; Rec.Rating)
                {
                    ToolTip = 'Rating must be out of 10';
                    Caption = 'Rating/ 10';
                    ApplicationArea = All;
                }
                field("Review Date"; Rec."Review Date")
                {
                    ApplicationArea = All;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
