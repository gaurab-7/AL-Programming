page 50112 TryPage
{
    ApplicationArea = All;
    Caption = 'TryPage';
    PageType = List;
    SourceTable = Try;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("TNo."; Rec."TNo.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(UName; Rec.UName)
                {
                    ToolTip = 'Specifies the value of the UName field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ToolTip = 'Specifies the value of the Contact Person field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
