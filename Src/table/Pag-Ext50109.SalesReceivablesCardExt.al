pageextension 50109 "Sales & Receivables Card Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Inventory Mgmt No. Series"; Rec."Inventory Mgmt No. Series")
            {
                ApplicationArea = All;
            }
        }
    }
}
