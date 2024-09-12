table 50123 "LC Details NEP"
{
    Caption = 'LC Detail';
    DataClassification = CustomerContent;
    LookupPageId = "LC Details NEP";

    fields
    {
        field(90016; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(90017; "LC\DO No."; Code[50])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Description := "LC\DO No.";
            end;
        }
        field(90018; Description; Code[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(90019; "Transaction Type"; Option)
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;
            OptionMembers = "Purchase","Sale";
            Description = 'LC purpose - sales LC or Purchase LC.';
        }
        field(90020; "Issued To/Received From"; Code[20])
        {
            Caption = 'Issued To/Received From';
            DataClassification = CustomerContent;
            TableRelation = if ("Transaction Type" = const(Sale)) Customer."No." else
            if ("Transaction Type" = const(Purchase)) Vendor."No.";

            trigger OnValidate()
            begin
                if ("Transaction Type" = "Transaction Type"::Purchase) then begin
                    if GblVendor.Get("Issued To/Received From") then begin
                        "Issued To/Received From Name" := CopyStr(GblVendor.Name, 1, 50);
                        Validate("Currency Code", GblVendor."Currency Code");
                    end;
                end else
                    if ("Transaction Type" = "Transaction Type"::Sale) then
                        if GblCustomer.Get("Issued To/Received From") then begin
                            "Issued To/Received From Name" := CopyStr(GblCustomer.Name, 1, 50);
                            Validate("Currency Code", GblCustomer."Currency Code");
                        end;
            end;
        }
        field(90021; "Issuing Bank"; Code[20])
        {
            Caption = 'Issuing Bank';
            DataClassification = CustomerContent;
            TableRelation = if ("Transaction Type" = const(Sale)) "Customer Bank Account".Code where("Customer No." = field("Issued To/Received From"))
            else
            if ("Transaction Type" = const(Purchase)) "Bank Account"."No.";

            trigger OnValidate()
            begin
                if ("Transaction Type" = "Transaction Type"::Purchase) then begin
                    BankAccount.Reset();
                    BankAccount.SetRange("No.", "Issuing Bank");
                    if BankAccount.Find('-') then begin
                        "Issue Bank Name 1" := BankAccount.Name;
                        Modify();
                    end;
                end else
                    if ("Transaction Type" = "Transaction Type"::Sale) then begin
                        GblCustomerBankAccount.Reset();
                        GblCustomerBankAccount.SetRange("Customer No.", "Issued To/Received From");
                        GblCustomerBankAccount.SetRange(Code, "Issuing Bank");
                        if GblCustomerBankAccount.Find('-') then begin
                            "Issue Bank Name 1" := GblCustomerBankAccount.Name;
                            "Issue Bank Name 2" := GblCustomerBankAccount."Name 2";
                            Modify();
                        end;
                    end;
            end;
        }
        field(90022; "Date of Issue"; Date)
        {
            Caption = 'Date of Issue';
            DataClassification = CustomerContent;
        }
        field(90023; "Receiving Bank"; Code[20])
        {
            Caption = 'Receiving Bank';
            DataClassification = CustomerContent;
            TableRelation = if ("Transaction Type" = const(Purchase)) "Vendor Bank Account".Code where("Vendor No." = field("Issued To/Received From"))
            else
            if ("Transaction Type" = const(Sale)) "Bank Account"."No." where(Blocked = const(false));

            trigger OnValidate()
            begin
                if ("Transaction Type" = "Transaction Type"::Purchase) then begin
                    GblVendorBankAccount.Reset();
                    GblVendorBankAccount.SetRange(Code, "Receiving Bank");
                    if GblVendorBankAccount.Find('-') then begin
                        "Receiving Bank Name" := GblVendorBankAccount.Name;
                        Modify();
                    end;
                end else
                    if ("Transaction Type" = "Transaction Type"::Sale) then begin
                        BankAccount.Reset();
                        BankAccount.SetRange("No.", "Receiving Bank");
                        if BankAccount.Find('-') then begin
                            "Receiving Bank Name" := BankAccount.Name;
                            Modify();
                        end;
                    end;
            end;
        }
        field(90024; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = CustomerContent;
        }
        field(90025; "LC Type"; Option)
        {
            Caption = 'LC Type';
            DataClassification = CustomerContent;
            OptionMembers = "","Sight LC","Usance LC","Advance Payment","Mixed Payment";
        }
        field(90026; "Type of Credit Limit"; Option)
        {
            Caption = 'Type of Credit Limit';
            DataClassification = CustomerContent;
            OptionMembers = "Fixed","Revolving";
        }
        field(90027; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
            DataClassification = CustomerContent;
            TableRelation = Currency;

            trigger OnValidate()
            begin
                if "Currency Code" <> '' then begin
                    CurrencyExchangeRate.SetRange("Currency Code", "Currency Code");
                    CurrencyExchangeRate.SetRange("Starting Date", 0D, "Date of Issue");
                    CurrencyExchangeRate.Find('+');
                    Validate("Exchange Rate", CurrencyExchangeRate."Relational Exch. Rate Amount" / CurrencyExchangeRate."Exchange Rate Amount");
                end;
            end;
        }
        field(90028; "Exchange Rate"; Decimal)
        {
            Caption = 'Exchange Rate';
            DecimalPlaces = 2 : 6;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Validate("LC Value");
            end;
        }
        field(90029; "LC Value"; Decimal)
        {
            Caption = 'LC Value';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Currency Code" <> '' then begin
                    Currency.Get("Currency Code");
                    "LC Value (LCY)" := Round("LC Value" * "Exchange Rate", Currency."Amount Rounding Precision");
                end else
                    "LC Value (LCY)" := "LC Value";
            end;
        }
        field(90030; "LC Value (LCY)"; Decimal)
        {
            Caption = 'LC Value (LCY)';
            DataClassification = CustomerContent;
        }
        field(90031; "Utilized Value"; Decimal)
        {
            Caption = 'Purchase Utilized Value(LCY)';
            FieldClass = FlowField;
            CalcFormula = sum("Value Entry"."Cost Amount (Actual)" where("Document Type" = filter("Purchase Invoice" | "Sales Invoice"),
                                                                            "Sys.LC No." = field("No.")));
        }
        field(90132; "Sales Utilized Value(LCY)"; Decimal)
        {
            Caption = 'Sales Utilized Value(LCY)';
            FieldClass = FlowField;
            CalcFormula = sum("Value Entry"."Sales Amount (Actual)" where("Document Type" = filter("Purchase Invoice" | "Sales Invoice"),
                                                                            "Sys.LC No." = field("No.")));
        }

        field(90032; "Remaining Value (LCY)"; Decimal)
        {
            Caption = 'Remaining Value (LCY)';
            DataClassification = CustomerContent;
        }
        field(90033; "Revolving Cr. Limit Type"; Option)
        {
            Caption = 'Revolving Cr. Limit Type';
            DataClassification = CustomerContent;
            OptionMembers = " ","Automatic","Manual";
        }
        field(90034; "Latest Amended Value"; Decimal)
        {
            Caption = 'Latest Amended Value';
            DataClassification = CustomerContent;
            TableRelation = "LC Amend Detail NEP";
        }
        field(90035; "Renewed Value"; Decimal)
        {
            Caption = 'Renewed Value';
            DataClassification = CustomerContent;
        }
        field(90036; Closed; Boolean)
        {
            Caption = 'Closed';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90037; Released; Boolean)
        {
            Caption = 'Released';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90038; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(90013; Remarks; Text[250])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(90040; "Has Amendment"; Boolean)
        {
            Caption = 'Has Amendment';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90041; "Tolerance Percentage"; Decimal)
        {
            Caption = 'Tolerance Percentage';
            DataClassification = CustomerContent;
        }
        field(90042; "Last Used Amendment No."; Code[20])
        {
            Caption = 'Last Used Amendment No.';
            DataClassification = CustomerContent;
        }
        field(90043; "Issued To/Received From Name"; Text[50])
        {
            Caption = 'Issued To/Received From Name';
            DataClassification = CustomerContent;
        }
        field(90044; "Issue Bank Name 1"; Text[100])
        {
            Caption = 'Issued Bank Name 1';
            DataClassification = CustomerContent;
        }
        field(90045; "Receiving Bank Name"; Text[100])
        {
            Caption = 'Receiving Bank Name';
            DataClassification = CustomerContent;
        }
        field(90046; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
            DataClassification = CustomerContent;
        }
        field(90047; "BG Type"; Option)
        {
            Caption = 'BG Type';
            DataClassification = CustomerContent;
            OptionMembers = " ","Bid Bond","Performance Bond","APB";
        }
        field(90048; Units; Integer)
        {
            Caption = 'Units';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                CalcRemainingUtilizedUnit();
            end;
        }
        field(90049; "Allotment Type"; Option)
        {
            Caption = 'Allotment Type';
            OptionMembers = "Insurance","Letter of Credit";
            FieldClass = FlowFilter;
        }
        field(90050; Location; Code[10])
        {
            Caption = 'Location';
            DataClassification = CustomerContent;
        }
        field(90051; "Insured By"; Code[20])
        {
            Caption = 'Insured By';
            DataClassification = CustomerContent;
        }
        field(90052; Incoterms; Option)
        {
            Caption = 'Incoterms';
            DataClassification = CustomerContent;
            OptionMembers = " ","C&F","CIF","CIP","FOB","CFR","C&I","CNI";
        }
        field(90053; Notes; Text[250])
        {
            Caption = 'Notes';
            DataClassification = CustomerContent;
        }
        field(90054; "Issue Bank Name 2"; Code[50])
        {
            Caption = 'Issue Bank Name 2';
            DataClassification = CustomerContent;
        }
        field(90055; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = CustomerContent;
        }
        field(90056; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = CustomerContent;
        }
        field(90000; "Interest Rate"; Decimal)
        {
            Caption = 'Interest Rate';
            DataClassification = CustomerContent;
        }
        field(90001; "Document Type"; Option)
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
            OptionMembers = " ","Letter of Credit","Bank Guarantee","Delivery Order";

            trigger OnValidate()
            begin
                GetNoSeries();
            end;
        }
        field(90002; "Purchased LC Utilised (LCY)"; Decimal)
        {
            Caption = 'Purchased LC Utilised (LCY)';
            DataClassification = CustomerContent;
        }
        field(90003; "Sales LC Utilised"; Decimal)
        {
            Caption = 'Sales LC Utilised';
            DataClassification = CustomerContent;
        }
        field(90004; "Limit Utilised"; Decimal)
        {
            Caption = 'Limit Utilised';
            DataClassification = CustomerContent;
        }
        field(90005; "Purchase LC Utilised"; Decimal)
        {
            Caption = 'Purchase LC Utilised';
            DataClassification = CustomerContent;
        }
        field(90006; "Latest DAte of Shipment"; Date)
        {
            Caption = 'Latest DAte of Shipment';
            DataClassification = CustomerContent;
        }
        field(90007; Expired; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90008; "Loan No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Bank Account" where("Object Type" = filter(Loan), Released = const(true), Blocked = const(false));
        }
        field(90009; "Document Value"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("LC No." = field("No."), "LC Entry Type" = const("Document Value")));
        }
        field(90010; "LC Margin"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("LC No." = field("No."), "LC Entry Type" = const("LC Margin")));
        }
        field(90011; "LC Charge"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("LC No." = field("No."), "LC Entry Type" = const("LC Charge")));
        }
        field(90012; "LC Commission"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("LC No." = field("No."), "LC Entry Type" = const("LC Commission")));
        }
        field(90039; "NRB Margin"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("LC No." = field("No."), "LC Entry Type" = const("NRB Margin")));
        }
        field(90014; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(90015; "Inco Terms"; Enum "IncoTerms NEP")
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.", "LC\DO No.")
        {
            Clustered = true;

        }
    }

    trigger OnInsert()
    begin
        "Date of Issue" := WorkDate();
    end;

    trigger OnModify()
    begin
        if Closed then
            Error(CannotModifyClosedLCErr);
    end;

    trigger OnDelete()
    begin
        if Closed or Released then
            Error(CannotDeleteLCErr);
    end;

    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        GblVendor: Record Vendor;
        GblCustomer: Record Customer;
        BankAccount: Record "Bank Account";
        GblCustomerBankAccount: Record "Customer Bank Account";
        GblVendorBankAccount: Record "Vendor Bank Account";
        CurrencyExchangeRate: Record "Currency Exchange Rate";
        Currency: Record Currency;
        GblLCAmendDetailNEP: Record "LC Amend Detail NEP";
        GlobalLCAmendDetailNEP1: Record "LC Amend Detail NEP";
        GblLCDetailsNep: Record "LC Details NEP";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        GlobalLCAmendDetailCardNep: Page "LC Amend Detail Card NEP";
        GblLCANo: Code[20];
        DoYouWantToReleaseQst: Label 'Do you want to Release? ';
        LCReleasedMsg: Label 'The LC has been Released. ';
        AmendDocumentQst: Label 'Do you want to Amend this Document ? ';
        CannotModifyClosedLCErr: Label 'You cannot modify Closed LC.';
        CannotDeleteLCErr: Label 'You cannot delete closed or released LC. ';
        CannotAmendLCErr: Label 'Cannot Amend LC %1. Status is closed. ', Comment = '%1 = LC No.';
        LCClosedMsg: Label 'The LC has been closed. ';
        LCClosedErr: Label ' The LC is already closed.';
        CloseLCQst: Label 'Do you want to close LC ? ';
        ReopenLCQst: Label ' Do you want to reopen LC ?';
        CannotAmendAgainErr: Label 'Without releasing the previous amendment you cannot Amend again.';
        AmendedWithoutReleasingErr: Label 'You cannot Amended without releasing the document. ';

    procedure ReleaseLC(ParmLCDetailsNep: Record "LC Details NEP")
    begin
        if Confirm(DoYouWantToReleaseQst) then
            if not ParmLCDetailsNep.Released then begin
                ParmLCDetailsNep.Released := true;
                ParmLCDetailsNep.Modify();
                Message(LCReleasedMsg);
            end else
                Message(LCReleasedMsg)
        else
            exit;
    end;

    procedure AmendLC(ParmLCDetailsNEP: Record "LC Details NEP")
    begin
        if ParmLCDetailsNEP.Released then begin
            Clear(GlobalLCAmendDetailCardNep);
            if ParmLCDetailsNEP.Closed then
                Error(CannotAmendLCErr, "LC\DO No.");
            if Confirm(AmendDocumentQst) then begin
                GblLCAmendDetailNEP.SetRange("No.", ParmLCDetailsNEP."No.");
                if not GblLCAmendDetailNEP.FindFirst() then begin    //If amendment is not found for this LC.
                    GlobalLCAmendDetailNEP1.Init();
                    GlobalLCAmendDetailNEP1."Version No." := getLCAVersionNo(ParmLCDetailsNEP."No.");
                    //mamata
                    GlobalLCAmendDetailNEP1."No." := ParmLCDetailsNEP."No.";
                    //mamata
                    GlobalLCAmendDetailNEP1."Document Type" := ParmLCDetailsNEP."Document Type";
                    GlobalLCAmendDetailNEP1."LC No." := CopyStr(ParmLCDetailsNEP."LC\DO No.", 1, 20);
                    GlobalLCAmendDetailNEP1.Description := ParmLCDetailsNEP.Description;
                    GlobalLCAmendDetailNEP1."Transaction Type" := ParmLCDetailsNEP."Transaction Type";
                    GlobalLCAmendDetailNEP1."Issued To/Received From" := ParmLCDetailsNEP."Issued To/Received From";
                    GlobalLCAmendDetailNEP1."Issuing Bank" := ParmLCDetailsNEP."Issuing Bank";
                    GlobalLCAmendDetailNEP1."Date of Issue" := ParmLCDetailsNEP."Date of Issue";
                    GlobalLCAmendDetailNEP1."LC Type" := ParmLCDetailsNEP."LC Type";
                    GlobalLCAmendDetailNEP1."Type of Credit Limit" := ParmLCDetailsNEP."Type of Credit Limit";
                    GlobalLCAmendDetailNEP1."Revolving Cr. Limit Type" := ParmLCDetailsNEP."Revolving Cr. Limit Type";
                    GlobalLCAmendDetailNEP1."Currency Code" := ParmLCDetailsNEP."Currency Code";
                    GlobalLCAmendDetailNEP1."Previous LC Value" := ParmLCDetailsNEP."LC Value";
                    GlobalLCAmendDetailNEP1."Exchange Rate" := ParmLCDetailsNEP."Exchange Rate";
                    GlobalLCAmendDetailNEP1."Receiving Bank" := ParmLCDetailsNEP."Receiving Bank";
                    GlobalLCAmendDetailNEP1."Amended Date" := Today;
                    GlobalLCAmendDetailNEP1."Tolerance Percentage" := ParmLCDetailsNEP."Tolerance Percentage";
                    GlobalLCAmendDetailNEP1."Issued To/Received From Name" := ParmLCDetailsNEP."Issued To/Received From Name";
                    GlobalLCAmendDetailNEP1."Issue Bank Name 1" := ParmLCDetailsNEP."Issue Bank Name 1";
                    GlobalLCAmendDetailNEP1."Issue Bank Name 2" := ParmLCDetailsNEP."Issue Bank Name 2";
                    GlobalLCAmendDetailNEP1."Receiving Bank Name" := ParmLCDetailsNEP."Receiving Bank Name";
                    GlobalLCAmendDetailNEP1.Insert(true);

                    updateLastLCAmdNo(ParmLCDetailsNEP."No.", GlobalLCAmendDetailNEP1."Version No.");
                    Commit();
                end else begin              //If amendment is found for this LC.
                    GblLCAmendDetailNEP.Find('+');
                    if not GblLCAmendDetailNEP.Released then
                        Error(CannotAmendAgainErr);

                    GlobalLCAmendDetailNEP1.Init();
                    GlobalLCAmendDetailNEP1."Version No." := getLCAVersionNo(ParmLCDetailsNEP."No.");
                    GlobalLCAmendDetailNEP1."Document Type" := ParmLCDetailsNEP."Document Type";
                    GlobalLCAmendDetailNEP1."No." := ParmLCDetailsNEP."No.";
                    GlobalLCAmendDetailNEP1."LC No." := GblLCAmendDetailNEP."LC No.";
                    GlobalLCAmendDetailNEP1.Description := GblLCAmendDetailNEP.Description;
                    GlobalLCAmendDetailNEP1."Transaction Type" := GblLCAmendDetailNEP."Transaction Type";
                    GlobalLCAmendDetailNEP1."Issued To/Received From" := GblLCAmendDetailNEP."Issued To/Received From";
                    GlobalLCAmendDetailNEP1."Issuing Bank" := GblLCAmendDetailNEP."Issuing Bank";
                    GlobalLCAmendDetailNEP1."Date of Issue" := GblLCAmendDetailNEP."Date of Issue";
                    GlobalLCAmendDetailNEP1."Type of Credit Limit" := GblLCAmendDetailNEP."Type of Credit Limit";
                    GlobalLCAmendDetailNEP1."LC Type" := GblLCAmendDetailNEP."LC Type";
                    GlobalLCAmendDetailNEP1."Currency Code" := GblLCAmendDetailNEP."Currency Code";
                    GlobalLCAmendDetailNEP1."Previous LC Value" := GblLCAmendDetailNEP."LC Value";
                    GlobalLCAmendDetailNEP1."Exchange Rate" := GblLCAmendDetailNEP."Exchange Rate";
                    GlobalLCAmendDetailNEP1."Receiving Bank" := GblLCAmendDetailNEP."Receiving Bank";
                    GlobalLCAmendDetailNEP1."Tolerance Percentage" := GblLCAmendDetailNEP."Tolerance Percentage";
                    GlobalLCAmendDetailNEP1."Issued To/Received From Name" := ParmLCDetailsNEP."Issued To/Received From Name";
                    GlobalLCAmendDetailNEP1."Issue Bank Name 1" := ParmLCDetailsNEP."Issue Bank Name 1";
                    GlobalLCAmendDetailNEP1."Receiving Bank Name" := ParmLCDetailsNEP."Receiving Bank Name";
                    GlobalLCAmendDetailNEP1."Amended Date" := Today;
                    GlobalLCAmendDetailNEP1.Insert(true);

                    updateLastLCAmdNo(ParmLCDetailsNEP."No.", GlobalLCAmendDetailNEP1."Version No.");
                    Commit();
                end;

                Page.Run(Page::"LC Amend Detail Card NEP", GlobalLCAmendDetailNEP1);
            end else
                exit;
        end else
            Message(AmendedWithoutReleasingErr);
    end;

    procedure CloseLC(ParmLCDetailsNEP: Record "LC Details NEP")
    begin
        //Code to Close LC Details.
        if Confirm(CloseLCQst) then
            if not ParmLCDetailsNEP.Closed then begin
                ParmLCDetailsNEP.TestField(Released);
                ParmLCDetailsNEP.Closed := true;
                ParmLCDetailsNEP.Modify();
                GblLCAmendDetailNEP.Reset();
                GblLCAmendDetailNEP.SetRange("No.", ParmLCDetailsNEP."No.");
                if GblLCAmendDetailNEP.Find('-') then
                    repeat
                        GblLCAmendDetailNEP.Closed := true;
                        GblLCAmendDetailNEP.Modify();
                    until GblLCAmendDetailNEP.Next() = 0;
                Message(LCClosedMsg);
            end else
                Message(LCClosedErr)
        else
            exit;
    end;

    procedure ReopenLC(ParmLCDetailsNEP: Record "LC Details NEP")
    begin
        //Code to Reopen LC Details.
        if Confirm(ReopenLCQst) then
            if ParmLCDetailsNEP.Closed then begin
                ParmLCDetailsNEP.Closed := false;
                ParmLCDetailsNEP.Modify();

                GblLCAmendDetailNEP.Reset();
                GblLCAmendDetailNEP.SetRange("No.", ParmLCDetailsNEP."No.");
                if GblLCAmendDetailNEP.Find('-') then
                    repeat
                        GblLCAmendDetailNEP.Closed := false;
                        GblLCAmendDetailNEP.Modify();
                    until GblLCAmendDetailNEP.Next() = 0;
                Message('The LC has been reopened.');
            end else
                Message('This LC is already open.')
        else
            exit;
    end;

    procedure getLCAVersionNo(PrmLCNo: Code[20]): Code[10]
    begin
        //Returning LC Amend No.
        GblLCDetailsNep.Reset();
        GblLCDetailsNep.SetRange("No.", PrmLCNo);
        if GblLCDetailsNep.FindFirst() then
            if (GblLCDetailsNep."Last Used Amendment No." <> '') then
                GblLCANo := IncStr(GblLCDetailsNep."Last Used Amendment No.")
            else
                GblLCANo := '00001';

        exit(CopyStr(GblLCANo, 1, 10));
    end;

    procedure updateLastLCAmdNo(PrmLCNo: Code[20]; PrmNewLCAmdNo: Code[20]): Code[10]
    begin
        //Updating LC Details - Last Amendment No.
        GblLCDetailsNep.Reset();
        GblLCDetailsNep.SetRange("No.", PrmLCNo);
        if GblLCDetailsNep.Find('-') then begin
            GblLCDetailsNep."Last Used Amendment No." := PrmNewLCAmdNo;
            GblLCDetailsNep.Modify();
        end;
    end;

    procedure CalcRemainingUtilizedUnit()
    begin
        CalcFields("Utilized Value");
        Validate("Remaining Value (LCY)", Units - "Utilized Value");
    end;

    local procedure GetNoSeries()
    begin
        GeneralLedgerSetup.Get();
        case "Document Type" of
            "Document Type"::"Letter of Credit":
                begin
                    GeneralLedgerSetup.TestField("LC No.");
                    NoSeriesManagement.InitSeries(GeneralLedgerSetup."LC No.", xRec."No. Series", 0D, "No.", "No. Series");

                end;
            "Document Type"::"Bank Guarantee":
                begin
                    GeneralLedgerSetup.TestField("BG No.");
                    NoSeriesManagement.InitSeries(GeneralLedgerSetup."BG No.", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            "Document Type"::"Delivery Order":
                begin
                    GeneralLedgerSetup.TestField("DO No.");
                    NoSeriesManagement.InitSeries(GeneralLedgerSetup."DO No.", xRec."No. Series", 0D, "No.", "No. Series");
                end;
        end;
    end;
}