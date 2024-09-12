page 50134 "Inventory Avail. Factbox NEP"
{
    PageType = CardPart;
    Caption = 'Inventory Availability Factbox';
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of the item.';

                trigger Onvalidate()
                begin
                    ShowDetail();
                end;
            }
            field(Name; Rec.Description)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies what you are selling.';
            }
            field(Inventory; Rec.Inventory)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the total quantity of the item that is currently in inventory at all locations.';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            // action(ActionName)
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Executes the ActionName action.';

            //     trigger OnAction()
            //     begin
            //     end;
            // }
        }
    }

    local procedure ShowDetail()
    begin
        Page.Run(Page::"Item Card", Rec);
    end;
}