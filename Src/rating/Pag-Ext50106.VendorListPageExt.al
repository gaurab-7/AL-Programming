pageextension 50106 VendorListPageExt extends "Vendor List"
{
    layout
    {
        addafter(Name)
        {
            field("Count of items"; Rec."Count of items")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addfirst(navigation)
        {
            action(PostData)
            {
                Image = Post;
                ApplicationArea = All;
                trigger OnAction()
                var
                    item: Record Item;
                    "vendorNo.": Code[20];
                    count: Integer;
                begin
                    "vendorNo." := '20000';
                    item.SetRange("No.", "vendorNo.");
                    if item.FindSet() then begin
                        repeat
                            count += 1;
                        // vendor."Count of items" := count;
                        until item.Next() = 0;
                        Message('%1', count);
                    end;
                end;
            }
        }
        addlast("Ven&dor")
        {
            action(ChangeLog)
            {
                Caption = 'Change Log';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Change;
                trigger OnAction()
                var
                    ChangeLogEntry: Record "Change Log Entry";
                begin
                    ChangeLogEntry.SetRange("Table Caption", Rec.TableName);
                    ChangeLogEntry.SetRange("Primary Key Field 1 Value", Rec."No.");
                    Page.Run(Page::"Change Log Entries", ChangeLogEntry);
                end;
            }
        }
    }
}
