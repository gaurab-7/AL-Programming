page 50113 "Inventory Page"
{
    ApplicationArea = All;
    Caption = 'Inventory Page';
    PageType = List;
    SourceTable = "Inventory Management";
    UsageCategory = Administration;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Item Name"; Rec."Item Name")
                {
                    ToolTip = 'Specifies the value of the Item Name field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Quantity In Stock"; Rec."Quantity In Stock")
                {
                    ToolTip = 'Specifies the value of the Quantity In Stock field.', Comment = '%';
                }
            }
        }
    }
}
