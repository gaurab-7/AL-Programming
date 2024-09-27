page 50132 "Artist Card"
{
    ApplicationArea = All;
    Caption = 'Artist Card';
    PageType = Card;
    SourceTable = Artist;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Artist Image"; Rec."Artist Image")
                {
                    ToolTip = 'Specifies the value of the Artist Image field.', Comment = '%';
                }
                field(Age; Rec.Age)
                {
                    ToolTip = 'Specifies the value of the Age field.', Comment = '%';
                }
            }
        }
    }
}
