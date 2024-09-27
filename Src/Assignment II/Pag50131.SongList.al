page 50131 "Song List"
{
    ApplicationArea = All;
    Caption = 'Song List';
    PageType = List;
    SourceTable = Song;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field("Artist Code"; Rec."Artist Code")
                {
                    ToolTip = 'Specifies the value of the Artist Code field.', Comment = '%';
                }
                field("Artist Name"; Rec."Artist Name")
                {
                    ToolTip = 'Specifies the value of the Artist Name field.', Comment = '%';
                }
                field("Music Genre Code"; Rec."Music Genre Code")
                {
                    ToolTip = 'Specifies the value of the Music Genre Code field.', Comment = '%';
                }
                field("Music Genre Name"; Rec."Music Genre Name")
                {
                    ToolTip = 'Specifies the value of the Music Genre Name field.', Comment = '%';
                }
                field("Song Length"; Rec."Song Length")
                {
                    ToolTip = 'Specifies the value of the Song Length field.', Comment = '%';
                }
                field("Released Date"; Rec."Released Date")
                {
                    ToolTip = 'Specifies the value of the Released Date field.', Comment = '%';
                }
                field("Released Year"; Rec."Released Year")
                {
                    ToolTip = 'Specifies the value of the Released Year field.', Comment = '%';
                }
                field(Hits; Rec.Hits)
                {
                    ToolTip = 'Specifies the value of the Hits field.', Comment = '%';
                }
                field("No. of Songs This Year"; Rec."No. of Songs This Year")
                {
                    ToolTip = 'Specifies the value of the No. of Songs This Year field.', Comment = '%';
                }
            }
        }
    }
}
