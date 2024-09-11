pageextension 50102 CustomerListExt extends "Customer List"
{
    layout
    {
        addafter(Name)
        {
            field(UName; Rec.UName)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addfirst(Reports)
        {
            action(FilterOut)
            {
                ApplicationArea = All;
                Image = Filter;
                trigger OnAction()
                begin
                    Rec.SetFilter("Location Code", 'GREEN');
                end;
            }

            // action("Open CLE via Filter Page")
            // {
            //     Caption = 'Open CLE via Filter Page';
            //     ApplicationArea = All;
            //     Promoted = True;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;

            //     trigger OnAction()
            //     var
            //         varFilterPageBuilder: FilterPageBuilder;
            //         varItem: Record Item;

            //     begin
            //         varFilterPageBuilder.AddTable('Customer Table', Database::Customer);
            //         varFilterPageBuilder.AddRecord('Item Table', varItem);
            //         varFilterPageBuilder.AddField('Item Table', varItem."No.", '>100');
            //         varFilterPageBuilder.PageCaption := 'Customer and Item Filter Page';
            //         varFilterPageBuilder.RunModal();
            //     end;
            // }

            action("Filter Page Builder")
            {
                Caption = 'Filter Page Builder';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Filter;

                trigger OnAction()
                var
                    varFilterPageBuilder: FilterPageBuilder;
                    CustLedgerEntry: Record "Cust. Ledger Entry";
                begin
                    varFilterPageBuilder.AddRecord('Cust. Ledger Entry Table', CustLedgerEntry);
                    varFilterPageBuilder.AddField('Cust. Ledger Entry Table', CustLedgerEntry."Document Type");
                    varFilterPageBuilder.AddField('Cust. Ledger Entry Table', CustLedgerEntry."Document Date");
                    varFilterPageBuilder.AddField('Cust. Ledger Entry Table', CustLedgerEntry."Customer No.");
                    varFilterPageBuilder.PageCaption := 'Customer Ledger Entries Filter Page';
                    if varFilterPageBuilder.RunModal() then begin
                        CustLedgerEntry.SetView(varFilterPageBuilder.GetView('Cust. Ledger Entry Table'));
                        Page.Run(Page::"Customer Ledger Entries", CustLedgerEntry);
                    end;
                end;
            }
        }
    }
}
