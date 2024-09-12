page 50135 "PragyapanPatra NEP"
{
    ApplicationArea = All;
    Caption = 'PragyapanPatra';
    PageType = List;
    SourceTable = "PragyapanPatra NEP";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                // field("Vendor No."; Rec."Vendor No.")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Vendor No. field.';
                // }
                field("Purchase Consignment No."; Rec."Purchase Consignment No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purchase Consignment No. field.';
                }
                field("Date of Custom Clerance"; Rec."Date of Custom Clerance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Custom Clerance field.';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
        }
    }
}