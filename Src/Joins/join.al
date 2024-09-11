query 50105 "join Querry"
{
    QueryType = Normal;
    QueryCategory = 'Vendor List', 'Purchase Order List';
    OrderBy = descending(Quantity);

    elements
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.")
            {
            }
            column(CustomerName; Name)
            {
            }
            dataitem(Sales_Line; "Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                column(Quantity; Quantity)
                {
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin
    end;
}