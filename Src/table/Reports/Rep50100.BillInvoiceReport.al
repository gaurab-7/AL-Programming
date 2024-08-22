report 50100 BillInvoiceReport
{
    Caption = 'BillInvoiceReport';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'RDLC\BillSummary.rdl';
    dataset
    {
        dataitem(DataItemName; PostedPurchaseHeader)
        {
            column(Bill_No; "No.")
            {
            }
            column(Sell_To_Customer; "Received By")
            {
            }
            column(Address; Address) { }
            column(User_ID; "User ID") { }
            column(Name; "Vendor Name") { }
            column(Image; CompInfo.Picture)
            {
            }
            column(CompName; CompInfo.Name)
            {
            }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompAddress; CompInfo.Address) { }

            trigger OnPreDataItem()
            begin
                purchAndPay.Get();
                CompInfo.Get();
                CompInfo.CalcFields(Picture);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        CompInfo: Record "Company Information";
        purchAndPay: Record "Purchases & Payables Setup";
}
