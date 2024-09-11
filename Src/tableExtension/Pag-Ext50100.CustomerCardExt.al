pageextension 50100 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(Facebook; Rec.Facebook)
            {
                ApplicationArea = All;
            }
            field(Instagram; Rec.Instagram)
            {
                ApplicationArea = All;
            }
            field(LinkedIn; Rec.LinkedIn)
            {
                ApplicationArea = All;
            }
            field(UName; Rec.UName)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}