pageextension 50111 "Sales Invoice List Ext" extends "Sales Invoice List"
{
    layout
    {
        modify(Amount)
        {
            CaptionML = CHS = '税合计';
        }
        addafter(Amount)
        {
            field("Amount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Amount Including VAT', CHS = '金额不含税';
            }
        }
        modify("Location Code")
        {
            CaptionML = CHS = '位置代码';
        }
        modify("Posting Date")
        {
            CaptionML = CHS = '发布日期';
        }
    }
}
