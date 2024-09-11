page 50121 "Expressions Card"
{
    Caption = 'Expressions Card';
    PageType = Card;
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(value1; value1)
                {
                    ApplicationArea = All;
                }
                field(value2; value2)
                {
                    ApplicationArea = All;
                }
            }
            group(Output)
            {
                Caption = 'Output';
                field(Result; Result)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                Caption = 'Execute';
                Image = ExecuteBatch;
                ApplicationArea = All;
                ToolTip = 'Click to calculate the result';

                trigger OnAction()
                begin
                    Result := value1 > value2;
                end;
            }
        }
    }
    var
        value1: Integer;
        value2: Integer;
        Result: Boolean;
}
