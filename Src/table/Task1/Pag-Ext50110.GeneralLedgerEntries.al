pageextension 50110 "General Ledger Entries" extends "General Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("Source Name"; Rec."Source Name")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter("F&unctions")
        {
            action(UpdateSourceNames)
            {
                Caption = 'Update Source Names';
                Image = Refresh;
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempCodeUnit: Codeunit TempCodeUnit;
                begin
                    TempCodeUnit.AddSourceName();
                end;
            }
        }
    }
}
