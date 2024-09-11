page 50101 NameOnePage
{
    ApplicationArea = All;
    Caption = 'NameOnePage';
    UsageCategory = Administration;
    PageType = List;
    SourceTable = NameOne;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Name; Rec.EmpName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
