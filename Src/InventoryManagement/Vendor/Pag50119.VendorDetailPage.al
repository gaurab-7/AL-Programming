page 50119 "Vendor Detail Page"
{
    ApplicationArea = All;
    Caption = 'Vendor Detail Page';
    PageType = List;
    SourceTable = "Vendor Details";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor No. field.', Comment = '%';
                }
                field("Vendor Name "; Rec."Vendor Name ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact No. field.', Comment = '%';
                }
            }
        }
    }
}
