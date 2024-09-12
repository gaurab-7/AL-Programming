page 50133 "Terms and Cond. Entry NEP"
{
    PageType = ListPart;
    AutoSplitKey = true;
    SourceTable = "Terms and Cond. Entry NEP";
    Caption = 'Terms and Condition Entry';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("SNo."; Rec."SNo.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SNo. field.';
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
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
}