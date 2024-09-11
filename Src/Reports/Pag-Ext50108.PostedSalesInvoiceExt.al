pageextension 50108 PostedSalesInvoiceExt extends "Posted Sales Invoice"
{
    actions
    {
        addafter("Update Document")
        {
            action(Report)
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesInvoice: Record "Sales Invoice Header";
                begin
                    SalesInvoice.SetRange("No.", Rec."No.");
                    Report.Run(Report::TestReport, true, true, SalesInvoice);
                end;
            }
        }
    }
}
