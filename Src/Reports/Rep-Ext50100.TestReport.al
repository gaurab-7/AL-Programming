reportextension 50100 TestReport extends TestReport
{
    dataset
    {
        add(SalesInvoiceHeader)
        {
            column(CompanyInfoPicture; CompanyInformation.Picture) { }
        }
    }
    var
        CompanyInformation: Record "Company Information";
}
