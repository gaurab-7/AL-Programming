page 50111 PostedPurchaseLineListPart
{
    ApplicationArea = All;
    Caption = 'ListPart';
    PageType = ListPart;
    SourceTable = "Billing Line List";
    // AutoSplitKey = true;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = All;
                    TableRelation = Item;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true)
                    end;
                }
                field("Line Total"; Rec."Line Total")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
