page 50109 customerpage
{
    ApplicationArea = All;
    Caption = 'customerpage';
    PageType = List;
    SourceTable = customertable;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Company; Rec.Company)
                {
                    ToolTip = 'Specifies the value of the Company field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Caption = 'Post', Comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Post;

                trigger OnAction()
                var
                    Post: Codeunit PostCodeUnit;
                begin
                    if not Confirm('Do you want to post?', false) then
                        exit;
                    Post.PostCodeUnit();
                    Message('Document has been Posted');
                end;
            }
        }
    }
}
