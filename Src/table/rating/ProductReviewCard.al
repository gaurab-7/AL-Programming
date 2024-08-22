page 50116 "Product Review Card"
{
    PageType = Card;
    SourceTable = "Product Review";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("Review ID"; Rec."Review ID")
                {
                    ApplicationArea = All;
                    Editable = false;
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

    actions
    {
        area(Processing)
        {
            action(Save)
            {
                ApplicationArea = All;
                Caption = 'Save';
                Image = Save;

                trigger OnAction()
                begin
                    CurrPage.SaveRecord();
                end;
            }
        }
    }
}
