page 50126 "Currency Rates Page"
{
    Caption = 'Currency Rates Page';
    PageType = List;
    SourceTable = "Currency Rates";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country field.', Comment = '%';
                }
                field("Country Name"; Rec."Country Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country Name field.', Comment = '%';
                }
                field(Unit; Rec.Unit)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit field.', Comment = '%';
                }
                field("Buy Rate"; Rec."Buy Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Buy Rate field.', Comment = '%';
                }
                field("Sell Rate"; Rec."Sell Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sell Rate field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(RefreshRates)
            {
                Caption = 'Refresh Rates';
                ApplicationArea = All;
                PromotedCategory = Process;
                Promoted = true;
                Image = Refresh;

                trigger OnAction()
                var
                    MyCodeunit: Codeunit MyCodeunit;
                begin
                    MyCodeunit.GetRates();
                end;
            }
        }
    }
}
