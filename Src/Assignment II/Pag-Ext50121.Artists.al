pageextension 50121 Artists extends Artists
{
    layout
    {
        addafter(Blocked)
        {
            field("No. of Songs"; Rec."No. of Songs")
            {
                ApplicationArea = All;
            }
            field("Artist Image"; Rec."Artist Image")
            {
                ApplicationArea = All;
            }
            field(Age; Rec.Age)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addlast(Processing)
        {
            action(Songs)
            {
                Image = Refresh;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Song: Record Song;
                begin
                    Song.SetFilter("Artist Code", Rec.Code);
                    Page.Run(Page::"Song List", Song);
                end;
            }
        }
    }
}
