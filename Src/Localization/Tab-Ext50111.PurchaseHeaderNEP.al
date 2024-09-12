tableextension 50111 "Purchase Header NEP" extends "Purchase Header"
{
    fields
    {
        field(90100; "Total TDS Amount"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line"."TDS Amount" where("Document No." = field("No."), "Document Type" = field("Document Type"), "TDS Reference Line No." = const(0)));
        }
        field(90001; "PI Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'PI Date';
        }
        field(90094; PragyapanPatra; Code[100])
        {
            Caption = 'PragyapanPatra';
            DataClassification = CustomerContent;
            TableRelation = if ("Document Type" = const(Order)) "PragyapanPatra NEP" where("Purchase Consignment No." = field("Purchase Consignment No."))
            // "Vendor No." = field("Pay-to Vendor No."))
            else
            if ("Document Type" = const("Return Order")) "PragyapanPatra NEP" where("Purchase Consignment No." = field("Purchase Consignment No."))
            // "Vendor No." = field("Pay-to Vendor No."))
            else
            "PragyapanPatra NEP" where("Purchase Consignment No." = field("Purchase Consignment No."));

            trigger OnValidate()
            var
                PurchaseLine: Record "Purchase Line";
            begin
                PurchaseLine.Reset();
                PurchaseLine.SetRange("Document No.", "No.");
                PurchaseLine.ModifyAll(PragyapanPatra, PragyapanPatra);
            end;
        }
        field(90095; "Purchase Consignment No."; Code[20])
        {
            Caption = 'Purchase Consignment No.';
            DataClassification = CustomerContent;
            TableRelation = "Purchase Consignment NEP";

            trigger OnValidate()
            var
                PurchaseLine: Record "Purchase Line";
                PurchaseConsignment: Record "Purchase Consignment NEP";
            begin
                if "Purchase Consignment No." <> '' then begin
                    PurchaseConsignment.Get("Purchase Consignment No.");
                    PragyapanPatra := PurchaseConsignment.PragyapanPatra;
                    PurchaseLine.Reset();
                    PurchaseLine.SetRange("Document No.", "No.");
                    if PurchaseLine.FindFirst() then
                        repeat
                            PurchaseLine."Purchase Consignment No." := "Purchase Consignment No.";
                            PurchaseLine.PragyapanPatra := PragyapanPatra;
                            PurchaseLine.Modify();
                        until PurchaseLine.Next() = 0;
                end else begin
                    PragyapanPatra := '';
                    PurchaseLine.Reset();
                    PurchaseLine.SetRange("Document No.", "No.");
                    if PurchaseLine.FindFirst() then
                        repeat
                            PurchaseLine."Purchase Consignment No." := '';
                            PurchaseLine.PragyapanPatra := '';
                            PurchaseLine.Modify();
                        until PurchaseLine.Next() = 0;
                end;
            end;
        }
        field(90096; "LC No."; Code[20])
        {
            caption = 'LC No.';
            DataClassification = CustomerContent;
            TableRelation = "LC Details NEP" where(Released = const(true), "Issued To/Received From" = field("Buy-from Vendor No."), Closed = const(false));

            trigger OnValidate()
            var
                PurchLine: Record "Purchase Line";
            begin
                if "LC No." <> '' then begin
                    PurchLine.Reset();
                    PurchLine.SetRange("Document No.", "No.");
                    if PurchLine.FindSet() then
                        repeat
                            PurchLine."LC No." := "LC No.";
                            PurchLine.Modify();
                        until PurchLine.Next() = 0;
                end else begin
                    PurchLine."LC No." := '';
                    purchline.Modify();
                end;
            end;
        }
        field(90005; "Proforma Invoice No."; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(90006; "Proforma Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        //purch req start;
        field(90007; "Is Requisition Order"; Boolean)
        {
            Caption = 'Is Requisition Order';
            DataClassification = CustomerContent;
        }
        field(90008; "Purchase Requisition Sent"; Boolean)
        {
            Caption = 'Purchase Requisition Sent';
            DataClassification = CustomerContent;
        }
        field(90009; "Purch. Order Created"; Boolean)
        {
            Caption = 'Purch. Order Created';
            DataClassification = CustomerContent;
        }
        field(90010; "Created Purch. Order No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Created Purch. Order No.';
        }
        field(90011; "Demanded By"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90012; "Demanded Date"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Demanded Date" := Today;
            end;
        }
        field(90013; "Remarks"; text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(90044; "Requisition No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        //purch req end;
        field(90045; "Narration"; text[250])
        {
            DataClassification = CustomerContent;
        }
        field(90016; "Memo Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","Insurance Memo","Custom Clearance Memo","Registration Memo";
        }
        field(90055; "Nepali Date"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "English-Nepali Date NEP"."Nepali Date";

            trigger OnValidate()
            var
                EnglishNepaliDate: Record "English-Nepali Date NEP";
            begin
                if "Nepali Date" <> '' then
                    Rec.Validate("Posting Date", EnglishNepaliDate.getEngDate("Nepali Date"))
                else
                    Rec.Validate("Posting Date", 0D);
            end;
        }
        field(90018; "Purchaser Code1"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser".Code where(Type = filter(Purchaser));
            Caption = 'Purchaser Code';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec.Validate("Purchaser Code", "Purchaser Code1");
            end;
        }
        field(90085; "Return Reason Code"; Code[10])
        {
            TableRelation = "Return Reason";
            DataClassification = CustomerContent;
        }
        field(90097; "Bank LC No."; Code[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("LC Details NEP"."LC\DO No." where("No." = field("LC No.")));
        }
        modify("Posting Date")
        {
            trigger OnAfterValidate()
            var
                EnglishNepaliDate: Record "English-Nepali Date NEP";
            begin
                if "Posting Date" <> 0D then
                    "Nepali Date" := EnglishNepaliDate.getNepaliDate("Posting Date")
                else
                    "Nepali Date" := '';
            end;
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                if "No." <> xRec."No." then begin
                    PurchSetup.Get();
                    if NoSeriesFromRespCenter.GetNoSeriesFromRespCenter() then begin
                        NoSeriesRespCenter := SysMgt.GetUserRespCenter();
                        NoSeriesMgt.TestManual(GetNoSeriesCodeUsingRespCenter());
                        // end else
                        //     NoSeriesMgt.TestManual(GetNoSeriesCode());
                    end;
                    "No. Series" := '';
                end;
            end;
        }
        modify("Buy-from Vendor No.")
        {
            trigger OnBeforeValidate()
            begin
                LocationCode := "Location Code";
                ResponsibilityCenterCode := SysMgt.GetUserRespCenter();
                GlobalDim1Code := "Shortcut Dimension 1 Code";
                GlobalDim2Code := "Shortcut Dimension 2 Code";
            end;

            trigger OnAfterValidate()
            var
                Vendor: Record Vendor;
            begin
                Vendor.Reset();
                Vendor.SetRange("No.", Rec."Sell-to Customer No.");
                if Vendor.FindFirst() then
                    Rec.Validate("Purchaser Code1", Vendor."Purchaser Code1");

                if "Responsibility Center" = '' then
                    Validate("Responsibility Center", SysMgt.GetUserRespCenter());
                if "Location Code" = '' then
                    Validate("Location Code", LocationCode);
                if "Shortcut Dimension 1 Code" = '' then
                    Validate("Shortcut Dimension 1 Code", GlobalDim1Code);
                if "Shortcut Dimension 2 Code" = '' then
                    Validate("Shortcut Dimension 2 Code", GlobalDim2Code);
            end;
        }
    }

    // trigger OnBeforeInsert()
    // begin
    //     if NoSeriesFromRespCenter.GetNoSeriesFromRespCenter() then
    //         InitInsertUsingRespCenter()
    //     else
    //         InitInsert();
    // end;

    // trigger OnInsert()
    // begin
    //     "Assigned User ID" := CopyStr(UserId(), 1, 50);
    // end;

    // trigger OnAfterInsert()
    // begin
    //     //ratan for temp need to rectify code later
    //     if NoSeriesFromRespCenter.GetNoSeriesFromRespCenter() then begin
    //         Validate("Responsibility Center", SysMgt.GetUserRespCenter());

    //         InitRecordUsingRespCenter();
    //         "Assigned User ID" := CopyStr(UserId(), 1, 50);
    //         Validate("Posting Date");
    //     end;
    // end;

    trigger OnDelete()
    var
    begin
        TestField("Posting No.", '');
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        GLSetup: Record "General Ledger Setup";
        InvtSetup: Record "Inventory Setup";
        NoSeriesFromRespCenter: Codeunit "System Managements NEP";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SysMgt: Codeunit "System Managements NEP";
        NoSeriesRespCenter: Code[20];
        DocumentProfile: Option Purchase,Sales,Transfer,Service;
        DocumentType: Option Quote,"Blanket Order","Order","Return Order",Invoice,"Posted Invoice","Credit Memo","Posted Credit Memo","Posted Shipment","Posted Receipt","Posted Prepmt. Inv.","Posted Prepmt. Cr. Memo","Posted Return Receipt","Posted Return Shipment",Booking,"Posted Order","Posted Debit Note",Requisition,Services,"Posted Credit Note";
        LocationCode: Code[20];
        GlobalDim1Code: Code[20];
        GlobalDim2Code: Code[20];
        ResponsibilityCenterCode: Code[20];

    procedure CalculateTDS(Currency: Record Currency)
    var
        purchaseLine: Record "Purchase Line";
    begin
        Currency.InitRoundingPrecision();

        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document Type", "Document Type");
        PurchaseLine.SetRange("Document No.", "No.");
        PurchaseLine.SetFilter("TDS Group", '<>%1', '');
        if PurchaseLine.FindFirst() then
            repeat
                if "Prices Including VAT" then
                    PurchaseLine."TDS Base Amount" := (PurchaseLine."Direct Unit Cost" - (PurchaseLine."Direct Unit Cost" * PurchaseLine."VAT %" / 100)) * PurchaseLine."Qty. to Invoice"
                else
                    PurchaseLine."TDS Base Amount" := PurchaseLine."Direct Unit Cost" * PurchaseLine."Qty. to Invoice";

                PurchaseLine."TDS Amount" := Round(PurchaseLine."TDS Base Amount" * PurchaseLine."TDS %" / 100, Currency."Amount Rounding Precision", Currency.VATRoundingDirection());
                PurchaseLine."TDS Type" := PurchaseLine."TDS Type"::"Purchase TDS";
                PurchaseLine.Modify();
            until PurchaseLine.Next() = 0;
    end;

    local procedure SkipInitialization(): Boolean
    begin
        IF "No." = '' THEN
            EXIT(FALSE);

        IF "Buy-from Vendor No." = '' THEN
            EXIT(FALSE);

        IF xRec."Document Type" <> "Document Type" THEN
            EXIT(FALSE);

        IF GETFILTER("Buy-from Vendor No.") <> '' THEN
            IF GETRANGEMIN("Buy-from Vendor No.") = GETRANGEMAX("Buy-from Vendor No.") THEN
                IF "Buy-from Vendor No." = GETRANGEMIN("Buy-from Vendor No.") THEN
                    EXIT(FALSE);

        EXIT(TRUE);
    end;

    procedure InitInsertUsingRespCenter()
    begin
        NoSeriesRespCenter := NoSeriesFromRespCenter.GetUserRespCenter();
        Validate("Responsibility Center", SysMgt.GetUserRespCenter());
        if "No." = '' then begin
            TestNoSeriesUsingRespCenter();
            NoSeriesMgt.InitSeries(GetNoSeriesCodeUsingRespCenter(), xRec."No. Series", "Posting Date", "No.", "No. Series");
        end;

    end;

    procedure TestMemoNoSeriesUsingRespCenter(): Boolean
    begin
        PurchSetup.Get();
        case "Document Type" of
            "Document Type"::"Blanket Order":
                NoSeriesFromRespCenter.TestMemoNoSeriesFromRespCenter(DocumentProfile::Purchase, DocumentType::"Blanket Order", NoSeriesRespCenter, "Memo Type");
        end;
    end;

    // procedure GetNoSeriesCodeUsingRespCenter(): Code[10]
    procedure GetNoSeriesCodeUsingRespCenter(): Code[20]
    var
        RespCenter: Record "Responsibility Center";
    begin
        if "Is Requisition Order" then begin
            RespCenter.Get(NoSeriesFromRespCenter.GetUserRespCenter());
            exit(RespCenter."Requisition Order Nos");
        end else
            case "Document Type" of
                "Document Type"::Quote:
                    exit(NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::Quote, NoSeriesRespCenter));
                "Document Type"::Order:
                    exit(NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::Order, NoSeriesRespCenter));
                "Document Type"::Invoice:
                    exit(NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::Invoice, NoSeriesRespCenter));
                "Document Type"::"Return Order":
                    exit(NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::"Return Order", NoSeriesRespCenter));
                "Document Type"::"Credit Memo":
                    exit(NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::"Credit Memo", NoSeriesRespCenter));
            end;
    end;

    local procedure addDocType(): Code[20]
    var
        NoSeriesCode: Code[20];
    begin
        case "Document Type" of
            "Document Type"::Requisition:
                NoSeriesCode := PurchSetup."Purchase Requisition Nos.";
        end;

    end;

    procedure InitRecordUsingRespCenter()
    begin
        PurchSetup.Get();

        case "Document Type" of
            "Document Type"::Quote, "Document Type"::Order:
                begin
                    NoSeriesMgt.SetDefaultSeries("Posting No. Series",
                                                  NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::"Posted Invoice", NoSeriesRespCenter));
                    NoSeriesMgt.SetDefaultSeries("Receiving No. Series",
                    NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::"Posted Receipt", NoSeriesRespCenter));

                    if "Document Type" = "Document Type"::Order then begin
                        NoSeriesMgt.SetDefaultSeries("Prepayment No. Series",
                                                      NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase,
                                                      DocumentType::"Posted Prepmt. Inv.", NoSeriesRespCenter));
                        NoSeriesMgt.SetDefaultSeries("Prepmt. Cr. Memo No. Series",
                                                      NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase,
                                                      DocumentType::"Posted Prepmt. Cr. Memo", NoSeriesRespCenter));
                    end;
                end;
            "Document Type"::Invoice:
                begin
                    if ("No. Series" <> '') and
                       (NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::Invoice, NoSeriesRespCenter) =
                       NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::"Posted Invoice", NoSeriesRespCenter))
                    then
                        "Posting No. Series" := "No. Series"
                    else
                        NoSeriesMgt.SetDefaultSeries("Posting No. Series",
                                                      NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::"Posted Invoice", NoSeriesRespCenter)
                );
                    if PurchSetup."Receipt on Invoice" then
                        NoSeriesMgt.SetDefaultSeries("Receiving No. Series",
                                                      NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::"Posted Receipt", NoSeriesRespCenter)
                );
                end;
            "Document Type"::"Return Order":
                begin
                    NoSeriesMgt.SetDefaultSeries("Posting No. Series",
                                                NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::"Posted Credit Memo", NoSeriesRespCenter)
              );
                    NoSeriesMgt.SetDefaultSeries("Return Shipment No. Series",
                                                NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase,
                                                DocumentType::"Posted Return Shipment", NoSeriesRespCenter));
                end;
            "Document Type"::"Credit Memo":
                begin
                    if ("No. Series" <> '') and
                       (NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::"Credit Memo", NoSeriesRespCenter) =
                       NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase, DocumentType::"Posted Credit Memo", NoSeriesRespCenter))
                    then
                        "Posting No. Series" := "No. Series"
                    else
                        NoSeriesMgt.SetDefaultSeries("Posting No. Series",
                                                      NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase,
                                                      DocumentType::"Posted Credit Memo", NoSeriesRespCenter));
                    if PurchSetup."Return Shipment on Credit Memo" then
                        NoSeriesMgt.SetDefaultSeries("Return Shipment No. Series",
                                                      NoSeriesFromRespCenter.GetRespCenterWiseNoSeries(DocumentProfile::Purchase,
                                                      DocumentType::"Posted Return Shipment", NoSeriesRespCenter));
                end;
        end;


        if "Document Type" in ["Document Type"::Order, "Document Type"::Invoice, "Document Type"::"Return Order"] then
            "Order Date" := WorkDate();

        if "Document Type" = "Document Type"::Invoice then
            "Expected Receipt Date" := WorkDate();

        if not ("Document Type" in ["Document Type"::"Blanket Order", "Document Type"::Quote]) and
           ("Posting Date" = 0D)
        then
            "Posting Date" := WorkDate();

        if PurchSetup."Default Posting Date" = PurchSetup."Default Posting Date"::"No Date" then
            "Posting Date" := 0D;

        "Document Date" := WorkDate();

        Validate("Sell-to Customer No.", '');

        if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then begin
            GLSetup.Get();
            Correction := GLSetup."Mark Cr. Memos as Corrections";
        end;

        "Posting Description" := Format("Document Type") + ' ' + "No.";

        if InvtSetup.Get() then
            "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
    end;

    local procedure TestNoSeriesUsingRespCenter(): Boolean
    var
        RespCenter: Record "Responsibility Center";
    begin
        PurchSetup.Get();

        if "Is Requisition Order" then begin
            RespCenter.Get(NoSeriesFromRespCenter.GetUserRespCenter());
            RespCenter.TestField("Requisition Order Nos");
        end else
            case "Document Type" of
                "Document Type"::Quote:
                    NoSeriesFromRespCenter.TestNoSeriesFromRespCenter(DocumentProfile::Purchase, DocumentType::Quote, NoSeriesRespCenter);
                "Document Type"::Order:
                    NoSeriesFromRespCenter.TestNoSeriesFromRespCenter(DocumentProfile::Purchase, DocumentType::Order, NoSeriesRespCenter);
                "Document Type"::Invoice:
                    begin
                        NoSeriesFromRespCenter.TestNoSeriesFromRespCenter(DocumentProfile::Purchase, DocumentType::Invoice, NoSeriesRespCenter);
                        NoSeriesFromRespCenter.TestNoSeriesFromRespCenter(DocumentProfile::Purchase, DocumentType::"Posted Invoice", NoSeriesRespCenter);
                    end;
                "Document Type"::"Return Order":
                    NoSeriesFromRespCenter.TestNoSeriesFromRespCenter(DocumentProfile::Purchase, DocumentType::"Return Order", NoSeriesRespCenter);
                "Document Type"::"Credit Memo":
                    begin
                        NoSeriesFromRespCenter.TestNoSeriesFromRespCenter(DocumentProfile::Purchase, DocumentType::"Credit Memo", NoSeriesRespCenter);
                        NoSeriesFromRespCenter.TestNoSeriesFromRespCenter(DocumentProfile::Purchase, DocumentType::"Posted Credit Memo", NoSeriesRespCenter);
                    end;
                "Document Type"::"Blanket Order":
                    TestMemoNoSeriesUsingRespCenter();
            end;
    end;
}