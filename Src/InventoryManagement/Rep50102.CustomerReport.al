report 50102 CustomerReport
{
    ApplicationArea = All;
    Caption = 'Customer Report';
    RDLCLayout = 'RDLC\CustomerReport.rdl';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(CustomersInv; CustomersInv)
        {
            RequestFilterFields = "Customer No.";
            column(Address; Address) { }
            column(Contact_No; "Contact No.") { }
            column(CustomerNo; "Customer No.") { }
            column(Name; Name) { }
            column(Image; CompInfo.Picture) { }
            column(CompName; CompInfo.Name) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompAddress; CompInfo.Address) { }
            column(VATRegistrationNo; CompInfo."VAT Registration No.") { }
            dataitem("Inventory Customer"; "Inventory Customer")
            {
                DataItemLink = "Customer No." = field("Customer No.");
                column(Transaction_ID; "Transaction ID") { }
                column(Customer_Name; "Customer Name") { }
                column(Customer_No_; "Customer No.") { }
                column(Item_Name; "Item Name") { }
                column(Item_No_; "Item No.") { }
                column(Item_Quantity; "Item Quantity") { }
                column(Type; Type) { }
                column(Amount; Amount) { }
                column(SN; SN) { }
                dataitem("Inventory Management"; "Inventory Management")
                {
                    DataItemLink = "Item No." = field("Item No.");
                    column(Unit_Price; "Unit Price") { }
                }

                trigger OnAfterGetRecord()
                begin
                    SN += 1;
                end;
            }
            trigger OnPreDataItem()
            begin
                SN := 0;
            end;
        }
    }

    trigger OnInitReport()
    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture);
    end;

    var
        CompInfo: Record "Company Information";
        SN: Integer;
}
