page 50110 postingpage
{
    ApplicationArea = All;
    Caption = 'Postingpage';
    PageType = List;
    SourceTable = postingtable;
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
                field(UserName; Rec.UserName)
                {
                    ToolTip = 'Specifies the value of the UserName field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.', Comment = '%';
                }
                field(Company; Rec.Company)
                {
                    ToolTip = 'Specifies the value of the Company field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Setfilter)
            {
                Image = Filter;
                ApplicationArea = All;

                trigger OnAction()
                var
                    filterpagebuilder: FilterPageBuilder;
                    post: Record postingtable;
                    name: Text[30];
                    address: Text[30];
                begin
                    filterpagebuilder.AddRecord('Posting', post);
                    filterpagebuilder.AddField('Posting', post.Address);
                    filterpagebuilder.AddField('Posting', post.UserName);

                    if filterpagebuilder.RunModal() then begin
                        post.SetView(filterpagebuilder.GetView('Posting'));

                        Evaluate(name, post.GetFilter(UserName));
                        Evaluate(address, post.GetFilter(Address));

                        post.Reset();
                        post.SetRange(Address, address);
                        if post.FindSet() then
                            repeat
                                post.UserName := name;
                                post.Modify();
                                if post.Phone = 0 then post.Company := 'Null';
                                post.Modify();
                            until post.Next() = 0;
                    end;
                end;
            }
        }
    }
}
