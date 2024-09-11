report 50101 TestReport
{
    Caption = 'TestReport';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'RDLC\TestBill.rdl';

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.") { }
            column(Sell_to_Address; "Sell-to Address") { }
            column(Sell_to_Phone_No_; "Sell-to Phone No.") { }
            column(SelltoCustomerName; "Sell-to Customer Name") { }
            column(Sell_to_Customer_No_; "Sell-to Customer No.") { }
            column(Image; CompInfo.Picture) { }
            column(CompName; CompInfo.Name) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompAddress; CompInfo.Address) { }
            column(VATRegistrationNo; CompInfo."VAT Registration No.") { }
            dataitem(SalesInvoiceLine; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(SN; SN) { }
                column(Number; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_Price; "Unit Price") { }
                column(Line_Discount__; "Line Discount %") { }
                column(Amount; Amount) { }
                column(Line_Discount_Amount; "Line Discount Amount") { }

                trigger OnPreDataItem()
                begin
                    SN := 0;
                    Temp := 0;
                end;

                trigger OnAfterGetRecord()
                begin
                    if Type = Type::Item then begin
                        SN := Temp;
                        SN := SN + 1;
                        Temp := SN;
                    end
                    else
                        Clear(SN);
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Option)
                {
                    field(Number; Number)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        trigger OnInit()
        begin
            Number := 98889;
        end;
    }

    trigger OnPreReport()
    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture);
    end;

    var
        CompInfo: Record "Company Information";
        SN: Integer;
        Temp: Integer;
        Number: Integer;
}