page 50138 "English-Nepali Date NEP"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "English-Nepali Date NEP";
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    Editable = true;
    Caption = 'English-Nepali Date';

    layout
    {
        area(Content)
        {
            repeater("List")
            {
                field("English Date"; Rec."English Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the English Date field.';
                }
                field("English Day"; Rec."English Day")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the English Day field.';
                }
                field("English Month"; Rec."English Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the English Month field.';
                }
                field("English Year"; Rec."English Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the English Year field.';
                }
                field("Fiscal Year"; Rec."Fiscal Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fiscal Year field.';
                }
                field("Nepali Date"; Rec."Nepali Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nepali Date field.';
                }
                field("Nepali Day"; Rec."Nepali Day")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nepali Day field.';
                }
                field("Nepali Month"; Rec."Nepali Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nepali Month field.';
                }
                field("Nepali Year"; Rec."Nepali Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nepali Year field.';
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