page 50108 PostedPurchasePage
{
    ApplicationArea = All;
    Caption = 'PostedPurchasePage';
    PageType = List;
    SourceTable = PostedPurchaseHeader;
    UsageCategory = Administration;
    CardPageId = PostedPurchaseCard;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
