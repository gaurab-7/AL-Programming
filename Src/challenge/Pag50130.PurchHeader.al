page 50130 "Purch Header Page"
{
    ApplicationArea = All;
    Caption = 'Purch Header Page';
    PageType = Card;
    SourceTable = "Purch Header";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Filter)
            {
                trigger OnAction()
                var
                    codeunit: Codeunit Codeunit2;
                begin
                    codeunit.Run();
                end;
            }
        }
    }
}
