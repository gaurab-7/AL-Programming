page 50103 "table page"
{
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'pages';
    PageType = Card;
    SourceTable = "Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Number; Rec.Number)
                {
                    ToolTip = 'Specifies the value of the Number field.', Comment = '%';
                }
            }
        }
    }
}
