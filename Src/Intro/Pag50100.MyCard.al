page 50100 MyCard
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = NameOne;

    layout
    {
        area(Content)
        {
            repeater(Details)
            {
                field(Name; Rec.EmpName)
                {
                    ApplicationArea = All;
                }
                field(Number; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field(Month; Rec.Month)
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                end;
            }
        }
    }
}