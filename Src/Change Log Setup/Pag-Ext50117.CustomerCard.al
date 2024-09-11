pageextension 50117 "Customer Card" extends "Customer Card"
{
    actions
    {
        addlast("&Customer")
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
