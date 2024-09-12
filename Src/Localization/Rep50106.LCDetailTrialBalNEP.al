report 50106 "LC Detail Trial Bal. NEP"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/5.Report/RDLC Layouts/LCDetailTrialBalance.rdl';
    Caption = 'LC Report';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("LC Details"; "LC Details NEP")
        {
            DataItemTableView = where("Transaction Type" = const(Purchase));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Date Filter", "Issued To/Received From";

            column(ShowSummary; ShowSummary)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFaxNo; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyVATNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(DocClassNo_DocumentClassMaster; "LC Details"."No.")
            {
            }
            column(StartingNepaliDate; StartDateNep)
            {
            }
            column(EndingNepaliDate; EndDateNep)
            {
            }
            column(Balance; StartBalance)
            {
            }
            column(OpeningBal; OpeningBalance)
            {
            }
            column(OpeningBalDrCr; OpeningBalDrCr)
            {
            }
            column(AllFilters; AllFilters)
            {
            }
            column(ReportHeading; ReportHeadingLbl)
            {
            }
            column(LCDONo_LCDetails; "LC Details"."LC\DO No.")
            {
            }
            column(IssuedToReceivedFrom_LCDetails; "LC Details"."Issued To/Received From")
            {
            }
            column(IssuedToReceivedFromName_LCDetails; "LC Details"."Issued To/Received From Name")
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "LC No." = field("No."),
                               "Posting Date" = field("Date Filter");

                column(PostingDate_GLEntry; Format(GLEntry."Posting Date"))
                {
                }
                column(ExternalDocumentNo_GLEntry; GLEntry."External Document No.")
                {
                }
                column(DocumentNo_GLEntry; GLEntry."Document No.")
                {
                }
                column(GLAccountNo_GLEntry; GLEntry."G/L Account No.")
                {
                }
                column(Description_GLEntry; GLEntry.Description)
                {
                }
                column(DebitAmount_GLEntry; GLEntry."Debit Amount")
                {
                }
                column(CreditAmount_GLEntry; GLEntry."Credit Amount")
                {
                }
                column(RunningBalance; RunningBalance)
                {
                }
                column(Narration_GLEntry; GLEntry.Narration)
                {
                }
                column(SourceName; GLEntry."Source Name")
                {
                }
                column(DrCrIndication; DrCrIndication)
                {
                }
                column(GLAccountName_GLEntry; GLEntry."G/L Account Name")
                {
                }
                column(DocumentType_GLEntry; GLEntry."Document Type")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    RunningBalance := RunningBalance + Amount;
                    if RunningBalance > 0 then
                        DrCrIndication := 'Dr.'
                    else
                        DrCrIndication := 'Cr.';
                end;

                trigger OnPreDataItem()
                begin
                    if GLAccFilter <> '' then
                        SetFilter("G/L Account No.", GLAccFilter);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                RunningBalance := 0;
                StartBalance := 0;
                OpeningBalance := 0;
                GLEntry.Reset();
                GLEntry.SetFilter("Global Dimension 1 Code", "LC Details"."No.");
                GLEntry.SetFilter("Posting Date", '<%1', StartEngDate);
                if GLAccFilter <> '' then
                    GLEntry.SetFilter("G/L Account No.", GLAccFilter);

                if GLEntry.FindSet() then
                    repeat
                        StartBalance += GLEntry.Amount;
                    until GLEntry.Next() = 0;

                OpeningBalance := StartBalance;
                RunningBalance := StartBalance;

                if OpeningBalance < 0 then
                    OpeningBalDrCr := 'Cr.';

                if OpeningBalance > 0 then
                    OpeningBalDrCr := 'Dr.';

                if OpeningBalance = 0 then
                    OpeningBalDrCr := '';
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group("LC Code Filter")
                {
                    field("Show Summary"; ShowSummary)
                    {
                        Caption = 'Show Summery';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the ShowSummary field.';
                    }
                    field("GL Account Filter"; GLAccFilter)
                    {
                        Caption = 'GL Account Filter';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the GLAccFilter field.';

                        trigger OnLookup(var Text: Text): Boolean;
                        begin
                            GLAcc.Reset();
                            if Page.RunModal(0, GLAcc) = Action::LookupOK then
                                if StrPos(GLAccFilter, GLAcc."No.") = 0 then
                                    if GLAccFilter <> '' then
                                        GLAccFilter += '|' + GLAcc."No."
                                    else
                                        GLAccFilter := GLAcc."No.";
                        end;
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        AllFilters := "LC Details".GetFilters;
        DateFilter := "LC Details".GetFilter("Date Filter");
        if GLAccFilter <> '' then
            AllFilters += ',' + GLAccFilter;

        CompanyInfo.Get();
        if DateFilter <> '' then begin
            StartDateNep := '';
            EndDateNep := '';
            StartEngDate := 0D;
            EndEngDate := 0D;

            StartEngDate := "LC Details".GetRangeMin("Date Filter");
            EndEngDate := "LC Details".GetRangeMax("Date Filter");

            NepaliCal.Reset();
            NepaliCal.SetRange("English Date", StartEngDate);
            if NepaliCal.FindFirst() then
                StartDateNep := NepaliCal."Nepali Date";

            NepaliCal.Reset();
            NepaliCal.SetRange("English Date", EndEngDate);
            if NepaliCal.FindFirst() then
                EndDateNep := NepaliCal."Nepali Date";

            AllFilters += ',' + StartDateNep + '..' + EndDateNep;
        end;

        GLSetup.Get();
    end;

    var
        GLEntry: Record "G/L Entry";
        NepaliCal: Record "English-Nepali Date NEP";
        CompanyInfo: Record "Company Information";
        GLSetup: Record "General Ledger Setup";
        GLAcc: Record "G/L Account";
        OpeningBalance: Decimal;
        StartDateNep: Code[10];
        EndDateNep: Code[10];
        StartEngDate: Date;
        EndEngDate: Date;
        DateFilter: Text;
        AllFilters: Text;
        StartBalance: Decimal;
        RunningBalance: Decimal;
        DrCrIndication: Text;
        OpeningBalDrCr: Text;
        GLAccFilter: Code[20];
        ShowSummary: Boolean;
        ReportHeadingLbl: Label 'LC Detail Trial Bal.';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}