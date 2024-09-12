codeunit 50111 "System Managements NEP"
{
    //     trigger OnRun()
    //     begin
    //     end;

    //     var
    //         ResponsibilityCenter: Record "Responsibility Center";
    //         CompanyInformationGbl: Record "Company Information";
    //         Usersetup: Record "User Setup";
    //         EnglishNepaliDateNep: Record "English-Nepali Date NEP";
    //         HasGotPurchUserSetup: Boolean;
    //         HasGotSalesUserSetup: Boolean;
    //         HasGotServUserSetup: Boolean;
    //         HasGotGLSetup: Boolean;
    //         UserLocation: code[10];
    //         GLSetupShortcutDimCode: array[8] of Code[20];
    //         DateOrderErr: Label '-You cannot assign new numbers from the number series %1 on a date before %2.', Comment = '%1 = New Number From No.Series, %2 = Date before';
    //         MailBody1Txt: Label 'Voucher type: %1<br>', Comment = 'Voucher type: %1<br>';
    //         MailBody2Txt: Label 'Voucher No: %1<br>', Comment = 'Voucher No: %1<br>';
    //         MailBody3Txt: Label 'posting date: %1<br>', Comment = 'posting date: %1<br>';
    //         MailBody4Txt: Label 'Voucher amount:%1<br>', Comment = 'Voucher amount:%1<br>';
    //         MailBody5Txt: Label 'Regards,<br>%1', Comment = 'Regards,<br>%1';
    //         MailBody6Lbl: Label 'Voucher amount: %1<br>', Comment = 'Voucher amount: %1<br>';

    //     procedure GetUserLocation(): Code[10]
    //     var
    //         UserSetup2: Record "User Setup";
    //         isHandled: Boolean;
    //     begin
    //         OnBeforeGetUserLocation(isHandled);
    //         if isHandled then
    //             exit;
    //         UserSetup2.Get(UserId());
    //         UserSetup2.TestField("Default Location");
    //         exit(UserSetup2."Default Location");
    //     end;

    //     procedure PrintVoucher(DocumentNo: Code[20]; PostingDate: Date)
    //     var
    //         GLEntry: Record "G/L Entry";
    //         IsHandled: Boolean;
    //     begin
    //         OnBeforePrintVoucher(DocumentNo, PostingDate, IsHandled);
    //         if IsHandled then
    //             exit;
    //         GLEntry.Reset();
    //         GLEntry.SetRange("Document No.", DocumentNo);
    //         GLEntry.SetRange("Posting Date", PostingDate);
    //         if GLEntry.FindFirst() then
    //             Report.Run(Report::"Posted Voucher NEP", true, false, GLEntry);
    //     end;

    //     procedure EnableTransactiontype(AccountType: Enum "Gen. Journal Account Type"): Boolean
    //     var
    //         HumanResourcesSetup: Record "Human Resources Setup";
    //         PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    //         SalesReceivablesSetup: Record "Sales & Receivables Setup";
    //         GeneralLedgerSetup: Record "General Ledger Setup";

    //     begin
    //         case AccountType of
    //             AccountType::Vendor:
    //                 begin
    //                     PurchasesPayablesSetup.Get();
    //                     exit(PurchasesPayablesSetup."Enable Transaction Type");
    //                 end;
    //             AccountType::Customer:
    //                 begin
    //                     SalesReceivablesSetup.Get();
    //                     exit(SalesReceivablesSetup."Enable Transaction Type");
    //                 end;
    //             AccountType::Employee:
    //                 begin
    //                     HumanResourcesSetup.Get();
    //                     exit(HumanResourcesSetup."Enable Transaction Type");
    //                 end;
    //             AccountType::"Bank Account":
    //                 begin
    //                     GeneralLedgerSetup.Get();
    //                     exit(GeneralLedgerSetup."Enable Transaction Type");
    //                 end;
    //             AccountType::"Fixed Asset", AccountType::"G/L Account", AccountType::"IC Partner":
    //                 exit(false);
    //         end;
    //     end;

    //     procedure PrintDebtiCreditNote(DocumentNo: Code[20]; PostingDate: Date)
    //     var
    //         GLEntry: Record "G/L Entry";
    //     begin
    //         GLEntry.Reset();
    //         GLEntry.SetRange("Document No.", DocumentNo);
    //         GLEntry.SetRange("Posting Date", PostingDate);
    //         if GLEntry.FindFirst() then
    //             Report.Run(50025, true, false, GLEntry);
    //     end;

    //     procedure GetExchangeRates(Currency: Record Currency)
    //     var
    //         GeneralLedgerSetup: Record "General Ledger Setup";
    //         HttpClient: HttpClient;
    //         HttpResponseMessageLoc: HttpResponseMessage;
    //         ResponseText: Text;
    //         url: Text;
    //         FixerUrlTxt: Label 'http://api.fixer.io/latest?base=%1&symbols=%2', Comment = '%1 = base, %2 = Symbols';
    //     begin
    //         GeneralLedgerSetup.Get();
    //         url := StrSubstNo(FixerUrlTxt, GeneralLedgerSetup.GetCurrencyCode(''), Currency.Code);
    //         if HttpClient.Get(url, HttpResponseMessageLoc) then begin
    //             HttpResponseMessageLoc.Content.ReadAs(ResponseText);
    //             Message(ResponseText);
    //         end;
    //     end;



    //     procedure UpdateDimensionInValueEntry()
    //     var
    //         ValueEntry: Record "Value Entry";
    //         DimensionSetEntry: Record "Dimension Set Entry";
    //         GeneralLedgerSetup: Record "General Ledger Setup";
    //     begin
    //         GeneralLedgerSetup.Get();

    //         ValueEntry.Reset();
    //         ValueEntry.SetRange("Shortcut Dimension 3 Code", '');
    //         if ValueEntry.FindSet() then
    //             repeat
    //                 DimensionSetEntry.Reset();
    //                 DimensionSetEntry.SetRange("Dimension Set ID", ValueEntry."Dimension Set ID");
    //                 if DimensionSetEntry.FindSet() then
    //                     repeat
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 3 Code" then
    //                             ValueEntry."Shortcut Dimension 3 Code" := DimensionSetEntry."Dimension Value Code";
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 4 Code" then
    //                             ValueEntry."Shortcut Dimension 4 Code" := DimensionSetEntry."Dimension Value Code";
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 5 Code" then
    //                             ValueEntry."Shortcut Dimension 5 Code" := DimensionSetEntry."Dimension Value Code";
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 6 Code" then
    //                             ValueEntry."Shortcut Dimension 6 Code" := DimensionSetEntry."Dimension Value Code";
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 7 Code" then
    //                             ValueEntry."Shortcut Dimension 7 Code" := DimensionSetEntry."Dimension Value Code";
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 8 Code" then
    //                             ValueEntry."Shortcut Dimension 8 Code" := DimensionSetEntry."Dimension Value Code";
    //                     until DimensionSetEntry.Next() = 0;

    //                 ValueEntry.Modify();
    //             until ValueEntry.Next() = 0;

    //         Message('Value Entries Dimension updated !');
    //     end;

    //     procedure UpdateDimensionInItemLedgerEntry()
    //     var
    //         ItemLedgerEntry: Record "Item Ledger Entry";
    //         DimensionSetEntry: Record "Dimension Set Entry";
    //         GeneralLedgerSetup: Record "General Ledger Setup";
    //     begin
    //         GeneralLedgerSetup.Get();

    //         ItemLedgerEntry.Reset();
    //         ItemLedgerEntry.SetRange("Shortcut Dimension 3 Code", '');
    //         if ItemLedgerEntry.FindSet() then
    //             repeat
    //                 DimensionSetEntry.Reset();
    //                 DimensionSetEntry.SetRange("Dimension Set ID", ItemLedgerEntry."Dimension Set ID");
    //                 if DimensionSetEntry.FindSet() then
    //                     repeat
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 3 Code" then
    //                             ItemLedgerEntry."Shortcut Dimension 3 Code" := DimensionSetEntry."Dimension Value Code";
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 4 Code" then
    //                             ItemLedgerEntry."Shortcut Dimension 4 Code" := DimensionSetEntry."Dimension Value Code";
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 5 Code" then
    //                             ItemLedgerEntry."Shortcut Dimension 5 Code" := DimensionSetEntry."Dimension Value Code";
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 6 Code" then
    //                             ItemLedgerEntry."Shortcut Dimension 6 Code" := DimensionSetEntry."Dimension Value Code";
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 7 Code" then
    //                             ItemLedgerEntry."Shortcut Dimension 7 Code" := DimensionSetEntry."Dimension Value Code";
    //                         if DimensionSetEntry."Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 8 Code" then
    //                             ItemLedgerEntry."Shortcut Dimension 8 Code" := DimensionSetEntry."Dimension Value Code";
    //                     until DimensionSetEntry.Next() = 0;

    //                 ItemLedgerEntry.Modify();
    //             until ItemLedgerEntry.Next() = 0;

    //         Message('Item LedgerEntry Dimension Updated');
    //     end;

    procedure GetNoSeriesFromRespCenter(): Boolean
    var
        CompanyInformationLoc: Record "Company Information";
    begin
        CompanyInformationLoc.Get();
        exit(CompanyInformationLoc."Activate Local Resp. Center");
    end;

    procedure GetUserRespCenter(): Code[20]
    var
        UserSetup2: Record "User Setup";
        isHandled: Boolean;

    begin
        OnBeforeGetUserRespCenter(isHandled);
        if isHandled then
            exit;
        UserSetup2.Get(UserId);
        if GuiAllowed then
            UserSetup2.TestField("Default Responsibility Center");

        exit(UserSetup2."Default Responsibility Center");
    end;

    //     procedure GetUserRespCenterFilter() RespCenterFilter: Text
    //     begin
    //         UserSetup.Get(UserId);
    //         if UserSetup."Default Responsibility Center" <> '' then
    //             RespCenterFilter := UserSetup."Default Responsibility Center";

    //         exit(RespCenterFilter);
    //     end;

    //     //procedure TestNoseriesFromRespCenter("Document Profile": Option Purchase,sales,Transfer,Service; "Document Type": Option Quote,"Blanket Order",Order,"Return Order",Invoice,"Posted Invoice","Credit Memo","Posted Credit Memo","Posted Shipment","Posted Receipt","Posted Prepmt. Inv.","Posted Prepmt. Cr. Memo","Posted Return Receipt","Posted Return Shipment",Booking,"Posted Order","Posted Debit Note",Requisition,Services,"Posted Credit Note"; RespCenterCode: Code[10])
    procedure TestNoseriesFromRespCenter("Document Profile": Option Purchase,sales,Transfer,Service; "Document Type": Option Quote,"Blanket Order",Order,"Return Order",Invoice,"Posted Invoice","Credit Memo","Posted Credit Memo","Posted Shipment","Posted Receipt","Posted Prepmt. Inv.","Posted Prepmt. Cr. Memo","Posted Return Receipt","Posted Return Shipment",Booking,"Posted Order","Posted Debit Note",Requisition,Services,"Posted Credit Note"; RespCenterCode: Code[20])
    var
        ResponsibilityCenter2: Record "Responsibility Center";
    begin
        if ResponsibilityCenter2.Get(RespCenterCode) then
            case "Document Profile" of
                "Document Profile"::Purchase:
                    case "Document Type" of
                        "Document Type"::Quote:
                            ResponsibilityCenter2.TestField("Purch. Quote Nos.");
                        "Document Type"::"Blanket Order":
                            ResponsibilityCenter2.TestField("Purch. Blanket Order Nos.");
                        "Document Type"::Order:
                            ResponsibilityCenter2.TestField("Purch. Order Nos.");
                        "Document Type"::"Return Order":
                            ResponsibilityCenter2.TestField("Purch. Return Order Nos.");
                        "Document Type"::Invoice:
                            ResponsibilityCenter2.TestField("Purch. Invoice Nos.");
                        "Document Type"::"Posted Invoice":
                            ResponsibilityCenter2.TestField("Purch. Posted Invoice Nos.");
                        "Document Type"::"Credit Memo":
                            ResponsibilityCenter2.TestField("Purch. Credit Memo Nos.");
                        "Document Type"::"Posted Credit Memo":
                            ResponsibilityCenter2.TestField("Purch. Posted Credit Memo Nos.");
                        "Document Type"::"Posted Receipt":
                            ResponsibilityCenter2.TestField("Purch. Posted Receipt Nos.");
                        "Document Type"::"Posted Return Shipment":
                            ResponsibilityCenter2.TestField("Purch. Ptd. Return Shpt. Nos.");
                        "Document Type"::"Posted Prepmt. Inv.":
                            ResponsibilityCenter2.TestField("Purch. Posted Prept. Inv. Nos.");
                        "Document Type"::"Posted Prepmt. Cr. Memo":
                            ResponsibilityCenter2.TestField("Purch. Ptd. Prept. Cr. M. Nos.");
                    end;
                "Document Profile"::Sales:
                    case "Document Type" of
                        "Document Type"::Quote:
                            ResponsibilityCenter2.TestField("Sale Quote Nos.");
                        "Document Type"::"Blanket Order":
                            ResponsibilityCenter2.TestField("Sales Blanket Order Nos.");
                        "Document Type"::Order:
                            ResponsibilityCenter2.TestField("Sales Order Nos.");
                        "Document Type"::"Return Order":
                            ResponsibilityCenter2.TestField("Sales Return Order Nos.");
                        "Document Type"::Invoice:
                            ResponsibilityCenter2.TestField("Sales Invoice Nos.");
                        "Document Type"::"Posted Invoice":
                            ResponsibilityCenter2.TestField("Sales Posted Invoice Nos");
                        "Document Type"::"Credit Memo":
                            ResponsibilityCenter2.TestField("Sales Credit Memo Nos.");
                        "Document Type"::"Posted Credit Memo":
                            ResponsibilityCenter2.TestField("Sales Posted Credit Memo Nos.");
                        "Document Type"::"Posted Shipment":
                            ResponsibilityCenter2.TestField("Sales Posted Shipment Nos.");
                        "Document Type"::"Posted Return Receipt":
                            ResponsibilityCenter2.TestField("Sales Ptd. Return Receipt Nos.");
                        "Document Type"::"Posted Prepmt. Inv.":
                            ResponsibilityCenter2.TestField("Sales Posted Prepmt. Inv. Nos.");
                        "Document Type"::"Posted Prepmt. Cr. Memo":
                            ResponsibilityCenter2.TestField("Sales Ptd. Prept. Cr. M. Nos.");
                    end;
                "Document Profile"::Service:
                    case "Document Type" of
                        "Document Type"::Quote:
                            ResponsibilityCenter2.TestField("Service Quote Nos.");
                        "Document Type"::Order:
                            ResponsibilityCenter2.TestField("Service Order Nos.");
                        "Document Type"::Invoice:
                            ResponsibilityCenter2.TestField("Service Invoice Nos.");
                        "Document Type"::"Posted Invoice":
                            ResponsibilityCenter2.TestField("Posted Service Invoice Nos.");
                        "Document Type"::"Credit Memo":
                            ResponsibilityCenter2.TestField("Service Credit Memo Nos.");
                        "Document Type"::"Posted Credit Memo":
                            ResponsibilityCenter2.TestField("Posted Ser. Credit Memo Nos.");
                        "Document Type"::"Posted Shipment":
                            ResponsibilityCenter2.TestField("Posted Service Shipment Nos.");
                    end;
                "Document Profile"::Transfer:
                    case "Document Type" of
                        "Document Type"::Order:
                            ResponsibilityCenter2.TestField("Trans. Order Nos.");
                        "Document Type"::"Posted Receipt":
                            ResponsibilityCenter2.TestField("Posted Transfer Rcpt. Nos.");
                        "Document Type"::"Posted Shipment":
                            ResponsibilityCenter2.TestField("Posted Transfer Shpt. Nos.");
                        "Document Type"::Requisition:
                            ResponsibilityCenter2.TestField("Transfer Requisition Nos.");
                    end;
            end;
    end;

    //     // procedure TestMemoNoseriesFromRespCenter("Document Profile": Option Purchase,sales,Transfer,Service; "Document Type": Option Quote,"Blanket Order",Order,"Return Order",Invoice,"Posted Invoice","Credit Memo","Posted Credit Memo","Posted Shipment","Posted Receipt","Posted Prepmt. Inv.","Posted Prepmt. Cr. Memo","Posted Return Receipt","Posted Return Shipment",Booking,"Posted Order","Posted Debit Note",Requisition,Services,"Posted Credit Note"; RespCenterCode: Code[10]; "Memo Type": Option " ","Insurance Memo","Custom Clearance Memo","Registration Memo","Debit Note")
    procedure TestMemoNoseriesFromRespCenter("Document Profile": Option Purchase,sales,Transfer,Service; "Document Type": Option Quote,"Blanket Order",Order,"Return Order",Invoice,"Posted Invoice","Credit Memo","Posted Credit Memo","Posted Shipment","Posted Receipt","Posted Prepmt. Inv.","Posted Prepmt. Cr. Memo","Posted Return Receipt","Posted Return Shipment",Booking,"Posted Order","Posted Debit Note",Requisition,Services,"Posted Credit Note"; RespCenterCode: Code[20]; "Memo Type": Option " ","Insurance Memo","Custom Clearance Memo","Registration Memo","Debit Note")
    var
        ResponsibilityCenter2: Record "Responsibility Center";
    begin
        if ResponsibilityCenter2.Get(RespCenterCode) then
            case "Document Profile" of
                "Document Profile"::Purchase:
                    case "Document Type" of
                        "Document Type"::"Blanket Order":
                            case "Memo Type" of
                                "Memo Type"::"Insurance Memo":
                                    ResponsibilityCenter2.TestField("Insurance Memo Nos.");
                            end;
                    end;
                "Document Profile"::Sales:
                    case "Document Type" of
                        "Document Type"::Invoice:
                            case "Memo Type" of
                                "Memo Type"::"Debit Note":
                                    ResponsibilityCenter2.TestField("Debit Note Nos.");
                            end;
                    end;
            end;
    end;

    //     // procedure GetRespCenterWiseNoSeries("Document Profile": Option Purchase,Sales,Transfer,Service; "Document Type": Option Quote,"Blanket Order","Order","Return Order",Invoice,"Posted Invoice","Credit Memo","Posted Credit Memo","Posted Shipment","Posted Receipt","Posted Prepmt. Inv.","Posted Prepmt. Cr. Memo","Posted Return Receipt","Posted Return Shipment",Booking,"Posted Order","Posted Debit Note",Requisition,Services,"Posted Credit Note"; RespCenterCode: Code[10]): Code[10]
    procedure GetRespCenterWiseNoSeries("Document Profile": Option Purchase,Sales,Transfer,Service; "Document Type": Option Quote,"Blanket Order","Order","Return Order",Invoice,"Posted Invoice","Credit Memo","Posted Credit Memo","Posted Shipment","Posted Receipt","Posted Prepmt. Inv.","Posted Prepmt. Cr. Memo","Posted Return Receipt","Posted Return Shipment",Booking,"Posted Order","Posted Debit Note",Requisition,Services,"Posted Credit Note"; RespCenterCode: Code[20]): Code[20]
    var
        ResponsibilityCenter: Record "Responsibility Center";
    begin
        if ResponsibilityCenter.Get(RespCenterCode) then
            case "Document Profile" of
                "Document Profile"::Purchase:
                    case "Document Type" of
                        "Document Type"::Quote:
                            exit(ResponsibilityCenter."Purch. Quote Nos.");
                        "Document Type"::"Blanket Order":
                            exit(ResponsibilityCenter."Purch. Blanket Order Nos.");
                        "Document Type"::"Order":
                            exit(ResponsibilityCenter."Purch. Order Nos.");
                        "Document Type"::"Return Order":
                            exit(ResponsibilityCenter."Purch. Return Order Nos.");
                        "Document Type"::Invoice:
                            exit(ResponsibilityCenter."Purch. Invoice Nos.");
                        "Document Type"::"Posted Invoice":
                            exit(ResponsibilityCenter."Purch. Posted Invoice Nos.");
                        "Document Type"::"Credit Memo":
                            exit(ResponsibilityCenter."Purch. Credit Memo Nos.");
                        "Document Type"::"Posted Credit Memo":
                            exit(ResponsibilityCenter."Purch. Posted Credit Memo Nos.");
                        "Document Type"::"Posted Receipt":
                            exit(ResponsibilityCenter."Purch. Posted Receipt Nos.");
                        "Document Type"::"Posted Return Shipment":
                            exit(ResponsibilityCenter."Purch. Ptd. Return Shpt. Nos.");
                        "Document Type"::"Posted Prepmt. Inv.":
                            exit(ResponsibilityCenter."Purch. Posted Prept. Inv. Nos.");
                        "Document Type"::"Posted Prepmt. Cr. Memo":
                            exit(ResponsibilityCenter."Purch. Ptd. Prept. Cr. M. Nos.");
                    end;
                "Document Profile"::Sales:
                    case "Document Type" of
                        "Document Type"::Quote:
                            exit(ResponsibilityCenter."Sale Quote Nos.");
                        "Document Type"::"Blanket Order":
                            exit(ResponsibilityCenter."Sales Blanket Order Nos.");
                        "Document Type"::"Order":
                            exit(ResponsibilityCenter."Sales Order Nos.");
                        "Document Type"::"Return Order":
                            exit(ResponsibilityCenter."Sales Return Order Nos.");
                        "Document Type"::Invoice:
                            exit(ResponsibilityCenter."Sales Invoice Nos.");
                        "Document Type"::"Posted Invoice":
                            exit(ResponsibilityCenter."Sales Posted Invoice Nos");
                        "Document Type"::"Credit Memo":
                            exit(ResponsibilityCenter."Sales Credit Memo Nos.");
                        "Document Type"::"Posted Credit Memo":
                            exit(ResponsibilityCenter."Sales Posted Credit Memo Nos.");
                        "Document Type"::"Posted Shipment":
                            exit(ResponsibilityCenter."Sales Posted Shipment Nos.");
                        "Document Type"::"Posted Return Receipt":
                            exit(ResponsibilityCenter."Sales Ptd. Return Receipt Nos.");
                        "Document Type"::"Posted Prepmt. Inv.":
                            exit(ResponsibilityCenter."Sales Posted Prepmt. Inv. Nos.");
                        "Document Type"::"Posted Prepmt. Cr. Memo":
                            exit(ResponsibilityCenter."Sales Ptd. Prept. Cr. M. Nos.");
                    end;
                "Document Profile"::Service:
                    case "Document Type" of
                        "Document Type"::Quote:
                            exit(ResponsibilityCenter."Service Quote Nos.");
                        "Document Type"::Order:
                            exit(ResponsibilityCenter."Service Order Nos.");
                        "Document Type"::Invoice:
                            exit(ResponsibilityCenter."Service Invoice Nos.");
                        "Document Type"::"Posted Invoice":
                            exit(ResponsibilityCenter."Posted Service Invoice Nos.");
                        "Document Type"::"Credit Memo":
                            exit(ResponsibilityCenter."Service Credit Memo Nos.");
                        "Document Type"::"Posted Credit Memo":
                            exit(ResponsibilityCenter."Posted Ser. Credit Memo Nos.");
                        "Document Type"::"Posted Shipment":
                            exit(ResponsibilityCenter."Posted Service Shipment Nos.");
                    end;
                "Document Profile"::Transfer:
                    case "Document Type" of
                        "Document Type"::Order:
                            exit(ResponsibilityCenter."Trans. Order Nos.");
                        "Document Type"::"Posted Receipt":
                            exit(ResponsibilityCenter."Posted Transfer Rcpt. Nos.");
                        "Document Type"::"Posted Shipment":
                            exit(ResponsibilityCenter."Posted Transfer Shpt. Nos.");
                        "Document Type"::Requisition:
                            exit(ResponsibilityCenter."Transfer Requisition Nos.");
                    end;
            end;
    end;

    //     //    procedure GetRespCenterWiseNoSeriesMemo("Document Profile": Option Purchase,sales,Transfer,Service; "Document Type": Option Quote,"Blanket Order",Order,"Return Order",Invoice,"Posted Invoice","Credit Memo","Posted Credit Memo","Posted Shipment","Posted Receipt","Posted Prepmt. Inv.","Posted Prepmt. Cr. Memo","Posted Return Receipt","Posted Return Shipment",Booking,"Posted Order","Posted Debit Note",Requisition,Services,"Posted Credit Note"; RespCenterCode: Code[10]; "Memo Type": Option " ","Insurance Memo","Custom Clearance Memo","Registration Memo","Debit Note"): Code[10]
    //     procedure GetRespCenterWiseNoSeriesMemo("Document Profile": Option Purchase,sales,Transfer,Service; "Document Type": Option Quote,"Blanket Order",Order,"Return Order",Invoice,"Posted Invoice","Credit Memo","Posted Credit Memo","Posted Shipment","Posted Receipt","Posted Prepmt. Inv.","Posted Prepmt. Cr. Memo","Posted Return Receipt","Posted Return Shipment",Booking,"Posted Order","Posted Debit Note",Requisition,Services,"Posted Credit Note"; RespCenterCode: Code[20]; "Memo Type": Option " ","Insurance Memo","Custom Clearance Memo","Registration Memo","Debit Note"): Code[20]
    //     begin
    //         if ResponsibilityCenter.Get(RespCenterCode) then
    //             case "Document Profile" of
    //                 "Document Profile"::Purchase:
    //                     case "Document Type" of
    //                         "Document Type"::"Blanket Order":
    //                             case "Memo Type" of
    //                                 "Memo Type"::"Insurance Memo":
    //                                     exit(ResponsibilityCenter."Insurance Memo Nos.");
    //                                 "Memo Type"::"Registration Memo":
    //                                     exit(ResponsibilityCenter."Registration Memo Nos.");
    //                                 "Memo Type"::" ":
    //                                     exit(ResponsibilityCenter."Purch. Blanket Order Nos.");
    //                             end;
    //                     end;
    //                 "Document Profile"::Sales:
    //                     case "Document Type" of
    //                         "Document Type"::Invoice:
    //                             case "Memo Type" of
    //                                 "Memo Type"::"Debit Note":
    //                                     exit(ResponsibilityCenter."Debit Note Nos.");
    //                             end;
    //                     end;
    //             end;
    //     end;

    //     procedure GetPurchasesFilter(): Code[10]
    //     begin
    //         exit(GetPurchasesFilter2(CopyStr(UserId, 1, 50)));
    //     end;

    //     procedure GetSalesFilter(): Code[10]
    //     begin
    //         exit(GetSalesFilter2(CopyStr(UserId, 1, 50)));
    //     end;

    //     procedure GetServicesFilter(): Code[10]
    //     begin
    //         exit(GetServicesFilter2(CopyStr(UserId, 1, 50)));

    //     end;

    //     procedure GetPurchasesFilter2(UserCode: Code[50]): Code[10]
    //     var
    //         PurchUserRespCenter: Code[10];
    //     begin
    //         if not HasGotPurchUserSetup then begin
    //             CompanyInformationGbl.Get();

    //             PurchUserRespCenter := CompanyInformationGbl."Responsibility Center";
    //             UserLocation := CompanyInformationGbl."Location Code";

    //             if UserCode <> '' then
    //                 if UserSetup.Get(UserCode) then
    //                     if UserSetup."Purchase Resp. Ctr. Filter" <> '' then
    //                         PurchUserRespCenter := UserSetup."Purchase Resp. Ctr. Filter";

    //             HasGotPurchUserSetup := true;
    //         end;

    //         exit(PurchUserRespCenter);
    //     end;

    //     procedure GetSalesFilter2(Usercode: Code[50]): Code[10]
    //     var
    //         SalesUserRespCenter: Code[10];
    //     begin
    //         if not HasGotSalesUserSetup then begin
    //             CompanyInformationGbl.Get();

    //             SalesUserRespCenter := CompanyInformationGbl."Responsibility Center";
    //             UserLocation := CompanyInformationGbl."Location Code";
    //             if UserCode <> '' then
    //                 if UserSetup.Get(UserCode) then
    //                     if UserSetup."Sales Resp. Ctr. Filter" <> '' then
    //                         SalesUserRespCenter := UserSetup."Sales Resp. Ctr. Filter";

    //             HasGotSalesUserSetup := true;
    //         end;

    //         exit(SalesUserRespCenter);
    //     end;

    //     procedure GetServicesFilter2(Usercode: Code[50]): Code[10]
    //     var
    //         ServUserRespCenter: Code[10];
    //     begin
    //         if not HasGotServUserSetup then begin
    //             CompanyInformationGbl.Get();
    //             ServUserRespCenter := CompanyInformationGbl."Responsibility Center";
    //             UserLocation := CompanyInformationGbl."Location Code";
    //             if UserCode <> '' then
    //                 if UserSetup.Get(UserCode) then
    //                     if UserSetup."Service Resp. Ctr. Filter" <> '' then
    //                         ServUserRespCenter := UserSetup."Service Resp. Ctr. Filter";

    //             HasGotServUserSetup := true;
    //         end;

    //         exit(ServUserRespCenter);
    //     end;

    //     procedure UpdateGlobalDimFromDimSetID2(var SalesLineRec: Record "Sales Line"; DimSetID: Integer; var GlobalDimVal1: Code[20]; var GlobalDimVal2: Code[20]; var GlobalDimVal3: Code[20]; var GlobalDimVal4: Code[20]; var GlobalDimVal5: Code[20]; var GlobalDimVal6: Code[20]; var GlobalDimVal7: Code[20]; var GlobalDimVal8: Code[20])
    //     var
    //         DimensionSetEntry: Record "Dimension Set Entry";
    //     begin
    //         GetGLSetup();

    //         GlobalDimVal1 := '';
    //         GlobalDimVal2 := '';
    //         GlobalDimVal3 := '';
    //         GlobalDimVal4 := '';
    //         GlobalDimVal5 := '';
    //         GlobalDimVal6 := '';
    //         GlobalDimVal7 := '';
    //         GlobalDimVal8 := '';

    //         if GLSetupShortcutDimCode[1] <> '' then
    //             if DimensionSetEntry.Get(DimSetID, GLSetupShortcutDimCode[1]) then
    //                 GlobalDimVal1 := DimensionSetEntry."Dimension Value Code";

    //         if GLSetupShortcutDimCode[2] <> '' then
    //             if DimensionSetEntry.Get(DimSetID, GLSetupShortcutDimCode[2]) then
    //                 GlobalDimVal2 := DimensionSetEntry."Dimension Value Code";

    //         if GLSetupShortcutDimCode[3] <> '' then
    //             if DimensionSetEntry.Get(DimSetID, GLSetupShortcutDimCode[3]) then
    //                 GlobalDimVal3 := DimensionSetEntry."Dimension Value Code";

    //         if GLSetupShortcutDimCode[4] <> '' then
    //             if DimensionSetEntry.Get(DimSetID, GLSetupShortcutDimCode[4]) then
    //                 GlobalDimVal4 := DimensionSetEntry."Dimension Value Code";

    //         if GLSetupShortcutDimCode[5] <> '' then
    //             if DimensionSetEntry.Get(DimSetID, GLSetupShortcutDimCode[5]) then
    //                 GlobalDimVal5 := DimensionSetEntry."Dimension Value Code";
    //         if GLSetupShortcutDimCode[6] <> '' then
    //             if DimensionSetEntry.Get(DimSetID, GLSetupShortcutDimCode[6]) then
    //                 GlobalDimVal6 := DimensionSetEntry."Dimension Value Code";

    //         if GLSetupShortcutDimCode[7] <> '' then
    //             if DimensionSetEntry.Get(DimSetID, GLSetupShortcutDimCode[7]) then
    //                 GlobalDimVal7 := DimensionSetEntry."Dimension Value Code";

    //         if GLSetupShortcutDimCode[8] <> '' then
    //             if DimensionSetEntry.Get(DimSetID, GLSetupShortcutDimCode[8]) then
    //                 GlobalDimVal8 := DimensionSetEntry."Dimension Value Code";
    //     end;

    //     procedure GetGLSetup()
    //     var
    //         GeneralLedgerSetup: Record "General Ledger Setup";
    //     begin
    //         if not HasGotGLSetup then begin
    //             GeneralLedgerSetup.Get();

    //             GLSetupShortcutDimCode[1] := GeneralLedgerSetup."Shortcut Dimension 1 Code";
    //             GLSetupShortcutDimCode[2] := GeneralLedgerSetup."Shortcut Dimension 2 Code";
    //             GLSetupShortcutDimCode[3] := GeneralLedgerSetup."Shortcut Dimension 3 Code";
    //             GLSetupShortcutDimCode[4] := GeneralLedgerSetup."Shortcut Dimension 4 Code";
    //             GLSetupShortcutDimCode[5] := GeneralLedgerSetup."Shortcut Dimension 5 Code";
    //             GLSetupShortcutDimCode[6] := GeneralLedgerSetup."Shortcut Dimension 6 Code";
    //             GLSetupShortcutDimCode[7] := GeneralLedgerSetup."Shortcut Dimension 7 Code";
    //             GLSetupShortcutDimCode[8] := GeneralLedgerSetup."Shortcut Dimension 8 Code";
    //             HasGotGLSetup := true;
    //         end;
    //     end;

    //     procedure SendToIRD(SalesHeader: Record "Sales Header")
    //     begin
    //     end;

    //     procedure CreateGatePass(SalesInvHdrNo: Code[20])
    //     begin
    //     end;

    //     procedure getCompanyOnelineAddr(ParmCompanyInformation: Record "Company Information"): Text
    //     var
    //         CompOneLineAddr: Text;
    //     begin
    //         CompOneLineAddr := '';

    //         ParmCompanyInformation.Get();
    //         CompOneLineAddr := ParmCompanyInformation.Address + ParmCompanyInformation."Address 2";
    //         if ParmCompanyInformation.County <> '' then
    //             if CompOneLineAddr <> '' then
    //                 CompOneLineAddr += ', ' + ParmCompanyInformation.County;

    //         exit(CompOneLineAddr);
    //     end;

    //     procedure getCompanyOnelineCommunicationAddr(ParmCompanyInformation: Record "Company Information"): Text
    //     var
    //         CommunicationAdd: Text;
    //     begin
    //         CommunicationAdd := '';

    //         ParmCompanyInformation.Get();
    //         if ParmCompanyInformation."Phone No." <> '' then
    //             CommunicationAdd := 'Phone : ' + ParmCompanyInformation."Phone No." + ParmCompanyInformation."Phone No. 2";

    //         if ParmCompanyInformation."E-Mail" <> '' then
    //             if CommunicationAdd <> '' then
    //                 CommunicationAdd += ', Email : ' + ParmCompanyInformation."E-Mail";

    //         exit(CommunicationAdd);
    //     end;

    //     procedure CheckDimensionBeforeApproval(ParmGenJournalLine: Record "Gen. Journal Line")
    //     var
    //         VendorPostingGroup: Record "Vendor Posting Group";
    //         BankAccountPostingGroup: Record "Bank Account Posting Group";
    //         EmployeePostingGroup: Record "Employee Posting Group";
    //         BankAccount: Record "Bank Account";
    //         DimensionManagement: Codeunit DimensionManagement;
    //         TableID: array[10] of Integer;
    //         AccNo: array[10] of Code[20];
    //     begin
    //         if (ParmGenJournalLine."Account Type" in [
    //             ParmGenJournalLine."Account Type"::Vendor, ParmGenJournalLine."Account Type"::"Bank Account",
    //             ParmGenJournalLine."Account Type"::"G/L Account"]) then begin
    //             TableID[1] := DimensionManagement.TypeToTableID1(ParmGenJournalLine."Account Type".AsInteger());
    //             AccNo[1] := ParmGenJournalLine."Account No.";
    //             if not DimensionManagement.CheckDimValuePosting(TableID, AccNo, ParmGenJournalLine."Dimension Set ID") then
    //                 Error(DimensionManagement.GetDimValuePostingErr());

    //             case ParmGenJournalLine."Account Type" of
    //                 ParmGenJournalLine."Account Type"::"Bank Account":
    //                     begin
    //                         BankAccount.Get(ParmGenJournalLine."Account No.");
    //                         BankAccountPostingGroup.Get(BankAccount."Bank Acc. Posting Group");
    //                         TableID[1] := DimensionManagement.TypeToTableID1(ParmGenJournalLine."Account Type"::"G/L Account".AsInteger());
    //                         AccNo[1] := BankAccountPostingGroup."G/L Account No.";
    //                         if not DimensionManagement.CheckDimValuePosting(TableID, AccNo, ParmGenJournalLine."Dimension Set ID") then
    //                             Error(DimensionManagement.GetDimValuePostingErr());
    //                     end;
    //                 ParmGenJournalLine."Account Type"::Vendor:
    //                     begin
    //                         VendorPostingGroup.Get(ParmGenJournalLine."Posting Group");
    //                         TableID[1] := DimensionManagement.TypeToTableID1(ParmGenJournalLine."Account Type"::"G/L Account".AsInteger());
    //                         AccNo[1] := VendorPostingGroup."Payables Account";
    //                         if not DimensionManagement.CheckDimValuePosting(TableID, AccNo, ParmGenJournalLine."Dimension Set ID") then
    //                             Error(DimensionManagement.GetDimValuePostingErr());
    //                     end;
    //                 ParmGenJournalLine."Account Type"::Employee:
    //                     begin
    //                         EmployeePostingGroup.Get(ParmGenJournalLine."Posting Group");
    //                         TableID[1] := DimensionManagement.TypeToTableID1(ParmGenJournalLine."Account Type"::Employee.AsInteger());
    //                         AccNo[1] := EmployeePostingGroup."Payables Account";
    //                         if not DimensionManagement.CheckDimValuePosting(TableID, AccNo, ParmGenJournalLine."Dimension Set ID") then
    //                             Error(DimensionManagement.GetDimValuePostingErr());
    //                     end;
    //             end;
    //         end;
    //     end;

    //     procedure CheckBalanceBeforeSendingApproval(var ParmGenJournalLine: Record "Gen. Journal Line")
    //     var
    //         DebitGenJournalLine: Record "Gen. Journal Line";
    //         CreditGenJournalLine: Record "Gen. Journal Line";
    //         Text012Lbl: Label '%5 %2 is out of balance by %1. Please check that %3, %4, %5 and %6 are correct for each line.', Comment = '%5 %2 is out of balance by %1. Please check that %3, %4, %5 and %6 are correct for each line.';
    //     begin
    //         if ParmGenJournalLine."Bal. Account No." <> '' then
    //             exit;

    //         DebitGenJournalLine.Reset();
    //         DebitGenJournalLine.SetRange("Journal Template Name", ParmGenJournalLine."Journal Template Name");
    //         DebitGenJournalLine.SetRange("Journal Batch Name", ParmGenJournalLine."Journal Batch Name");
    //         DebitGenJournalLine.SetRange("Document No.", ParmGenJournalLine."Document No.");
    //         if DebitGenJournalLine.FindFirst() then
    //             DebitGenJournalLine.CalcSums("Debit Amount");

    //         CreditGenJournalLine.Reset();
    //         CreditGenJournalLine.SetRange("Journal Template Name", ParmGenJournalLine."Journal Template Name");
    //         CreditGenJournalLine.SetRange("Journal Batch Name", ParmGenJournalLine."Journal Batch Name");
    //         CreditGenJournalLine.SetRange("Document No.", ParmGenJournalLine."Document No.");
    //         if CreditGenJournalLine.FindFirst() then
    //             CreditGenJournalLine.CalcSums("Credit Amount");

    //         if DebitGenJournalLine."Debit Amount" <> CreditGenJournalLine."Credit Amount" then
    //             Error(
    //                   Text012Lbl,
    //                   (DebitGenJournalLine."Debit Amount" - CreditGenJournalLine."Credit Amount"),
    //                   ParmGenJournalLine."Document No.",
    //                   ParmGenJournalLine.FieldCaption("Posting Date"),
    //                   ParmGenJournalLine.FieldCaption("Document Type"),
    //                   ParmGenJournalLine.FieldCaption("Document No."),
    //                   ParmGenJournalLine.FieldCaption(Amount));
    //     end;

    //     procedure SendApprovalMail(RecID: RecordID; GenJournalLine4: Record "Gen. Journal Line")
    //     var
    //         ApprovalUserSetup: Record "User Setup";
    //         ApprovalEntry: Record "Approval Entry";
    //         GenJournalTemplate: Record "Gen. Journal Template";
    //         EmailMessage: Codeunit "Email Message";
    //         Email: Codeunit Email;
    //         RecordRefLoc: RecordRef;
    //         mailID: Text;
    //         EmailSubjet: Text;
    //         EmailTextBody: Text;
    //         body: Text;
    //         Header: Text;
    //         footer: Text;
    //         body1: Text;
    //         body2: Text;
    //         body3: Text;
    //         body4: Text;
    //         url: Text;
    //         url2: Text;
    //     begin
    //         if not RecordRefLoc.Get(RecID) then
    //             exit;

    //         case RecordRefLoc.Number of
    //             Database::"Gen. Journal Line":
    //                 begin
    //                     Clear(RecordRefLoc);
    //                     Clear(EmailMessage);
    //                     Clear(Email);
    //                     Clear(EmailSubjet);
    //                     Clear(EmailTextBody);
    //                     Clear(mailID);

    //                     ApprovalEntry.Reset();
    //                     ApprovalEntry.SetRange("Journal Template Name", GenJournalLine4."Journal Template Name");
    //                     ApprovalEntry.SetRange("Journal Batch Name", GenJournalLine4."Journal Batch Name");
    //                     ApprovalEntry.SetRange("Document No.", GenJournalLine4."Document No.");
    //                     ApprovalEntry.SetRange("Sequence No.", 1);
    //                     if ApprovalEntry.FindFirst() then begin
    //                         ApprovalUserSetup.Reset();
    //                         ApprovalUserSetup.Get(ApprovalEntry."Approver ID");
    //                         mailID := ApprovalUserSetup."E-Mail";
    //                         EmailSubjet := 'Journal Request';
    //                         Header := 'Dear Sir/madam,<br> ' + '<br>';
    //                         body := 'Please approve following voucher. <br>';

    //                         GenJournalTemplate.Get(GenJournalLine4."Journal Template Name");

    //                         case GenJournalTemplate.Type of
    //                             GenJournalTemplate.Type::General:
    //                                 url := GetUrlLink(Page::"General Journal", true);
    //                             GenJournalTemplate.Type::Payments:
    //                                 url := GetUrlLink(Page::"Payment Journal", true);
    //                             GenJournalTemplate.Type::"Cash Receipts":
    //                                 url := GetUrlLink(Page::"Cash Receipt Journal", true);
    //                         end;

    //                         body1 := StrSubstNo(MailBody1Txt, GenJournalLine4."Journal Template Name");
    //                         body2 := StrSubstNo(MailBody2Txt, ApprovalEntry."Document No.");
    //                         body3 := StrSubstNo(MailBody3Txt, GenJournalLine4."Posting Date");
    //                         body4 := StrSubstNo(MailBody4Txt, voucherAmt(GenJournalLine4."Journal Template Name", GenJournalLine4."Journal Batch Name", ApprovalEntry."Document No."));
    //                         footer := StrSubstNo(MailBody5Txt, UserId);

    //                         url2 := '<a target="_blank" href=' + '"' + url + '"' + '>' + 'Approval Page' + '</a>';

    //                         EmailTextBody := Header + '<br>' + body + '<br>' + body1 + body2 + body3 + body4 + '<br>' + '<br>' + footer
    //                             + '<br>' + '<br>' + '<br>' + url2;
    //                         EmailMessage.Create(mailID, EmailSubjet, EmailTextBody, true);
    //                         Email.Send(EmailMessage);

    //                     end;
    //                 end
    //         end;
    //     end;

    //     procedure GetUrlLink(PageID: Integer; ToApprove: Boolean): Text
    //     var
    //         SettingsURL: Text;
    //     begin
    //         if SettingsURL <> '' then
    //             exit;

    //         if ToApprove = false then
    //             SettingsURL := GetUrl(ClientType::Web, CompanyName, ObjectType::Page, PageID)
    //         else
    //             SettingsURL := GetUrl(ClientType::Web, CompanyName, ObjectType::Page, Page::"Requests to Approve");

    //         exit(SettingsURL);
    //     end;

    procedure SendPurchRequisitionLinetoItemJnl(ParmPurchaseHeader: Record "Purchase Header")
    var
        PurchaseLine: Record "Purchase Line";
        ItemJournalBatch: Record "Item Journal Batch";
        ItemJournalTemplate: Record "Item Journal Template";
        ItemJournalLine: Record "Item Journal Line";
        ItemJournalLine2: Record "Item Journal Line";
        UserSetup2: Record "User Setup";
        FACustodianNep: Record "Fa Custodian NEP";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ArchiveManagement: Codeunit ArchiveManagement;
        LineNo: Integer;
        DocNo: Code[20];
        SourceCode: Code[20];
        LineInserted: Boolean;
        PostingNoSeriesLoc: Code[20];
    begin
        Clear(LineInserted);
        UserSetup2.Get(UserId);
        UserSetup2.TestField("Default Item Jnl Template");
        UserSetup2.TestField("Default Item Jnl Batch");

        ItemJournalLine.Reset();
        ItemJournalLine.SetRange("Journal Template Name", UserSetup2."Default Item Jnl Template");
        ItemJournalLine.SetRange("Journal Batch Name", UserSetup2."Default Item Jnl Batch");
        if ItemJournalLine.FindLast() then
            LineNo := ItemJournalLine."Line No." + 10000
        else
            LineNo := 10000;

        ItemJournalBatch.Reset();
        ItemJournalBatch.SetRange("Journal Template Name", UserSetup2."Default Item Jnl Template");
        ItemJournalBatch.SetRange(Name, UserSetup2."Default Item Jnl Batch");
        if ItemJournalBatch.FindFirst() then begin
            PostingNoSeriesLoc := ItemJournalBatch."Posting No. Series";
            if ItemJournalBatch."No. Series" <> '' then begin
                Clear(NoSeriesManagement);
                DocNo := NoSeriesManagement.GetNextNo(ItemJournalBatch."No. Series", Today, false);
            end;
        end;

        ItemJournalTemplate.Reset();
        ItemJournalTemplate.SetRange(Name, UserSetup2."Default Item Jnl Template");
        if ItemJournalTemplate.FindFirst() then
            SourceCode := ItemJournalTemplate."Source Code";

        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document No.", ParmPurchaseHeader."No.");
        PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
        PurchaseLine.SetFilter("No.", '<>%1', '');
        PurchaseLine.SetFilter(Quantity, '<>%1', 0);
        if PurchaseLine.FindSet() then
            repeat
                ItemJournalLine2.Reset();
                ItemJournalLine2.Init();
                ItemJournalLine2.Validate("Journal Template Name", UserSetup2."Default Item Jnl Template");
                ItemJournalLine2.Validate("Journal Batch Name", UserSetup2."Default Item Jnl Batch");
                ItemJournalLine2.Validate("Document No.", DocNo);
                ItemJournalLine2.Validate("Line No.", LineNo);
                ItemJournalLine2.Insert(true);

                ItemJournalLine2.Validate("Entry Type", ItemJournalLine2."Entry Type"::"Negative Adjmt.");
                ItemJournalLine2.Validate("Item No.", PurchaseLine."No.");
                ItemJournalLine2.Validate("Posting Date", Today);
                ItemJournalLine2.Validate("Document Date", Today);
                ItemJournalLine2.Validate("Source Code", SourceCode);
                ItemJournalLine2.Validate(Quantity, PurchaseLine.Quantity);
                ItemJournalLine2.Validate("Quantity (Base)", PurchaseLine."Quantity (Base)");
                ItemJournalLine2.Validate("Location Code", PurchaseLine."Location Code");
                ItemJournalLine2.Validate("Unit Cost", PurchaseLine."Direct Unit Cost");
                ItemJournalLine2.Validate("Shortcut Dimension 1 Code", PurchaseLine."Shortcut Dimension 1 Code");
                ItemJournalLine2.Validate("Shortcut Dimension 2 Code", PurchaseLine."Shortcut Dimension 2 Code");
                ItemJournalLine2.Validate("Dimension Set ID", PurchaseLine."Dimension Set ID");
                ItemJournalLine2.Validate("Demanded By", ParmPurchaseHeader."Demanded By");
                ItemJournalLine2.Validate("Demanded Date", ParmPurchaseHeader."Demanded Date");
                ItemJournalLine2.Validate("Requisition No.", ParmPurchaseHeader."No.");
                ItemJournalLine2.Modify(true);

                LineNo += 10000;
                LineInserted := true;
            until PurchaseLine.Next() = 0;

        if LineInserted then begin
            Commit();
            Page.Run(Page::"Item Journal", ItemJournalLine2);
        end;

        //Fixed Asset
        PurchaseLine.SetRange(Type, PurchaseLine.Type::"Fixed Asset");
        if PurchaseLine.FindSet() then
            repeat
                if not FACustodianNep.Get(PurchaseLine."No.", ParmPurchaseHeader."Demanded By") then begin
                    FACustodianNep.Init();
                    FACustodianNep.Validate("FA No.", PurchaseLine."No.");
                    FACustodianNep.Validate("Date of Ownership", Today);
                    FACustodianNep.Validate("employee no.", ParmPurchaseHeader."Demanded By");
                    FACustodianNep.Insert(true);

                    LineInserted := true;
                    Commit();
                end;

                Page.Run(Page::"FA Custodian Card NEP", FACustodianNep);
            until PurchaseLine.Next() = 0;

        if LineInserted then begin
            Clear(ArchiveManagement);
            ArchiveManagement.StorePurchDocument(ParmPurchaseHeader, false);
            ParmPurchaseHeader.Delete(true);
        end;
    end;

    //     procedure getTermsandConditions(docNo: Code[20]; TermType: Enum "Terms and Cond. Type NEP"; DocumentType: Enum "Purchase Document Type"; IsRequisition: Boolean)
    //     var
    //         TermsAndCondMasterNep: Record "Terms and Cond. Master NEP";
    //         TermsAndCondEntryNep: Record "Terms and Cond. Entry NEP";
    //         LineNo: Integer;
    //         SNo: Integer;
    //     begin
    //         TermsAndCondEntryNep.Reset();
    //         TermsAndCondEntryNep.SetRange("Term Type", TermType);
    //         TermsAndCondEntryNep.SetRange("Document No.", docNo);
    //         if not TermsAndCondEntryNep.FindLast() then begin
    //             LineNo := 10000;
    //             SNo := 1;
    //         end else begin
    //             LineNo := TermsAndCondEntryNep."Line No." + 10000;
    //             SNo := TermsAndCondEntryNep."SNo." + 1;
    //         end;

    //         TermsAndCondEntryNep.Reset();
    //         TermsAndCondEntryNep.SetRange("Document No.", docNo);
    //         if not TermsAndCondEntryNep.FindFirst() then begin
    //             TermsAndCondMasterNep.Reset();
    //             TermsAndCondMasterNep.SetRange("Term Type", TermType);
    //             if (DocumentType = DocumentType::Quote) and IsRequisition then
    //                 TermsAndCondMasterNep.SetRange(Requisition, true)
    //             else
    //                 if DocumentType = DocumentType::Order then
    //                     TermsAndCondMasterNep.SetRange(Order, true)
    //                 else
    //                     if DocumentType = DocumentType::Invoice then
    //                         TermsAndCondMasterNep.SetRange(Invoice, true)
    //                     else
    //                         TermsAndCondMasterNep.SetRange(Quote, true);

    //             if TermsAndCondMasterNep.FindSet() then
    //                 repeat
    //                     TermsAndCondEntryNep.Init();
    //                     TermsAndCondEntryNep.Validate("Document No.", docNo);
    //                     TermsAndCondEntryNep.Validate("Term Type", TermType);
    //                     TermsAndCondEntryNep.Validate(Description, TermsAndCondMasterNep.Description);
    //                     TermsAndCondEntryNep.Validate("Line No.", LineNo);
    //                     TermsAndCondEntryNep.Validate("SNo.", SNo);
    //                     TermsAndCondEntryNep.Insert();
    //                     LineNo += 10000;
    //                 until TermsAndCondMasterNep.Next() = 0;
    //         end;
    //     end;

    procedure MakeQuatation(PurchaseHeader: Record "Purchase Header")
    var
        PurchaseHeaderQuaotation: Record "Purchase Header";
        PurchaseLineQuotation: Record "Purchase Line";
        PurchaseLineQuotation2: Record "Purchase Line";
        ArchiveManagement: Codeunit ArchiveManagement;
        LineInserted: Boolean;
        LineNo: Integer;
    begin
        LineNo := 0;
        PurchaseHeaderQuaotation.Reset();
        PurchaseHeaderQuaotation.SetRange("Requisition No.", PurchaseHeader."No.");
        if not PurchaseHeaderQuaotation.FindFirst() then begin
            PurchaseHeaderQuaotation.Init();
            PurchaseHeaderQuaotation."Document Type" := PurchaseHeaderQuaotation."Document Type"::Quote;
            PurchaseHeaderQuaotation."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
            PurchaseHeaderQuaotation.Validate("Demanded By", PurchaseHeader."Demanded By");
            PurchaseHeaderQuaotation.Validate("Demanded Date", PurchaseHeader."Demanded Date");
            PurchaseHeaderQuaotation."Shortcut Dimension 1 Code" := PurchaseHeader."Shortcut Dimension 1 Code";
            PurchaseHeaderQuaotation."Shortcut Dimension 2 Code" := PurchaseHeader."Shortcut Dimension 2 Code";
            PurchaseHeaderQuaotation."Requisition No." := PurchaseHeader."No.";
            PurchaseHeaderQuaotation.Insert(true);

            PurchaseLineQuotation.Reset();
            PurchaseLineQuotation.SetRange("Document No.", PurchaseHeader."No.");
            if PurchaseLineQuotation.FindSet() then
                repeat
                    LineNo += 10000;

                    PurchaseLineQuotation2.Init();
                    PurchaseLineQuotation2.Validate("Document Type", PurchaseLineQuotation2."Document Type"::Quote);
                    PurchaseLineQuotation2."Document No." := PurchaseHeaderQuaotation."No.";
                    PurchaseLineQuotation2."Line No." := LineNo;
                    PurchaseLineQuotation2.Type := PurchaseLineQuotation.Type;
                    PurchaseLineQuotation2."No." := PurchaseLineQuotation."No.";
                    PurchaseLineQuotation2.Quantity := PurchaseLineQuotation.Quantity;
                    PurchaseLineQuotation2."Unit Cost (LCY)" := PurchaseLineQuotation."Unit Cost (LCY)";
                    PurchaseLineQuotation2."Unit of Measure" := PurchaseLineQuotation."Unit of Measure";
                    PurchaseLineQuotation2.Insert();

                    LineInserted := true;
                until PurchaseLineQuotation.Next() = 0;

            if LineInserted then begin
                Clear(ArchiveManagement);
                ArchiveManagement.StorePurchDocument(PurchaseHeader, false);
                PurchaseHeader.Delete(true);
                Message('Purchase requisition has been converted to Quotation.');
            end;
        end;
    end;

    //     procedure BankBalance() TotalBankBalance: Decimal
    //     var
    //         BankAccount: Record "Bank Account";
    //     begin
    //         TotalBankBalance := 0;

    //         BankAccount.Reset();
    //         BankAccount.SetFilter("Balance (LCY)", '<>%1', 0);
    //         if BankAccount.FindFirst() then
    //             repeat
    //                 BankAccount.CalcFields("Balance at Date (LCY)");
    //                 TotalBankBalance += BankAccount."Balance at Date (LCY)";
    //             until BankAccount.Next() = 0;

    //         exit(TotalBankBalance);
    //     end;

    //     procedure DrillDownBankBalance()
    //     var
    //         BankAccount: Record "Bank Account";
    //     begin
    //         BankAccount.Reset();
    //         BankAccount.SetFilter("Balance (LCY)", '<>%1', 0);
    //         Page.Run(371, BankAccount);
    //     end;

    //     procedure VendorBalance() TotalVendorBalance: Decimal
    //     var
    //         Vendor: Record Vendor;
    //     begin
    //         TotalVendorBalance := 0;
    //         Vendor.Reset();
    //         Vendor.SetFilter("Balance (LCY)", '<>%1', 0);
    //         if Vendor.FindFirst() then
    //             repeat
    //                 Vendor.CalcFields("Balance (LCY)");
    //                 TotalVendorBalance += Vendor."Balance (LCY)";
    //             until Vendor.Next() = 0;

    //         exit(TotalVendorBalance);
    //     end;

    //     procedure DrillDownVendorBalance()
    //     var
    //         Vendor: Record Vendor;
    //     begin
    //         Vendor.Reset();
    //         Vendor.SetFilter("Balance (LCY)", '<>%1', 0);
    //         Page.Run(27, Vendor);
    //     end;

    //     procedure CashBalance() TotalCashBalance: Decimal
    //     var
    //         GeneralLedgerSetup: Record "General Ledger Setup";
    //         GLAccount: Record "G/L Account";
    //     begin
    //         TotalCashBalance := 0;

    //         GeneralLedgerSetup.Get();
    //         if GeneralLedgerSetup."Default Cash GL Acc. Filter" <> '' then begin
    //             GLAccount.Reset();
    //             GLAccount.SetFilter("No.", GeneralLedgerSetup."Default Cash GL Acc. Filter");
    //             if GLAccount.FindFirst() then
    //                 repeat
    //                     GLAccount.CalcFields("Balance at Date");
    //                     TotalCashBalance += GLAccount."Balance at Date";
    //                 until GLAccount.Next() = 0;

    //             exit(TotalCashBalance);
    //         end;

    //         exit(TotalCashBalance);
    //     end;

    //     procedure DrillDownCashBalance()
    //     var
    //         GeneralLedgerSetup: Record "General Ledger Setup";
    //         GLAccount: Record "G/L Account";
    //     begin
    //         GeneralLedgerSetup.Get();
    //         if GeneralLedgerSetup."Default Cash GL Acc. Filter" <> '' then begin
    //             GLAccount.Reset();
    //             GLAccount.SetFilter("No.", GeneralLedgerSetup."Default Cash GL Acc. Filter");
    //             Page.Run(16, GLAccount);
    //         end;
    //     end;

    //     procedure CalcBalance(var ParmPdcEntriesNep: Record "PDC Entries NEP"; LastPDCEntriesNep: Record "PDC Entries NEP"; var TotalBalance: Decimal)
    //     var
    //         PDCEntriesNep2: Record "PDC Entries NEP";
    //     begin
    //         PDCEntriesNep2.CopyFilters(ParmPdcEntriesNep);
    //         PDCEntriesNep2.CalcSums(Amount);
    //         TotalBalance := PDCEntriesNep2.Amount;
    //     end;


    //     procedure CheckBudget(ParmGenJournalLine: Record "Gen. Journal Line"; ParmGLAccount: Record "G/L Account"; IscalledFromJournal: Boolean)
    //     var
    //         GLAccount: Record "G/L Account";
    //         GLBudgetEntry: Record "G/L Budget Entry";
    //         GeneralLedgerSetup: Record "General Ledger Setup";
    //         PostingDate: Date;
    //         BudgetName: Code[20];
    //         AmountPassedToCheck: Decimal;
    //         Amount2: Decimal;
    //         GenAmount: Decimal;
    //     begin
    //         Clear(PostingDate); //need to revise

    //         GeneralLedgerSetup.Get();
    //         if PostingDate = 0D then
    //             exit;

    //         if ParmGenJournalLine."Account Type" = ParmGenJournalLine."Account Type"::"G/L Account" then begin
    //             GLAccount.Reset();
    //             GLAccount.SetFilter("No.", GeneralLedgerSetup."Default Budget GL Acc. Filter");
    //             GLAccount.SetFilter("Budget Filter", ParmGenJournalLine."Budget Name");
    //             GLAccount.SetRange("Global Dimension 1 Code", ParmGenJournalLine."Shortcut Dimension 1 Code");
    //             GLAccount.SetRange("Global Dimension 2 Code", ParmGenJournalLine."Shortcut Dimension 2 Code");
    //             GLAccount.CalcFields("Journal Amount", "Utilized Amount");
    //         end;

    //         if IscalledFromJournal = true then
    //             GenAmount := ParmGenJournalLine."VAT Base Amount (LCY)"
    //         else
    //             GenAmount := GLAccount."Journal Amount";

    //         BudgetName := GeneralLedgerSetup."Default G/L Budget Name";
    //         PostingDate := ParmGenJournalLine."Posting Date";
    //         AmountPassedToCheck := GenAmount + GLAccount."Utilized Amount";

    //         GLBudgetEntry.Reset();
    //         GLBudgetEntry.SetCurrentKey("Budget Name", "G/L Account No.", Date);
    //         GLBudgetEntry.SetRange("Budget Name", BudgetName);
    //         GLBudgetEntry.SetFilter("G/L Account No.", GeneralLedgerSetup."Default Budget GL Acc. Filter");
    //         GLBudgetEntry.SetRange("Global Dimension 1 Code", ParmGenJournalLine."Shortcut Dimension 1 Code");
    //         GLBudgetEntry.SetRange("Global Dimension 2 Code", ParmGenJournalLine."Shortcut Dimension 2 Code");
    //         IF GLBudgetEntry.FindFirst() THEN
    //             repeat

    //                 Amount2 := GLBudgetEntry.Amount;
    //             until GLBudgetEntry.Next() = 0;
    //         // GLBudgetEntry.CalcSums(Amount);
    //         // Amount2 := GLBudgetEntry.Amount;

    //         if AmountPassedToCheck > Amount2 then
    //             Error('%1 is more than allocated budget amount %2 for G/L Account No. %3', AmountPassedToCheck, Amount2, GeneralLedgerSetup."Default Budget GL Acc. Filter");
    //     end;

    procedure MarkDateOrder(NoSeriesCode: Code[20])
    var
        NoSeries: Record "No. Series";
    begin
        if NoSeriesCode = '' then
            exit;

        NoSeries.Get(NoSeriesCode);
        NoSeries."Date Order" := true;
        NoSeries.Modify();
    end;

    //     local procedure TotalDebit(docNo: code[20]; TDebit: Decimal)
    //     var
    //         GenJournalLine: Record "Gen. Journal Line";
    //     begin
    //         TDebit := 0;
    //         GenJournalLine.Reset();
    //         GenJournalLine.SetRange("Document No.", docNo);
    //         if GenJournalLine.FindFirst() then
    //             repeat
    //                 TDebit += GenJournalLine."Debit Amount";
    //             until GenJournalLine.Next() = 0;
    //     end;

    //     procedure CalculateTotals(ParmGenJournalLine: Record "Gen. Journal Line"; var ParmTotalDebit: Decimal; var TotalCredit: Decimal)
    //     var
    //         GenJournalLine: Record "Gen. Journal Line";
    //     begin
    //         Clear(ParmTotalDebit);
    //         Clear(TotalCredit);

    //         GenJournalLine.SetRange("Document No.", ParmGenJournalLine."Document No.");
    //         GenJournalLine.SetRange("Posting Date", ParmGenJournalLine."Posting Date");
    //         if GenJournalLine.FindSet() then
    //             repeat
    //                 if GenJournalLine."Debit Amount" <> 0 then begin
    //                     ParmTotalDebit += GenJournalLine."Debit Amount";
    //                     if GenJournalLine."Bal. Account No." <> '' then
    //                         TotalCredit += GenJournalLine."Debit Amount"
    //                     else
    //                         TotalCredit += GenJournalLine."TDS Amount";
    //                 end;

    //                 if GenJournalLine."Credit Amount" <> 0 then begin
    //                     TotalCredit += GenJournalLine."Credit Amount";
    //                     if GenJournalLine."Bal. Account No." <> '' then
    //                         ParmTotalDebit += GenJournalLine."Credit Amount"
    //                     else
    //                         ParmTotalDebit += GenJournalLine."TDS Amount";
    //                 end;
    //             until GenJournalLine.Next() = 0;
    //     end;

    //     procedure GetSourceName(SourceType: Enum "Gen. Journal Source Type"; SourceNo: Code[20]): Text
    //     var
    //         Customer: Record Customer;
    //         Vendor: Record Vendor;
    //         BankAccount: Record "Bank Account";
    //         FixedAsset: Record "Fixed Asset";
    //         Employee: Record Employee;
    //     begin
    //         case SourceType of
    //             SourceType::Customer:
    //                 begin
    //                     Customer.Get(SourceNo);
    //                     exit(Customer.Name);
    //                 end;
    //             SourceType::Vendor:
    //                 begin
    //                     Vendor.Get(SourceNo);
    //                     exit(Vendor.Name);
    //                 end;
    //             SourceType::"Bank Account":
    //                 begin
    //                     BankAccount.Get(SourceNo);
    //                     exit(BankAccount.Name);
    //                 end;
    //             SourceType::"Fixed Asset":
    //                 begin
    //                     FixedAsset.Get(SourceNo);
    //                     exit(FixedAsset.Description);
    //                 end;
    //             SourceType::Employee:
    //                 begin
    //                     Employee.Get(SourceNo);
    //                     exit(Employee.FullName());
    //                 end;
    //         end;
    //     end;

    //     procedure HideFinancialData(): Boolean
    //     var
    //         UserSetup2: Record "User Setup";
    //     begin
    //         if UserSetup2.Get(UserId) then
    //             exit(UserSetup2."Hide Financial Data");
    //     end;

    //     [EventSubscriber(ObjectType::Table, database::Contact, 'OnCreateCustomerOnBeforeCustomerModify', '', true, true)]
    //     local procedure FlowVATreg(Contact: Record Contact; var Customer: Record Customer)
    //     begin
    //         Customer."VAT Registration No." := Contact."VAT Registration No.";
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inventory Adjustment", 'OnPostItemJnlLineCopyFromValueEntry', '', false, false)]
    //     local procedure FlowDimToAdjustDimEntry(ValueEntry: Record "Value Entry"; var ItemJournalLine: Record "Item Journal Line")
    //     begin
    //         ItemJournalLine."Shortcut Dimension 3 Code" := ValueEntry."Shortcut Dimension 3 Code";
    //         ItemJournalLine."Shortcut Dimension 4 Code" := ValueEntry."Shortcut Dimension 4 Code";
    //         ItemJournalLine."Shortcut Dimension 5 Code" := ValueEntry."Shortcut Dimension 5 Code";
    //         ItemJournalLine."Shortcut Dimension 6 Code" := ValueEntry."Shortcut Dimension 6 Code";
    //         ItemJournalLine."Shortcut Dimension 7 Code" := ValueEntry."Shortcut Dimension 7 Code";
    //         ItemJournalLine."Shortcut Dimension 8 Code" := ValueEntry."Shortcut Dimension 8 Code";
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Update Item Analysis View", 'OnAfterInitializeTempItemAnalysisViewEntry', '', false, false)]
    //     local procedure DimflowOnAdjustValueEntry(ItemAnalysisView: Record "Item Analysis View"; var ItemAnalysisViewSource: Query "Item Analysis View Source";

    //     var
    //         TempItemAnalysisViewEntry: Record "Item Analysis View Entry")
    //     begin
    //     end;

    //     [EventSubscriber(ObjectType::Table, database::"VAT Entry", 'OnAfterCopyFromGenJnlLine', '', false, false)]
    //     local procedure CopyVatEntryFromGenJnlLine(GenJournalLine: Record "Gen. Journal Line"; var VATEntry: Record "VAT Entry")
    //     begin
    //         VATEntry.PragyapanPatra := GenJournalLine.PragyapanPatra;
    //     end;

    //     [EventSubscriber(ObjectType::Table, database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromPurchHeader', '', false, false)]
    //     local procedure CopyPragyapanPatraToJnlLine(PurchaseHeader: Record "Purchase Header"; var GenJournalLine: Record "Gen. Journal Line")
    //     begin
    //         GenJournalLine.PragyapanPatra := PurchaseHeader.PragyapanPatra;
    //         GenJournalLine."TDS Amount" := PurchaseHeader."Total TDS Amount";
    //         GenJournalLine."LC No." := PurchaseHeader."LC No.";
    //     end;

    //     [EventSubscriber(ObjectType::Table, database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
    //     local procedure OnAfterCopyGenJnlLineFromSalesHeader2(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    //     begin
    //         SalesHeader.CalcFields("Total TDS Amount");
    //         GenJournalLine."TDS Amount" := SalesHeader."Total TDS Amount";
    //         GenJournalLine."LC No." := SalesHeader."LC No.";
    //     end;

    //     [EventSubscriber(ObjectType::Table, database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', false, false)]
    //     local procedure CopyVATandTDSToJnlLine(GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry")
    //     begin
    //         VendorLedgerEntry."TDS Amount" := GenJournalLine."TDS Amount";
    //     end;

    //     [EventSubscriber(ObjectType::Table, database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromCVLedgEntryBuffer', '', false, false)]
    //     local procedure CopyVATandTDSTocustLedger(var CustLedgerEntry: Record "Cust. Ledger Entry"; CVLedgerEntryBuffer: Record "CV Ledger Entry Buffer")
    //     begin
    //     end;

    //     //Responsibility wise filter on list page
    //     //Responsibility wise page filter
    //     [EventSubscriber(ObjectType::Page, Page::"Sales Order List", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenSalesOrderListPageEvent(var Rec: Record "Sales Header")
    //     begin
    //         if GetSalesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Purchase Order List", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPurchaseOrderListPageEvent(var Rec: Record "Purchase Header")
    //     begin
    //         if GetPurchasesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Service list", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenServiceListpageEvent(var Rec: Record "Service Header")
    //     begin
    //         if GetServicesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Sales Invoice", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedSalesInvoiceageEvent(var Rec: Record "Sales Invoice Header")
    //     begin
    //         if GetSalesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Sales Invoices", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedSalesInvoicesageEvent(var Rec: Record "Sales Invoice Header")
    //     begin
    //         if GetSalesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Sales Shipment", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedSalesShipmentpageEvent(var Rec: Record "Sales Shipment Header")
    //     begin
    //         if GetSalesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Sales Shipments", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedSalesShipmentspageEvent(var Rec: Record "Sales Shipment Header")
    //     begin
    //         if GetSalesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Sales Credit Memo", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedSalesCreditMemopageEvent(var Rec: Record "Sales Cr.Memo Header")
    //     begin
    //         if GetSalesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Sales Credit Memos", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedSalesCreditMemospageEvent(var Rec: Record "Sales Cr.Memo Header")
    //     begin
    //         if GetSalesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Return Receipt", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedreturnReceiptpageEvent(var Rec: Record "Return Receipt Header")
    //     begin
    //         if GetSalesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Return Receipts", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedreturnReceiptspageEvent(var Rec: Record "Return Receipt Header")
    //     begin
    //         if GetSalesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Purchase Invoice", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedPurchaseInvoicepageEvent(var Rec: Record "Purch. Inv. Header")
    //     begin
    //         if GetPurchasesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Purchase Invoices", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedPurchaseInvoicespageEvent(var Rec: Record "Purch. Inv. Header")
    //     begin
    //         if GetPurchasesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Purchase Receipt", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedPurchaseReceiptpageEvent(var Rec: Record "Purch. Rcpt. Header")
    //     begin
    //         if GetPurchasesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Purchase Receipts", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedPurchaseReceiptspageEvent(var Rec: Record "Purch. Rcpt. Header")
    //     begin
    //         if GetPurchasesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Purchase Credit Memo", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedPurchaseCreditMemopageEvent(var Rec: Record "Purch. Cr. Memo Hdr.")
    //     begin
    //         if GetPurchasesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Purchase Credit Memos", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedPurchaseCreditMemospageEvent(var Rec: Record "Purch. Cr. Memo Hdr.")
    //     begin
    //         if GetPurchasesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Return Shipment", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedReturnShipmentpageEvent(var Rec: Record "Return Shipment Header")
    //     begin
    //         if GetPurchasesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Return Shipments", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedReturnShipmentspageEvent(var Rec: Record "Return Shipment Header")
    //     begin
    //         if GetPurchasesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Service Invoice", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedServiceInvoicepageEvent(var Rec: Record "Service Invoice Header")
    //     begin
    //         if GetServicesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Service Invoice", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedServiceInvoicespageEvent(var Rec: Record "Service Invoice Header")
    //     begin
    //         if GetServicesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Service Shipment", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedServiceShipmentpageEvent(var Rec: Record "Service Shipment Header")
    //     begin
    //         if GetServicesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Posted Service Shipments", 'OnOpenPageEvent', '', false, false)]
    //     local procedure OnOpenPostedServiceShipmentspageEvent(var Rec: Record "Service Shipment Header")
    //     begin
    //         if GetServicesFilter() <> '' then begin
    //             Rec.FilterGroup(2);
    //             Rec.SetFilter("Responsibility Center", GetUserRespCenterFilter());
    //             Rec.FilterGroup(0);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertValueEntry', '', false, false)]
    //     local procedure CopyDimensionItemJnlToValueEntry(ItemJournalLine: Record "Item Journal Line"; var ValueEntry: Record "Value Entry")
    //     begin
    //         ValueEntry."Shortcut Dimension 3 Code" := ItemJournalLine."Shortcut Dimension 3 Code";
    //         ValueEntry."Shortcut Dimension 4 Code" := ItemJournalLine."Shortcut Dimension 4 Code";
    //         ValueEntry."Shortcut Dimension 5 Code" := ItemJournalLine."Shortcut Dimension 5 Code";
    //         ValueEntry."Shortcut Dimension 6 Code" := ItemJournalLine."Shortcut Dimension 6 Code";
    //         ValueEntry."Shortcut Dimension 7 Code" := ItemJournalLine."Shortcut Dimension 7 Code";
    //         ValueEntry."Shortcut Dimension 8 Code" := ItemJournalLine."Shortcut Dimension 8 Code";
    //         ValueEntry."Purchase Consignment No." := ItemJournalLine."Purchase Consignment No.";
    //         ValueEntry.PragyapanPatra := ItemJournalLine.PragyapanPatra;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', false, false)]
    //     local procedure CopyDimensionsItemJnlToItemLedgerEntry(ItemJournalLine: Record "Item Journal Line"; var ItemLedgerEntry: Record "Item Ledger Entry")
    //     begin
    //         ItemLedgerEntry."Shortcut Dimension 3 Code" := ItemJournalLine."Shortcut Dimension 3 Code";
    //         ItemLedgerEntry."Shortcut Dimension 4 Code" := ItemJournalLine."Shortcut Dimension 4 Code";
    //         ItemLedgerEntry."Shortcut Dimension 5 Code" := ItemJournalLine."Shortcut Dimension 5 Code";
    //         ItemLedgerEntry."Shortcut Dimension 6 Code" := ItemJournalLine."Shortcut Dimension 6 Code";
    //         ItemLedgerEntry."Shortcut Dimension 7 Code" := ItemJournalLine."Shortcut Dimension 7 Code";
    //         ItemLedgerEntry."Shortcut Dimension 8 Code" := ItemJournalLine."Shortcut Dimension 8 Code";
    //         ItemLedgerEntry."Purchase Consignment No." := ItemJournalLine."Purchase Consignment No.";
    //         ItemLedgerEntry.PragyapanPatra := ItemJournalLine.PragyapanPatra;
    //         ItemLedgerEntry.Narration := ItemJournalLine.Narration;
    //         ItemLedgerEntry."LC No." := ItemJournalLine."LC No.";//Upanshu
    //     end;

    //     [EventSubscriber(ObjectType::table, database::"item journal line", 'OnAfterCopyItemJnlLineFromPurchHeader', '', false, false)]
    //     local procedure InsertConsignmentDetailToItemJournal(PurchHeader: Record "Purchase Header"; var ItemJnlLine: Record "Item Journal Line")
    //     begin
    //         ItemJnlLine."Purchase Consignment No." := PurchHeader."Purchase Consignment No.";
    //         ItemJnlLine.PragyapanPatra := PurchHeader.PragyapanPatra;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitValueEntry', '', false, false)]
    //     local procedure OnAfterInitValueEntry(ItemJournalLine: Record "Item Journal Line"; var ValueEntry: Record "Value Entry")
    //     begin
    //         ValueEntry."Sys.LC No." := ItemJournalLine."LC No.";
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeUpdatePostingNo', '', false, false)]
    //     local procedure PostingNoSeries(PreviewMode: Boolean; var IsHandled: Boolean; var ModifyHeader: Boolean; var SalesHeader: Record "Sales Header")
    //     var
    //         EnvironmentInfo: Codeunit "Environment Information";
    //     begin
    //         if EnvironmentInfo.IsOnPrem() then begin
    //             SalesHeader."Posting No." := GetInvoicePostingNo(SalesHeader); //Agile.16.07 28 JULY 2016
    //             if SalesHeader."Posting No." = '' then
    //                 SalesHeader."Posting No." := GetServInvoicePostingNo(SalesHeader);

    //             ModifyHeader := true;
    //         end;
    //     end;

    //     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeUpdatePostingNos', '', false, false)]
    //     // local procedure PostingNoSeries1(CommitIsSuppressed: Boolean; var ModifyHeader: Boolean; var NoSeriesMgt: Codeunit NoSeriesManagement; var SalesHeader: Record "Sales Header")
    //     // begin
    //     // end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterCheckMandatoryFields', '', false, false)]
    //     local procedure InsertBalAccountNo_SalesReturn(var SalesHeader: Record "Sales Header")
    //     var
    //         PaymentMethod: Record "Payment Method";
    //     begin
    //         if SalesHeader."Document type" in [SalesHeader."Document Type"::"Credit Memo", SalesHeader."Document Type"::"Return Order"] then
    //             if PaymentMethod.Get(SalesHeader."Payment Method Code") then
    //                 if PaymentMethod.Type = PaymentMethod.Type::"Credit Memo" then begin
    //                     SalesHeader."Bal. Account Type" := PaymentMethod."Bal. Account Type";
    //                     SalesHeader."Bal. Account No." := PaymentMethod."Bal. Account No.";
    //                     SalesHeader.Modify();
    //                 end;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Post Invoice Events", 'OnPostBalancingEntryOnBeforeGenJnlPostLine', '', false, false)]
    //     local procedure OnBeforePostBalancingEntry(PreviewMode: Boolean; SalesHeader: Record "Sales Header"; var GenJnlLine: Record "Gen. Journal Line"; var TotalSalesLine: Record "Sales Line"; var TotalSalesLineLCY: Record "Sales Line")
    //     begin
    //         GenJnlLine."Nepali Date" := EnglishNepaliDateNep.getNepaliDate(SalesHeader."Posting Date");
    //         if SalesHeader."Bal. Account No." = '' then
    //             exit;

    //         if SalesHeader."Advance/Receipt Amount" = 0 then
    //             exit;

    //         if SalesHeader."Document Type" in [SalesHeader."Document Type"::"Return Order", SalesHeader."Document Type"::"Credit Memo"] then begin
    //             GenJnlLine."Applies-to Doc. No." := '';
    //             GenJnlLine."Applies-to ID" := '';
    //         end;

    //         if GenJnlLine.amount > 0 then begin
    //             GenJnlLine.Validate("Document Type", GenJnlLine."Document Type"::Invoice);
    //             GenJnlLine.Validate(amount, SalesHeader."Advance/Receipt Amount");
    //         end
    //         else begin
    //             GenJnlLine.Validate("Document Type", GenJnlLine."Document Type"::"Payment");
    //             GenJnlLine.Validate(amount, -SalesHeader."Advance/Receipt Amount");
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    //     local procedure CheckSendToIRD(var SalesHeader: Record "Sales Header"; SalesInvHdrNo: Code[20])
    //     var
    //         SalesHdr: Record "Sales Header";
    //         SalesSetup: Record "Sales & Receivables Setup";
    //     begin
    //         if SalesHeader.Invoice then
    //             SendToIRD(SalesHeader);

    //         SalesSetup.Get();
    //         if SalesSetup."Delete Partial Order Invoice" then
    //             if SalesHdr.Get(SalesHeader."Document Type", SalesHeader."No.") then
    //                 SalesHdr.Delete(true);
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    //     local procedure UpdateDoc(var ApprovalEntry: Record "Approval Entry")
    //     var
    //         SalesHeader: Record "Sales Header";
    //     begin
    //         SalesHeader.Reset();
    //         SalesHeader.SetRange("No.", ApprovalEntry."Document No.");
    //         if SalesHeader.FindFirst() then
    //             SalesHeader.Validate(Status, SalesHeader.Status::Released);
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    //     local procedure OnAfterPostSalesDoc(CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; RetRcpHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesShptHdrNo: Code[20]; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; var SalesHeader: Record "Sales Header")
    //     begin
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSendGeneralJournalLineForApproval', '', false, false)]
    //     local procedure OnSendGeneralJournalLineForApproval(var GenJournalLine: Record "Gen. Journal Line")
    //     var
    //         GLSetup: Record "General Ledger Setup";
    //         AppGenJnlLine: Record "Gen. Journal Line";
    //         ApproveEnt: Record "Approval Entry";
    //         AppGenJnlLine2: Record "Gen. Journal Line";
    //         GenJnlCheckLine: Codeunit "Gen. Jnl.-Check Line";
    //         i: Integer;
    //         j: Integer;
    //     begin
    //         i := 0;
    //         j := 0;

    //         GLSetup.Get();
    //         if not GLSetup."Enable Maker-Checker Feature" then
    //             exit;

    //         GenJnlCheckLine.Run(GenJournalLine);
    //         CheckDimensionBeforeApproval(GenJournalLine);
    //         CheckBalanceBeforeSendingApproval(GenJournalLine);

    //         GenJournalLine.Validate("Approval Status", GenJournalLine."Approval Status"::"Pending Approval");
    //         GenJournalLine.Modify();

    //         AppGenJnlLine.Reset();
    //         AppGenJnlLine.SetRange("Journal Template Name", GenJournalLine."Journal Template Name");
    //         AppGenJnlLine.SetRange("Journal Batch Name", GenJournalLine."Journal Batch Name");
    //         AppGenJnlLine.SetRange("Document No.", GenJournalLine."Document No.");
    //         AppGenJnlLine.SetFilter("Line No.", '<>%1', GenJournalLine."Line No.");
    //         AppGenJnlLine.ModifyAll("Approval Status", AppGenJnlLine."Approval Status"::"Pending Approval");

    //         ApproveEnt.Reset();
    //         ApproveEnt.SetRange("Journal Template Name", GenJournalLine."Journal Template Name");
    //         ApproveEnt.SetRange("Journal Batch Name", GenJournalLine."Journal Batch Name");
    //         ApproveEnt.SetRange("Document No.", GenJournalLine."Document No.");
    //         if ApproveEnt.FindFirst() then
    //             repeat
    //                 i += 1;
    //             until ApproveEnt.Next() = 0;
    //         // i += ApproveEnt.Count();

    //         ApproveEnt.Reset();
    //         ApproveEnt.SetRange("Journal Template Name", GenJournalLine."Journal Template Name");
    //         ApproveEnt.SetRange("Journal Batch Name", GenJournalLine."Journal Batch Name");
    //         ApproveEnt.SetRange("Document No.", GenJournalLine."Document No.");
    //         ApproveEnt.SetRange(Status, ApproveEnt.Status::Approved);
    //         if ApproveEnt.FindFirst() then
    //             repeat
    //                 j += 1;
    //             until ApproveEnt.Next() = 0;
    //         // j += ApproveEnt.Count();

    //         if i = j then begin
    //             GenJournalLine.Validate("Approval Status", GenJournalLine."Approval Status"::Released);
    //             GenJournalLine.Modify();
    //             AppGenJnlLine.Reset();
    //             AppGenJnlLine.SetRange("Journal Template Name", GenJournalLine."Journal Template Name");
    //             AppGenJnlLine.SetRange("Journal Batch Name", GenJournalLine."Journal Batch Name");
    //             AppGenJnlLine.SetRange("Document No.", GenJournalLine."Document No.");
    //             AppGenJnlLine.SetFilter("Line No.", '<>%1', GenJournalLine."Line No.");
    //             AppGenJnlLine.ModifyAll("Approval Status", AppGenJnlLine."Approval Status"::Released);

    //             FinalAppMail(GenJournalLine."Document No.", GenJournalLine."Journal Template Name", GenJournalLine."Journal Batch Name");
    //         end else begin
    //             AppGenJnlLine2.Reset();
    //             AppGenJnlLine2.SetRange("Journal Template Name", GenJournalLine."Journal Template Name");
    //             AppGenJnlLine2.SetRange("Journal Batch Name", GenJournalLine."Journal Batch Name");
    //             AppGenJnlLine2.SetRange("Document No.", GenJournalLine."Document No.");
    //             if AppGenJnlLine2.FindFirst() then
    //                 SendApprovalMail(AppGenJnlLine2.RecordId, AppGenJnlLine2);
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnCancelGeneralJournalLineApprovalRequest', '', false, false)]
    //     local procedure OnCancelGeneralJournalLineApprovalRequest(var GenJournalLine: Record "Gen. Journal Line")
    //     begin
    //         GenJournalLine.Validate("Approval Status", GenJournalLine."Approval Status"::Open);
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeApprovalEntryInsert', '', false, false)]
    //     local procedure OnBeforeApprovalEntryInsert(ApprovalEntryArgument: Record "Approval Entry"; var ApprovalEntry: Record "Approval Entry")
    //     var
    //         GenJnlLine: Record "Gen. Journal Line";
    //         RecRef: RecordRef;
    //     begin
    //         RecRef.Get(ApprovalEntry."Record ID to Approve");
    //         case RecRef.Number of
    //             Database::"Gen. Journal Line":
    //                 begin
    //                     RecRef.SetTable(GenJnlLine);
    //                     ApprovalEntry."Journal Template Name" := GenJnlLine."Journal Template Name";
    //                     ApprovalEntry."Journal Batch Name" := GenJnlLine."Journal Batch Name";
    //                 end;
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", 'OnBeforeSendEmail', '', false, false)]
    //     local procedure test(var ReportUsage: Integer; EmailDocName: Text[250]; EmailScenario: Enum "Email Scenario"; SenderUserID: Code[50]; var EmailSentSuccesfully: Boolean; var HideDialog: Boolean; var IsFromPostedDoc: Boolean; var IsHandled: Boolean; var PostedDocNo: Code[20]; var TempEmailItem: Record "Email Item")
    //     begin
    //     end;

    //     [EventSubscriber(ObjectType::Table, Database::"Approval Entry", 'OnBeforeShowRecord', '', false, false)]
    //     local procedure OpenRecord(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    //     var
    //         GenJnlLine: Record "Gen. Journal Line";
    //         GenJournalTemplate: Record "Gen. Journal Template";
    //         ApprovingGenJnlLine: Record "Gen. Journal Line";
    //         RecRef: RecordRef;
    //     begin
    //         if not RecRef.Get(ApprovalEntry."Record ID to Approve") then
    //             exit;

    //         case RecRef.Number of
    //             Database::"Gen. Journal Line":
    //                 begin
    //                     RecRef.SetTable(GenJnlLine);

    //                     GenJournalTemplate.Get(GenJnlLine."Journal Template Name");
    //                     ApprovingGenJnlLine.Reset();
    //                     ApprovingGenJnlLine.SetRange("Journal Template Name", GenJnlLine."Journal Template Name");
    //                     ApprovingGenJnlLine.SetRange("Journal Batch Name", GenJnlLine."Journal Batch Name");
    //                     ApprovingGenJnlLine.SetRange("Document No.", GenJnlLine."Document No.");
    //                     if ApprovingGenJnlLine.FindSet() then begin
    //                         IsHandled := true;

    //                         case GenJournalTemplate.Type of
    //                             GenJournalTemplate.Type::General:
    //                                 Page.RunModal(Page::"General Journal", ApprovingGenJnlLine);
    //                             GenJournalTemplate.Type::"Cash Receipts":
    //                                 Page.RunModal(Page::"Cash Receipt Journal", ApprovingGenJnlLine);
    //                             GenJournalTemplate.Type::Payments:
    //                                 Page.RunModal(Page::"Payment Journal", ApprovingGenJnlLine);
    //                         end;
    //                     end;
    //                 end;
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    //     local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    //     var
    //         GenJnlLine: Record "Gen. Journal Line";
    //         ApprovingGenJnl: Record "Gen. Journal Line";
    //         RelatedApprovalEntry: Record "Approval Entry";
    //         RecRef: RecordRef;
    //         OpenEntriesFound: Boolean;
    //         IsApproved: Boolean;
    //     begin
    //         case ApprovalEntry."Table ID" of
    //             Database::"Gen. Journal Line":
    //                 begin
    //                     Clear(RecRef);
    //                     Clear(OpenEntriesFound);
    //                     RecRef.GetTable(GenJnlLine);
    //                     RecRef.Get(ApprovalEntry."Record ID to Approve");
    //                     RecRef.SetTable(GenJnlLine);

    //                     //change related approval entry status with "Created" to "Open"
    //                     RelatedApprovalEntry.Reset();
    //                     RelatedApprovalEntry.SetRange("Document No.", ApprovalEntry."Document No.");
    //                     RelatedApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
    //                     RelatedApprovalEntry.SetFilter("Entry No.", '<>%1', ApprovalEntry."Entry No.");
    //                     if RelatedApprovalEntry.FindFirst() then begin
    //                         RelatedApprovalEntry.Validate(Status, RelatedApprovalEntry.Status::Open);
    //                         RelatedApprovalEntry.Modify(true);

    //                         OpenEntriesFound := true;
    //                         SendmailApp(RelatedApprovalEntry."Document No.", RelatedApprovalEntry."Journal Template Name", RelatedApprovalEntry."Journal Batch Name");
    //                     end;

    //                     //approve all lines at once
    //                     if not OpenEntriesFound then begin
    //                         ApprovingGenJnl.Reset();
    //                         ApprovingGenJnl.SetRange("Journal Template Name", GenJnlLine."Journal Template Name");
    //                         ApprovingGenJnl.SetRange("Journal Batch Name", GenJnlLine."Journal Batch Name");
    //                         ApprovingGenJnl.SetRange("Document No.", GenJnlLine."Document No.");
    //                         if ApprovingGenJnl.FindFirst() then begin
    //                             repeat
    //                                 ApprovingGenJnl."Approval Status" := ApprovingGenJnl."Approval Status"::Released;
    //                                 ApprovingGenJnl.Modify();
    //                                 IsApproved := true
    //                             until ApprovingGenJnl.Next() = 0;

    //                             if IsApproved = true then
    //                                 FinalAppMail(ApprovingGenJnl."Document No.", ApprovingGenJnl."Journal Template Name", ApprovingGenJnl."Journal Batch Name");
    //                         end;
    //                     end;
    //                 end;
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    //     local procedure OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    //     var
    //         ApprovingGenJnl: Record "Gen. Journal Line";
    //         GenJnlLine: Record "Gen. Journal Line";
    //         RelatedApprovalEntry: Record "Approval Entry";
    //         RecRef: RecordRef;
    //     begin
    //         case ApprovalEntry."Table ID" of
    //             Database::"Gen. Journal Line":
    //                 begin
    //                     Clear(RecRef);
    //                     RecRef.GetTable(GenJnlLine);
    //                     RecRef.Get(ApprovalEntry."Record ID to Approve");
    //                     RecRef.SetTable(GenJnlLine);

    //                     //open all lines at once
    //                     ApprovingGenJnl.Reset();
    //                     ApprovingGenJnl.SetRange("Journal Template Name", GenJnlLine."Journal Template Name");
    //                     ApprovingGenJnl.SetRange("Journal Batch Name", GenJnlLine."Journal Batch Name");
    //                     ApprovingGenJnl.SetRange("Document No.", GenJnlLine."Document No.");
    //                     if ApprovingGenJnl.FindFirst() then begin
    //                         ApprovingGenJnl.ModifyAll("Approval Status", ApprovingGenJnl."Approval Status"::Open);

    //                         //change related approval entry status open to reject 
    //                         RelatedApprovalEntry.Reset();
    //                         RelatedApprovalEntry.SetRange("Document No.", ApprovalEntry."Document No.");
    //                         RelatedApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
    //                         RelatedApprovalEntry.SetFilter("Entry No.", '<>%1', ApprovalEntry."Entry No.");
    //                         if RelatedApprovalEntry.FindFirst() then
    //                             RelatedApprovalEntry.ModifyAll(Status, ApprovalEntry.Status);
    //                     end
    //                 end;
    //         end;
    //     end;


    //     [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterGetNoSeriesCode', '', false, false)]
    //     local procedure GetNoSeries(PurchSetup: Record "Purchases & Payables Setup"; var NoSeriesCode: Code[20]; var PurchHeader: Record "Purchase Header")
    //     begin
    //         case PurchHeader."Document Type" of
    //             PurchHeader."Document Type"::Requisition:
    //                 NoSeriesCode := PurchSetup."Purchase Requisition Nos.";
    //         end;
    //     end;


    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::GenJnlManagement, 'OnBeforeOpenJnl', '', false, false)]
    //     local procedure OpenGJnl(var CurrentJnlBatchName: Code[10]; var GenJnlLine: Record "Gen. Journal Line")
    //     begin

    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::GenJnlManagement, 'OnBeforeLookupName', '', false, false)]
    //     local procedure BatchFilter(var GenJnlBatch: Record "Gen. Journal Batch")
    //     var
    //         GenJournalLine: Record "Gen. Journal Line";
    //         batch: Code[20];
    //     begin
    //         batch := CopyStr(GenJournalLine.FilterBatch2(GenJnlBatch."Journal Template Name"), 1, MaxStrLen(batch));
    //         if batch <> '' then
    //             GenJnlBatch.SetFilter(Name, batch);
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::ItemJnlManagement, 'OnBeforeLookupName', '', false, false)]
    //     local procedure ItemJnlBatchFilter(var ItemJnlBatch: Record "Item Journal Batch")
    //     var
    //         ItemJournalLine: Record "Gen. Journal Line";
    //         batch: Code[20];
    //     begin
    //         batch := CopyStr(ItemJournalLine.FilterBatch2(ItemJnlBatch."Journal Template Name"), 1, MaxStrLen(batch));
    //         if batch <> '' then
    //             ItemJnlBatch.SetFilter(Name, batch);
    //     end;

    //     [EventSubscriber(ObjectType::table, database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromPurchLine', '', false, false)]
    //     local procedure CopyItemJnlFromPurchLine(PurchLine: Record "Purchase Line"; var ItemJnlLine: Record "Item Journal Line")

    //     begin
    //         ItemJnlLine."Purchase Consignment No." := PurchLine."Purchase Consignment No.";

    //         ItemJnlLine.PragyapanPatra := PurchLine.PragyapanPatra;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Preview", 'OnBeforeShowAllEntries', '', false, false)]
    //     local procedure OnAfterUnbindSubscription()
    //     begin
    //     end;

    //     [EventSubscriber(ObjectType::Table, Database::"Certificate of Supply", 'OnAfterInitFromSales', '', false, false)]
    //     local procedure OnAfterInitFromSales(SalesShipmentHeader: Record "Sales Shipment Header"; var CertificateOfSupply: Record "Certificate of Supply")
    //     begin
    //         CertificateOfSupply."Order No." := SalesShipmentHeader."Order No.";
    //         CertificateOfSupply."Agent Code" := SalesShipmentHeader."Shipping Agent Code";
    //         CertificateOfSupply."Salesperson Code" := SalesShipmentHeader."Salesperson Code";
    //         CertificateOfSupply."Responsibility Center" := SalesShipmentHeader."Responsibility Center";
    //     end;

    //     [EventSubscriber(ObjectType::Table, Database::"Certificate of Supply", 'OnAfterInitFromPurchase', '', false, false)]
    //     local procedure OnAfterInitFromPurchase(ReturnShipmentHeader: Record "Return Shipment Header"; var CertificateOfSupply: Record "Certificate of Supply")
    //     begin
    //         CertificateOfSupply."Order No." := ReturnShipmentHeader."Return Order No.";
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shipment Header - Edit", 'OnBeforeSalesShptHeaderModify', '', false, false)]
    //     local procedure OnBeforeSalesShptHeaderModify(FromSalesShptHeader: Record "Sales Shipment Header"; var SalesShptHeader: Record "Sales Shipment Header")
    //     var
    //         CertificateOfSupply: Record "Certificate of Supply";
    //     begin
    //         SalesShptHeader."Vehicle Registration No." := FromSalesShptHeader."Vehicle Registration No.";

    //         CertificateOfSupply.SetFilter("Order No.", '<>%1&%2', '', SalesShptHeader."Order No.");
    //         CertificateOfSupply.ModifyAll("Vehicle Registration No.", SalesShptHeader."Vehicle Registration No.");
    //         CertificateOfSupply.ModifyAll("Agent Code", SalesShptHeader."Shipping Agent Code");
    //     end;

    //     [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterInitRecord', '', false, false)]
    //     local procedure OnAfterInitRecord_PurchaseHeader(var PurchHeader: Record "Purchase Header")
    //     var
    //         EngNep2: Record "English-Nepali Date NEP";
    //     begin
    //         if PurchHeader."Posting Date" <> 0D then
    //             PurchHeader."Nepali Date" := EngNep2.getNepaliDate(PurchHeader."Posting Date");
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    //     local procedure OnBeforePostSalesDoc(CommitIsSuppressed: Boolean; PreviewMode: Boolean; sender: Codeunit "Sales-Post"; var HideProgressWindow: Boolean; var SalesHeader: Record "Sales Header")
    //     var
    //         SalesRecievableSetup: Record "Sales & Receivables Setup";
    //     begin
    //         SalesRecievableSetup.Get();
    //         if SalesRecievableSetup."Posting Control" then
    //             if SalesHeader."Sell-to Customer No." <> SalesHeader."Bill-to Customer No." then
    //                 Error('Sell-to Customer No. %1 and Bill-To Customer No. %2 should be same', SalesHeader."Sell-to Customer No.", SalesHeader."Bill-to Customer No.");
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePostPurchaseDoc', '', false, false)]
    //     local procedure OnBeforePostPurchaseDoc(CommitIsSupressed: Boolean; PreviewMode: Boolean; sender: Codeunit "Purch.-Post"; var HideProgressWindow: Boolean; var PurchaseHeader: Record "Purchase Header")
    //     var
    //         PurchaseRecievableSetup: Record "Purchases & Payables Setup";
    //     begin
    //         PurchaseRecievableSetup.Get();
    //         if PurchaseRecievableSetup."Posting Control" then
    //             if PurchaseHeader."Buy-from Vendor No." <> PurchaseHeader."Pay-to Vendor No." then
    //                 Error('Buy-from Vendor No. %1 and Pay-To Vendor No. %2 should be same', PurchaseHeader."Buy-from Vendor No.", PurchaseHeader."Pay-to Vendor No.");
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPrepareTempVendLedgEntryOnAfterSetFilters', '', false, false)]
    //     local procedure OnPrepareTempVendLedgEntryOnAfterSetFilters(CVLedgerEntryBuffer: Record "CV Ledger Entry Buffer"; GenJournalLine: Record "Gen. Journal Line"; var OldVendorLedgerEntry: Record "Vendor Ledger Entry")
    //     var
    //         PurchaseSetup: Record "Purchases & Payables Setup";
    //     begin
    //         PurchaseSetup.Get();
    //         if PurchaseSetup."Apply Vend. Ledg. Sh. Dim 1" then
    //             OldVendorLedgerEntry.SetRange("Global Dimension 1 Code", GenJournalLine."Shortcut Dimension 1 Code");

    //         if PurchaseSetup."Apply Vend. Ledg. Sh. Dim 2" then
    //             OldVendorLedgerEntry.SetRange("Global Dimension 2 Code", GenJournalLine."Shortcut Dimension 2 Code");
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPrepareTempVendLedgEntryOnAfterSetFiltersBlankAppliesToDocNo', '', false, false)]
    //     local procedure OnPrepareTempVendLedgEntryOnAfterSetFiltersBlankAppliesToDocNo(CVLedgerEntryBuffer: Record "CV Ledger Entry Buffer"; GenJournalLine: Record "Gen. Journal Line"; var OldVendorLedgerEntry: Record "Vendor Ledger Entry")
    //     var
    //         PurchaseSetup: Record "Purchases & Payables Setup";
    //     begin
    //         PurchaseSetup.Get();
    //         if PurchaseSetup."Apply Vend. Ledg. Sh. Dim 1" then
    //             OldVendorLedgerEntry.SetRange("Global Dimension 1 Code", GenJournalLine."Shortcut Dimension 1 Code");

    //         if PurchaseSetup."Apply Vend. Ledg. Sh. Dim 2" then
    //             OldVendorLedgerEntry.SetRange("Global Dimension 2 Code", GenJournalLine."Shortcut Dimension 2 Code");
    //     end;

    //     [EventSubscriber(ObjectType::Page, Page::"Apply Vendor Entries", 'OnBeforeSetApplyingVendLedgEntry', '', false, false)]
    //     local procedure OnBeforeSetApplyingVendLedgEntry(GenJournalLine: Record "Gen. Journal Line"; sender: Page "Apply Vendor Entries";

    //     var
    //         ApplyingVendLedgEntry: Record "Vendor Ledger Entry")
    //     var
    //         PurchSetup: Record "Purchases & Payables Setup";
    //     begin
    //         if sender.GetCalcType() = 1 then begin
    //             PurchSetup.Get();
    //             if PurchSetup."Apply Vend. Ledg. Sh. Dim 1" then
    //                 ApplyingVendLedgEntry."Global Dimension 1 Code" := GenJournalLine."Shortcut Dimension 1 Code";

    //             if PurchSetup."Apply Vend. Ledg. Sh. Dim 2" then
    //                 ApplyingVendLedgEntry."Global Dimension 2 Code" := GenJournalLine."Shortcut Dimension 2 Code";
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Batch Posting Print Mgt.", 'OnBeforeGLRegPostingReportPrint', '', false, false)]
    //     local procedure OnBeforeGLRegPostingReportPrint(var Handled: Boolean; ReqWindow: Boolean; var GLRegister: Record "G/L Register"; var ReportID: Integer)
    //     var
    //         GeneralLedgerSetup: Record "General Ledger Setup";
    //     begin
    //         GeneralLedgerSetup.Get();
    //         if not GeneralLedgerSetup."Post & Print with Job Queue" then begin
    //             Report.Run(ReportID, true, false, GLRegister);
    //             Handled := true;
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterInitNewLine', '', false, false)]
    //     local procedure OnAfterInitNewLine(var GenJournalLine: Record "Gen. Journal Line")
    //     begin
    //         GenJournalLine."Nepali Date" := EnglishNepaliDateNep.getNepaliDate(GenJournalLine."Posting Date");
    //     end;

    //     // [EventSubscriber(ObjectType::Table, database::Contact, 'OnBeforeCustomerInsert', '', false, false)]
    //     // local procedure OnBeforeCustomerInsert(CustomerTemplate: Code[20]; var Cust: Record Customer)
    //     // var
    //     //     Custtempl: Record "Customer Template";
    //     // begin
    //     //     Custtempl.Get(CustomerTemplate);
    //     //     Cust."Application Method" := Custtempl."Application Method";
    //     // end;

    //     [EventSubscriber(ObjectType::Table, database::Contact, 'OnCreateCustomerFromTemplateOnBeforeCustomerInsert', '', false, false)]
    //     local procedure OnCreateCustomerFromTemplateOnBeforeCustomerInsert(CustomerTemplate: Code[20]; var Contact: Record Contact; var Cust: Record Customer)
    //     var
    //         Custtempl: Record "Customer Templ.";
    //     begin
    //         Custtempl.get(CustomerTemplate);
    //         Cust."Application Method" := Custtempl."Application Method";

    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostItemJnlLine', '', false, false)]
    //     local procedure OnAfterPostItemJnlLine(var ItemJnlPostLine: Codeunit "Item Jnl.-Post Line"; var ItemJournalLine: Record "Item Journal Line"; var PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line")
    //     begin
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeStartOrContinuePosting', '', false, false)]
    //     local procedure OnBeforeStartOrContinuePosting(var GenJnlLine: Record "Gen. Journal Line")
    //     begin
    //         if (GenJnlLine."VAT Amount" <> 0) and (GenJnlLine."Line No." <> 0) and (GenJnlLine."Gen. Posting Type" = GenJnlLine."Gen. Posting Type"::Sale) then
    //             error('Sales VAT entries should be made from Sales Document.')
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Enum Assignment Management", 'OnGetPurchApprovalDocumentType', '', false, false)]
    //     local procedure OnGetPurchApprovalDocumentType(PurchDocumentType: Enum "Purchase Document Type"; var ApprovalDocumentType: Enum "Approval Document Type"; var IsHandled: Boolean);
    //     begin
    //         if PurchDocumentType = PurchDocumentType::Requisition then begin
    //             ApprovalDocumentType := ApprovalDocumentType::Requisition;
    //             IsHandled := true;
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeInitInsert', '', true, true)]
    //     local procedure OnBeforeInitInsertSalesHeader(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    //     begin
    //         OnBeforeGetNoSeriesFromRespCenter(SalesHeader, xSalesHeader, IsHandled);
    //         If not IsHandled then
    //             if GetNoSeriesFromRespCenter() then begin
    //                 SalesHeader.InitInsertUsingRespCenter();
    //                 IsHandled := true;
    //             end;
    //     end;

    //     [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeInitRecord', '', true, true)]
    //     local procedure OnBeforeInitRecordSalesHeader(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean; xSalesHeader: Record "Sales Header")
    //     begin
    //         if GetNoSeriesFromRespCenter() then begin
    //             SalesHeader.InitRecordUsingRespCenter();
    //             IsHandled := true;
    //         end;
    //     end;

    // [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnBeforeInitInsert', '', true, true)]
    // local procedure OnBeforeInitInsertPurchaseHeader(var PurchaseHeader: Record "Purchase Header"; xPurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean)
    // begin

    //     if GetNoSeriesFromRespCenter() then begin
    //         PurchaseHeader.InitInsertUsingRespCenter();
    //         IsHandled := true;
    //     end;
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnBeforeInitRecord', '', true, true)]
    // local procedure OnBeforeInitRecordPurchaseHeaer(var PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean; xPurchaseHeader: Record "Purchase Header")
    // begin
    //     if GetNoSeriesFromRespCenter() then begin
    //         PurchaseHeader.InitRecordUsingRespCenter();
    //         IsHandled := true;
    //     end;
    //     PurchaseHeader."Assigned User ID" := UserId;
    // end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Shipment", 'OnBeforeGenNextNo', '', true, true)]
    //     local procedure OnBeforeGenNextNoTransferShipment(var TransferShipmentHeader: Record "Transfer Shipment Header"; TransferHeader: Record "Transfer Header")
    //     var
    //         DocumentProfile: Option Purchase,Sales,Transfer,Service;
    //         DocumentType:
    //                 Option Quote,"Blanket Order","Order","Return Order",Invoice,"Posted Invoice","Credit Memo","Posted Credit Memo","Posted Shipment","Posted Receipt","Posted Prepmt. Inv.","Posted Prepmt. Cr. Memo","Posted Return Receipt","Posted Return Shipment",Booking,"Posted Order","Posted Debit Note",Requisition,Services,"Posted Credit Note";
    //         UserSetup: Record "User Setup";
    //     begin
    //         if not GetNoSeriesFromRespCenter() then
    //             exit;
    //         UserSetup.Get(UserId);
    //         ResponsibilityCenter.Reset();
    //         if ResponsibilityCenter.Get(UserSetup."Default Responsibility Center") then
    //             // ResponsibilityCenter.SetRange("Location Code", TransferHeader."Transfer-from Code");
    //             // if ResponsibilityCenter.FindFirst() then
    //             TransferShipmentHeader."No. Series" := GetRespCenterWiseNoSeries(DocumentProfile::Transfer, DocumentType::"Posted Shipment", ResponsibilityCenter.Code)
    //         else
    //             Error('Default Responsibility Center must have a value in User Setup.');
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnInsertTransRcptHeaderOnBeforeGetNextNo', '', true, true)]
    //     local procedure OnInsertTransRcptHeaderOnBeforeGetNextNo(var TransRcptHeader: Record "Transfer Receipt Header"; TransHeader: Record "Transfer Header")
    //     var
    //         DocumentProfile: Option Purchase,Sales,Transfer,Service;
    //         DocumentType:
    //                 Option Quote,"Blanket Order","Order","Return Order",Invoice,"Posted Invoice","Credit Memo","Posted Credit Memo","Posted Shipment","Posted Receipt","Posted Prepmt. Inv.","Posted Prepmt. Cr. Memo","Posted Return Receipt","Posted Return Shipment",Booking,"Posted Order","Posted Debit Note",Requisition,Services,"Posted Credit Note";
    //         UserSetup: Record "User Setup";
    //     begin
    //         if not GetNoSeriesFromRespCenter() then
    //             exit;
    //         UserSetup.Get(UserId);
    //         ResponsibilityCenter.Reset();
    //         // ResponsibilityCenter.SetRange("Location Code", TransHeader."Transfer-to Code");
    //         // if ResponsibilityCenter.FindFirst() then
    //         if ResponsibilityCenter.Get(UserSetup."Default Responsibility Center") then
    //             TransRcptHeader."No. Series" := GetRespCenterWiseNoSeries(DocumentProfile::Transfer, DocumentType::"Posted Receipt", ResponsibilityCenter.Code)
    //         else
    //             Error('Default Responsibility Center must have a value in User Setup.');
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"User Setup Management", 'OnBeforeGetLocation', '', false, false)]
    //     local procedure OnBeforeGetLocation(DocType: Option Sales,Purchase,Service; var LocationCode: Code[10]; var IsHandled: Boolean)
    //     var
    //         UserSetup: Record "User Setup";
    //     begin
    //         if DocType = DocType::Purchase then begin
    //             UserSetup.Get(UserId);
    //             LocationCode := UserSetup."Default Location";
    //             IsHandled := true;
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
    //     local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    //     begin
    //         GenJournalLine."LC No." := SalesHeader."LC No.";
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertDtldCustLedgEntry', '', false, false)]
    //     local procedure OnBeforeInsertDtldCustLedgEntry(var DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry"; GenJournalLine: Record "Gen. Journal Line"; DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer"; GLRegister: Record "G/L Register")
    //     begin
    //         DtldCustLedgEntry."LC No." := GenJournalLine."LC No.";
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertDtldVendLedgEntry', '', false, false)]
    //     local procedure OnBeforeInsertDtldVendLedgEntry(var DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry"; GenJournalLine: Record "Gen. Journal Line"; DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer"; GLRegister: Record "G/L Register")
    //     begin
    //         DtldVendLedgEntry."LC No." := GenJournalLine."LC No.";
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    //     local procedure OnBeforePostSalesDoc1(var SalesHeader: Record "Sales Header")
    //     var
    //         SalesandReceiveSetup: Record "Sales & Receivables Setup";
    //         SalesLine: Record "Sales Line";
    //         SalesInvHeader: Record "Sales Invoice Header";
    //     begin
    //         SalesandReceiveSetup.Get();

    //         If SalesandReceiveSetup."Enable Today Posting" and (SalesHeader."Posting Date" <> Today) then
    //             Error('Posting Date must be today.');

    //         if SalesandReceiveSetup."Prevent Partial Sales Return" then
    //             if SalesHeader."Document Type" in [SalesHeader."Document Type"::"Credit Memo", SalesHeader."Document Type"::"Return Order"] then begin
    //                 SalesLine.Reset();
    //                 SalesLine.SetRange("Document No.", SalesHeader."No.");
    //                 SalesLine.SetFilter("Returned Document No.", '<>%1', '');
    //                 SalesHeader.CalcFields("Amount Including VAT");
    //                 if SalesLine.FindFirst() then begin
    //                     if SalesInvHeader.get(SalesLine."Returned Document No.") then
    //                         SalesInvHeader.CalcFields("Amount Including VAT");
    //                     if SalesInvHeader."Amount Including VAT" <> SalesHeader."Amount Including VAT" then
    //                         Error('You cannot partially return.');
    //                 end;
    //             end;
    //     end;

    //     local procedure GetInvoicePostingNo(SalesHeader: Record "Sales Header") PostingNo: Code[20]
    //     var
    //         ReservedSalesHeader: Record "Sales Header";
    //         ReservedSalesHeader2: Record "Sales Header";
    //     begin
    //         if SalesHeader."Posting No." <> '' then
    //             exit(CheckDateOrder(SalesHeader));

    //         PostingNo := '';
    //         ReservedSalesHeader.Reset();
    //         ReservedSalesHeader.SetCurrentKey("Posting No.");
    //         if (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) or (SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice) then
    //             ReservedSalesHeader.SetFilter("Document Type", '%1|%2', SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice)
    //         else
    //             if (SalesHeader."Document Type" = SalesHeader."Document Type"::"Return Order") or (SalesHeader."Document Type" = SalesHeader."Document Type"::"Credit Memo") then
    //                 ReservedSalesHeader.SetFilter("Document Type", '%1|%2', SalesHeader."Document Type"::"Return Order", SalesHeader."Document Type"::"Credit Memo")
    //             else
    //                 exit;

    //         ReservedSalesHeader.SetRange("Posting No. Series", SalesHeader."Posting No. Series");
    //         ReservedSalesHeader.SetFilter("No.", '<>%1', SalesHeader."No.");
    //         ReservedSalesHeader.SetFilter("Posting No.", '<>%1', '');
    //         if ReservedSalesHeader.FindFirst() then
    //             repeat
    //                 PostingNo := GetPostingNo(ReservedSalesHeader, SalesHeader);
    //                 if PostingNo <> '' then begin
    //                     ReservedSalesHeader2 := ReservedSalesHeader;
    //                     ReservedSalesHeader2."Posting No." := '';
    //                     ReservedSalesHeader2."Shipping No." := '';
    //                     ReservedSalesHeader2.Modify();
    //                     exit(PostingNo);
    //                 end;
    //             until ReservedSalesHeader.Next() = 0;

    //         exit(PostingNo);
    //     end;

    //     local procedure CheckDateOrder(SalesHeader: Record "Sales Header"): Code[20]
    //     var
    //         NoSeriesLine: Record "No. Series Line";
    //         NoSeries2: Record "No. Series";
    //         StartFiscalDate: Date;
    //         EndFiscalDate: Date;
    //     begin
    //         GetFiscalYearDate(StartFiscalDate, EndFiscalDate);

    //         NoSeriesLine.Reset();
    //         NoSeriesLine.SetCurrentKey("Series Code", "Starting Date", "Starting No.");
    //         NoSeriesLine.SetRange("Series Code", SalesHeader."Posting No. Series");
    //         NoSeriesLine.SetFilter("Starting No.", '<=%1', SalesHeader."Posting No.");
    //         if NoSeriesLine.FindLast() then begin
    //             if (SalesHeader."Posting Date" in [StartFiscalDate .. EndFiscalDate]) then begin
    //                 NoSeries2.Get(NoSeriesLine."Series Code");
    //                 if NoSeries2."Date Order" and (SalesHeader."Posting Date" < NoSeriesLine."Last Date Used") then
    //                     Error(DateOrderErr, NoSeries2.Code, NoSeriesLine."Last Date Used");

    //                 exit(SalesHeader."Posting No.");
    //             end;

    //             exit('');
    //         end;
    //     end;

    //     local procedure GetServInvoicePostingNo(SalesHeader: Record "Sales Header") PostingNo: Code[20]
    //     var
    //         ReservedServiceHeader: Record "Service Header";
    //         ReservedServiceHeader2: Record "Service Header";
    //     begin
    //         PostingNo := '';

    //         ReservedServiceHeader.Reset();
    //         ReservedServiceHeader.SetCurrentKey("Posting No.");
    //         if (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) or (SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice) then
    //             ReservedServiceHeader.SetFilter("Document Type", '%1|%2', ReservedServiceHeader."Document Type"::Order, ReservedServiceHeader."Document Type"::Invoice)
    //         else
    //             if (SalesHeader."Document Type" = SalesHeader."Document Type"::"Credit Memo") then
    //                 ReservedServiceHeader.SetFilter("Document Type", '%1', ReservedServiceHeader."Document Type"::"Credit Memo")
    //             else
    //                 exit;

    //         ReservedServiceHeader.SetRange("Posting No. Series", SalesHeader."Posting No. Series");
    //         ReservedServiceHeader.SetFilter("No.", '<>%1', SalesHeader."No.");
    //         ReservedServiceHeader.SetFilter("Posting No.", '<>%1', '');
    //         if ReservedServiceHeader.FindFirst() then
    //             repeat
    //                 PostingNo := GetServPostingNo(ReservedServiceHeader, SalesHeader);
    //                 if PostingNo <> '' then begin
    //                     ReservedServiceHeader2 := ReservedServiceHeader;
    //                     ReservedServiceHeader2."Posting No." := '';
    //                     ReservedServiceHeader2.Modify();

    //                     exit(PostingNo);
    //                 end;
    //             until ReservedServiceHeader.Next() = 0;

    //         exit(PostingNo);
    //     end;

    //     local procedure GetPostingNo(var SalesHeader1: Record "Sales Header"; SalesHeader2: Record "Sales Header"): Code[20]
    //     var
    //         NoSeriesLine: Record "No. Series Line";
    //         NoSeries2: Record "No. Series";
    //         StartFiscalDate: Date;
    //         EndFiscalDate: Date;
    //     begin
    //         GetFiscalYearDate(StartFiscalDate, EndFiscalDate);

    //         NoSeriesLine.Reset();
    //         NoSeriesLine.SetCurrentKey("Series Code", "Starting Date", "Starting No.");
    //         NoSeriesLine.SetRange("Series Code", SalesHeader1."Posting No. Series");
    //         NoSeriesLine.SetFilter("Starting No.", '<=%1', SalesHeader1."Posting No.");
    //         if NoSeriesLine.FindLast() then begin
    //             if SalesHeader2."Posting Date" in [StartFiscalDate .. EndFiscalDate] then begin
    //                 NoSeries2.Get(NoSeriesLine."Series Code");
    //                 if NoSeries2."Date Order" and (SalesHeader2."Posting Date" < NoSeriesLine."Last Date Used") then    //ZM Agile Aug 8, 2017
    //                     Error(DateOrderErr, NoSeries2.Code, NoSeriesLine."Last Date Used");

    //                 exit(SalesHeader1."Posting No.");
    //             end else
    //                 exit('')
    //         end else //for those cases where SalesheaderPostingNo is blank
    //             exit('');
    //     end;

    //     local procedure GetServPostingNo(ServiceHeader: Record "Service Header"; SalesHeader2: Record "Sales Header"): Code[20]
    //     var
    //         NoSeriesLine: Record "No. Series Line";
    //         NoSeries2: Record "No. Series";
    //         StartFiscalDate: Date;
    //         EndFiscalDate: Date;
    //     begin
    //         GetFiscalYearDate(StartFiscalDate, EndFiscalDate);

    //         NoSeriesLine.Reset();
    //         NoSeriesLine.SetCurrentKey("Series Code", "Starting Date", "Starting No.");
    //         NoSeriesLine.SetRange("Series Code", ServiceHeader."Posting No. Series");
    //         NoSeriesLine.SetFilter("Starting No.", '<=%1', ServiceHeader."Posting No.");
    //         if NoSeriesLine.FindLast() then begin
    //             if SalesHeader2."Posting Date" in [StartFiscalDate .. EndFiscalDate] then begin
    //                 NoSeries2.Get(NoSeriesLine."Series Code");
    //                 if NoSeries2."Date Order" and (SalesHeader2."Posting Date" < NoSeriesLine."Last Date Used") then
    //                     Error(DateOrderErr, NoSeries2.Code, NoSeriesLine."Last Date Used");

    //                 exit(ServiceHeader."Posting No.");
    //             end;

    //             exit('');
    //         end;
    //     end;

    //     local procedure GetFiscalYearDate(var StartDate: Date; var EndDate: Date)
    //     var
    //         EnglishNepaliDateNep2: Record "English-Nepali Date NEP";
    //     begin
    //         EnglishNepaliDateNep2.Reset();
    //         EnglishNepaliDateNep2.SetFilter(EnglishNepaliDateNep2."English Date", '<=%1', Today);
    //         EnglishNepaliDateNep2.SetRange(EnglishNepaliDateNep2."Opening Fiscal Year", true);
    //         EnglishNepaliDateNep2.FindFirst();
    //         StartDate := EnglishNepaliDateNep2."English Date";

    //         EnglishNepaliDateNep2.SetFilter("English Date", '>%1', Today);
    //         EnglishNepaliDateNep2.FindFirst();
    //         EndDate := EnglishNepaliDateNep2."English Date" - 1;
    //     end;

    //     local procedure SendmailApp(docNo: Code[20]; Temp: Code[20]; batch: Code[20])
    //     var
    //         GenJournalLine: Record "Gen. Journal Line";
    //         ApprovalUserSetup: Record "User Setup";
    //         ApprovalEntry: Record "Approval Entry";
    //         GenJournalTemplate: Record "Gen. Journal Template";
    //         EmailMessage: Codeunit "Email Message";
    //         Email: Codeunit Email;
    //         mailID: Text;
    //         EmailSubjet: Text;
    //         EmailTextBody: Text;
    //         body: Text;
    //         Header: Text;
    //         footer: Text;
    //         body1: Text;
    //         body2: Text;
    //         body3: Text;
    //         body4: Text;
    //         postingDate: Date;
    //         url: Text;
    //         url2: Text;
    //     begin
    //         GenJournalLine.Reset();
    //         GenJournalLine.SetRange("Document No.", docNo);
    //         if GenJournalLine.FindFirst() then begin
    //             Temp := GenJournalLine."Journal Template Name";
    //             postingDate := GenJournalLine."Posting Date";

    //             Clear(EmailMessage);
    //             Clear(Email);
    //             Clear(EmailSubjet);
    //             Clear(EmailTextBody);
    //             Clear(mailID);

    //             ApprovalEntry.Reset();
    //             ApprovalEntry.SetRange("Document No.", docNo);
    //             ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
    //             if ApprovalEntry.FindFirst() then begin
    //                 ApprovalUserSetup.Reset();
    //                 ApprovalUserSetup.Get(ApprovalEntry."Approver ID");
    //                 mailID := ApprovalUserSetup."E-Mail";
    //                 EmailSubjet := 'Journal Request';
    //                 Header := 'Dear Sir/madam,<br>' + '<br>';
    //                 body := 'Please approve following voucher. <br>';
    //                 body1 := StrSubstNo(MailBody1Txt, Temp);
    //                 body2 := StrSubstNo(MailBody2Txt, docNo);
    //                 body3 := StrSubstNo(MailBody3Txt, postingDate);
    //                 body4 := StrSubstNo(MailBody4Txt, voucherAmt(Temp, batch, ApprovalEntry."Document No."));
    //                 footer := StrSubstNo(MailBody5Txt, ApprovalEntry."Sender ID");
    //                 case GenJournalTemplate.Type of
    //                     GenJournalTemplate.Type::General:
    //                         url := GetUrlLink(Page::"General Journal", true);
    //                     GenJournalTemplate.Type::Payments:
    //                         url := GetUrlLink(Page::"Payment Journal", true);
    //                     GenJournalTemplate.Type::"Cash Receipts":
    //                         url := GetUrlLink(Page::"Cash Receipt Journal", true);
    //                 end;

    //                 url2 := '<a target="_blank" href=' + '"' + url + '"' + '>' + 'Approval Page' + '</a>';
    //                 EmailTextBody := Header + '<br>' + body + '<br>' + body1 + body2 + body3 + body4 + '<br>' + '<br>' + footer
    //                     + '<br>' + '<br>' + '<br>' + url2;
    //                 EmailMessage.Create(mailID, EmailSubjet, EmailTextBody, true);
    //                 Email.Send(EmailMessage);
    //             end;
    //         end;
    //     end;

    //     local procedure FinalAppMail(docNo: Code[20]; Temp: Code[20]; batch: Code[20])
    //     var
    //         GenJournalLine: Record "Gen. Journal Line";
    //         ApprovalUserSetup: Record "User Setup";
    //         ApprovalEntry: Record "Approval Entry";
    //         GenJournalTemplate: Record "Gen. Journal Template";
    //         EmailMessage: Codeunit "Email Message";
    //         Email: Codeunit Email;
    //         mailID: Text;
    //         EmailSubjet: Text;
    //         EmailTextBody: Text;
    //         body: Text;
    //         Header: Text;
    //         footer: Text;
    //         body1: Text;
    //         body2: Text;
    //         body3: Text;
    //         body4: Text;
    //         postingDate: Date;
    //         url: Text;
    //         url2: Text;
    //     begin
    //         GenJournalLine.Reset();
    //         GenJournalLine.SetRange("Document No.", docNo);
    //         if GenJournalLine.FindFirst() then begin
    //             Temp := GenJournalLine."Journal Template Name";
    //             postingDate := GenJournalLine."Posting Date";

    //             Clear(EmailMessage);
    //             Clear(Email);
    //             Clear(EmailSubjet);
    //             Clear(EmailTextBody);

    //             ApprovalEntry.Reset();
    //             ApprovalEntry.SetRange("Document No.", docNo);
    //             ApprovalEntry.SetRange("Journal Template Name", Temp);
    //             ApprovalEntry.SetRange("Journal Batch Name", batch);
    //             if ApprovalEntry.FindFirst() then begin
    //                 ApprovalUserSetup.Get(ApprovalEntry."Sender ID");
    //                 mailID := ApprovalUserSetup."E-Mail";
    //                 EmailSubjet := 'Journal Request';
    //                 Header := 'Dear Sir/Madam,<br>' + '<br>';
    //                 body := 'Your Voucher have been approved. <br>';
    //                 body1 := StrSubstNo(MailBody1Txt, Temp);
    //                 body2 := StrSubstNo(MailBody2Txt, docNo);
    //                 body3 := StrSubstNo(MailBody3Txt, postingDate);

    //                 case GenJournalTemplate.Type of
    //                     GenJournalTemplate.Type::General:
    //                         url := GetUrlLink(Page::"General Journal", false);
    //                     GenJournalTemplate.Type::Payments:
    //                         url := GetUrlLink(Page::"Payment Journal", false);
    //                     GenJournalTemplate.Type::"Cash Receipts":
    //                         url := GetUrlLink(Page::"Cash Receipt Journal", false);
    //                 end;

    //                 body4 := StrSubstNo(MailBody6Lbl, voucherAmt(Temp, batch, ApprovalEntry."Document No."));
    //                 footer := StrSubstNo(MailBody5Txt, ApprovalEntry."Approver ID");
    //                 url2 := '<a target="_blank" href=' + '"' + url + '"' + '>' + Format(GenJournalTemplate.Type) + ' Journal' + '</a>';
    //                 EmailTextBody := Header + '<br>' + body + '<br>' + body1 + body2 + body3 + body4 + '<br>' + '<br>' + footer
    //                     + '<br>' + '<br>' + '<br>' + url2;

    //                 EmailMessage.Create(mailID, EmailSubjet, EmailTextBody, true);
    //                 Email.Send(EmailMessage);
    //             end;
    //         end;
    //     end;

    //     local procedure voucherAmt(TemplateCode: Code[20]; batchCode: Code[20]; docNo: Code[20]): Decimal
    //     var
    //         GenJournalLine2: Record "Gen. Journal Line";
    //         amount: Decimal;
    //     begin
    //         amount := 0;
    //         GenJournalLine2.Reset();
    //         GenJournalLine2.SetRange("Journal Template Name", TemplateCode);
    //         GenJournalLine2.SetRange("Journal Batch Name", batchCode);
    //         GenJournalLine2.SetRange("Document No.", docNo);
    //         if GenJournalLine2.FindFirst() then
    //             repeat
    //                 amount += GenJournalLine2."Debit Amount";
    //             until GenJournalLine2.Next() = 0;
    //         exit(amount);
    //         //GenJnlLine2.CalcSums("Debit Amount");
    //         //exit(GenJnlLine2."Debit Amount");
    //     end;


    //     [IntegrationEvent(false, false)]
    //     local procedure OnBeforeGetUserLocation(var isHandled: Boolean)
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnBeforePrintVoucher(DocumentNo: Code[20]; PostingDate: Date; var Ishandled: Boolean)
    //     begin
    //     end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetUserRespCenter(var isHandled: Boolean)
    begin
    end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnBeforeGetNoSeriesFromRespCenter(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; var isHandled: Boolean)
    //     begin
    //     end;

    //     [EventSubscriber(ObjectType::Table, Database::"Finance Charge Memo Line", 'OnValidateNoOnAfterAssignGLAccountValues', '', false, false)]
    //     local procedure OnValidateNoOnAfterAssignGLAccountValues(var FinanceChargeMemoLine: Record "Finance Charge Memo Line"; FinanceChargeMemoHeader: Record "Finance Charge Memo Header"; GLAccount: Record "G/L Account")
    //     var
    //         Vatpost: Record "VAT Posting Setup";
    //     begin
    //         Vatpost.Get(FinanceChargeMemoHeader."VAT Bus. Posting Group", FinanceChargeMemoLine."VAT Prod. Posting Group");
    //         FinanceChargeMemoLine."Localized VAT Identifier" := Vatpost."Localized VAT Identifier";
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnPostSalesLineOnAfterTestSalesLine', '', false, false)]
    //     local procedure "Sales-Post_OnPostSalesLineOnAfterTestSalesLine"(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var WhseShptHeader: Record "Warehouse Shipment Header"; WhseShip: Boolean; PreviewMode: Boolean)
    //     var
    //         Item: Record Item;
    //         InvPostGroup: Record "Inventory Posting Group";
    //     begin
    //         if SalesLine.Type = SalesLine.Type::Item then begin
    //             Item.Get(SalesLine."No.");
    //             InvPostGroup.get(Item."Inventory Posting Group");
    //             if InvPostGroup."HS Code Mandatory-NEP" then
    //                 if SalesLine."HS Code-NEP" = '' then
    //                     Error('Hs Code is empty for Item %1', Item."No.");
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnAfterInsertToSalesLine', '', false, false)]
    //     local procedure OnAfterInsertToSalesLine(var ToSalesLine: Record "Sales Line"; FromSalesLine: Record "Sales Line"; RecalculateLines: Boolean; DocLineNo: Integer; FromSalesDocType: Enum "Sales Document Type From"; FromSalesHeader: Record "Sales Header"; var NextLineNo: Integer)
    //     var
    //         Item: record item;
    //     begin
    //         if FromSalesLine.Type = FromSalesLine.Type::Item then begin
    //             Item.Get(FromSalesLine."No.");
    //             if ToSalesLine."HS Code-NEP" = '' then
    //                 ToSalesLine."HS Code-NEP" := Item."Tariff No.";
    //         end;
    //     end;

    //     procedure Compare(CompareCode: Text[20]; Format: Text[20]): Boolean
    //     var
    //         i: Integer;
    //         Cf: Text[1];
    //         Ce: Text[1];
    //         Check: Boolean;
    //         Text005: Label 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    //     begin
    //         Check := true;
    //         if StrLen(CompareCode) = StrLen(Format) then
    //             for i := 1 to StrLen(CompareCode) do begin
    //                 Cf := CopyStr(Format, i, 1);
    //                 Ce := CopyStr(CompareCode, i, 1);
    //                 case Cf of
    //                     '#':
    //                         if not ((Ce >= '0') and (Ce <= '9')) then
    //                             Check := false;
    //                     '@':
    //                         if StrPos(Text005, UpperCase(Ce)) = 0 then
    //                             Check := false;
    //                     else
    //                         if not ((Cf = Ce) or (Cf = '?')) then
    //                             Check := false
    //                 end;
    //             end
    //         else
    //             Check := false;
    //         exit(Check);
    //     end;

}