report 50105 "Requisition Form NEP"
{
    // version Shrey
    DefaultLayout = RDLC;
    // RDLCLayout = 'src/5.Report/RDLC Layouts/Requisition Form.rdl';
    RDLCLayout = 'Src/Localization/Rep50105.RequisitionFormNEP.rdl';
    Caption = 'Requisition Form';
    PreviewMode = PrintLayout;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = sorting("Document Type", "No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Requisition';

            column(Purchase_Header_Document_Type; "Document Type")
            {
            }
            column(TotAmt; TotAmt)
            {
            }
            column(Purchase_Header_No_; "No.")
            {
            }
            column(CompanyAddr_1_; CompanyAddr[1])
            {
            }
            column(LocationAddress; LocationRec.Address)
            {
            }
            column(RepCaption; RepCaptionLbl)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);

                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));

                    column(STRSUBSTNO_Text002_CopyText_; LocationRec."Address 2")
                    {
                    }
                    column(STRSUBSTNO_Text003_FORMAT_CurrReport_PAGENO__; '1')
                    {
                    }
                    column(Demanded_Date; Format("Purchase Header"."Posting Date"))
                    {
                    }
                    column(Purchase_Quote_No; "Purchase Header"."No.")
                    {
                    }
                    column(Purchase_Header___Shortcut_Dimension_1_Code_; "Purchase Header"."Shortcut Dimension 1 Code")
                    {
                    }
                    column(Purchase_Header___Shortcut_Dimension_2_Code_; "Purchase Header"."Shortcut Dimension 2 Code")
                    {
                    }
                    column(Purchase_Header___Shortcut_Dimension_3_Code_; "Purchase Header"."Shortcut Dimension 2 Code")
                    {
                    }
                    column(RequestedBy; DemandedByName)
                    {
                    }
                    column(RecommendationByName; RecommendationByName)
                    {
                    }
                    column(BudgetCheckedByName; BudgetCheckedByName)
                    {
                    }
                    column(ApprovedByName; ApprovedByName)
                    {
                    }
                    column(CompanyInfo_Picture; CompanyInformation.Picture)
                    {
                    }
                    column(Purchase_Header___Shipment_Method_Code_; "Purchase Header"."Shipment Method Code")
                    {
                    }
                    column(Purchase_Header___Rejected_By_; "Purchase Header"."No.")
                    {
                    }
                    column(PQ_No_Caption; PQ_No_CaptionLbl)
                    {
                    }
                    column(DateCaption; DateCaptionLbl)
                    {
                    }
                    column(ProjectCaption; ProjectCaptionLbl)
                    {
                    }
                    column(DonorCaption; DonorCaptionLbl)
                    {
                    }
                    column(DepartmentCaption; DepartmentCaptionLbl)
                    {
                    }
                    column(EmptyStringCaption; EmptyStringCaptionLbl)
                    {
                    }
                    column(EmptyStringCaption_Control1102159017; EmptyStringCaption_Control1102159017Lbl)
                    {
                    }
                    column(EmptyStringCaption_Control1102159018; EmptyStringCaption_Control1102159018Lbl)
                    {
                    }
                    column(EmptyStringCaption_Control1102159021; EmptyStringCaption_Control1102159021Lbl)
                    {
                    }
                    column(EmptyStringCaption_Control1102159022; EmptyStringCaption_Control1102159022Lbl)
                    {
                    }
                    column(Transport_DetailCaption; Transport_DetailCaptionLbl)
                    {
                    }
                    column(EmptyStringCaption_Control1000000045; EmptyStringCaption_Control1000000045Lbl)
                    {
                    }
                    column(LocationCaption; LocationCaptionLbl)
                    {
                    }
                    column(EmptyStringCaption_Control1000000053; EmptyStringCaption_Control1000000053Lbl)
                    {
                    }
                    column(NO_BUDGET_Caption; NO_BUDGET_CaptionLbl)
                    {
                    }
                    column(Purchase_Header___Rejected_By_Caption; Purchase_Header___Rejected_By_CaptionLbl)
                    {
                    }
                    column(EmptyStringCaption_Control1000000204; EmptyStringCaption_Control1000000204Lbl)
                    {
                    }
                    column(PageLoop_Number; Number)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));

                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop1_Number; DimensionLoop1.Number)
                        {
                        }
                        column(DimText_Control58; DimText)
                        {
                        }
                        column(Header_DimensionsCaption; Header_DimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        var
                            PurchLine: Record "Purchase Line";
                        begin
                            if Number = 1 then begin
                                if not DimensionSetEntry1.Find('-') then
                                    CurrReport.Break();
                            end else
                                if not Continue then
                                    CurrReport.Break();

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo(
                                      Txt9000Txt, DimensionSetEntry1."Dimension Code", DimensionSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        Txt9001Txt, DimText,
                                        DimensionSetEntry1."Dimension Code", DimensionSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until (DimensionSetEntry1.Next() = 0);

                            TotAmt := 0;

                            PurchLine.Reset();
                            PurchLine.SetRange("Document No.", "Purchase Header"."No.");
                            PurchLine.SetRange("Document Type", "Purchase Header"."Document Type");
                            if PurchLine.FindSet() then
                                repeat
                                    TotAmt += PurchLine."Amount Including VAT";
                                until PurchLine.Next() = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfoGlobal then
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Purchase Line"; "Purchase Line")
                    {
                        DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = sorting("Document Type", "Document No.", "Line No.");

                        trigger OnAfterGetRecord()
                        begin
                            TotalVat := TotalVat + "VAT Base Amount" * "VAT %" / 100;
                            TotalAmountExclVat := TotalAmountExclVat + "VAT Base Amount";
                            TotalAmountInclVat := TotalVat + TotalAmountExclVat;
                        end;

                        trigger OnPreDataItem()
                        begin
                            CurrReport.Break();
                        end;
                    }
                    dataitem(RoundLoop; "Integer")
                    {
                        DataItemTableView = sorting(Number);

                        column(Purchase_Line__Description; "Purchase Line".Description)
                        {
                        }
                        column(Purchase_Line__Description_Control46; "Purchase Line".Description)
                        {
                        }
                        column(Purchase_Line__Quantity; "Purchase Line".Quantity)
                        {
                        }
                        column(Purchase_Line___Unit_of_Measure_; "Purchase Line"."Unit of Measure")
                        {
                        }
                        column(Purchase_Line__Description_Control52; "Purchase Line".Description)
                        {
                        }
                        column(SNo__; "SNo.")
                        {
                        }
                        column(Purchase_Line___Unit_of_Measure__Control1102159014; "Purchase Line"."Unit of Measure")
                        {
                        }
                        column(Purchase_Line__Quantity_Control1102159019; "Purchase Line".Quantity)
                        {
                        }
                        column(Purchase_Line___Direct_Unit_Cost_; "Purchase Line"."Direct Unit Cost")
                        {
                        }
                        column(Purchase_Line__Amount; "Purchase Line".Amount)
                        {
                        }
                        column(Blank; Blank)
                        {
                        }
                        column(Blank_Control1000000193; Blank)
                        {
                        }
                        column(Blank_Control1000000194; Blank)
                        {
                        }
                        column(Blank_Control1000000195; Blank)
                        {
                        }
                        column(Blank_Control1000000196; Blank)
                        {
                        }
                        column(Blank_Control1000000197; Blank)
                        {
                        }
                        column(Blank_Control1000000174; Blank)
                        {
                        }
                        column(Blank_Control1000000180; Blank)
                        {
                        }
                        column(Blank_Control1000000181; Blank)
                        {
                        }
                        column(Blank_Control1000000182; Blank)
                        {
                        }
                        column(Blank_Control1000000183; Blank)
                        {
                        }
                        column(Blank_Control1000000184; Blank)
                        {
                        }
                        column(Blank_Control1000000161; Blank)
                        {
                        }
                        column(Blank_Control1000000167; Blank)
                        {
                        }
                        column(Blank_Control1000000168; Blank)
                        {
                        }
                        column(Blank_Control1000000169; Blank)
                        {
                        }
                        column(Blank_Control1000000170; Blank)
                        {
                        }
                        column(Blank_Control1000000171; Blank)
                        {
                        }
                        column(Blank_Control1000000148; Blank)
                        {
                        }
                        column(Blank_Control1000000154; Blank)
                        {
                        }
                        column(Blank_Control1000000155; Blank)
                        {
                        }
                        column(Blank_Control1000000156; Blank)
                        {
                        }
                        column(Blank_Control1000000157; Blank)
                        {
                        }
                        column(Blank_Control1000000158; Blank)
                        {
                        }
                        column(Blank_Control1000000134; Blank)
                        {
                        }
                        column(Blank_Control1000000141; Blank)
                        {
                        }
                        column(Blank_Control1000000142; Blank)
                        {
                        }
                        column(Blank_Control1000000143; Blank)
                        {
                        }
                        column(Blank_Control1000000144; Blank)
                        {
                        }
                        column(Blank_Control1000000145; Blank)
                        {
                        }
                        column(Blank_Control1000000016; Blank)
                        {
                        }
                        column(Blank_Control1000000058; Blank)
                        {
                        }
                        column(Blank_Control1000000059; Blank)
                        {
                        }
                        column(Blank_Control1000000060; Blank)
                        {
                        }
                        column(Blank_Control1000000061; Blank)
                        {
                        }
                        column(Blank_Control1000000062; Blank)
                        {
                        }
                        column(Blank_Control1102159112; Blank)
                        {
                        }
                        column(Blank_Control1102159118; Blank)
                        {
                        }
                        column(Blank_Control1102159119; Blank)
                        {
                        }
                        column(Blank_Control1102159120; Blank)
                        {
                        }
                        column(Blank_Control1102159121; Blank)
                        {
                        }
                        column(Blank_Control1102159122; Blank)
                        {
                        }
                        column(Blank_Control1102159125; Blank)
                        {
                        }
                        column(Blank_Control1102159131; Blank)
                        {
                        }
                        column(Blank_Control1102159132; Blank)
                        {
                        }
                        column(Blank_Control1102159133; Blank)
                        {
                        }
                        column(Blank_Control1102159134; Blank)
                        {
                        }
                        column(Blank_Control1102159135; Blank)
                        {
                        }
                        column(Blank_Control1102159138; Blank)
                        {
                        }
                        column(Blank_Control1102159144; Blank)
                        {
                        }
                        column(Blank_Control1102159145; Blank)
                        {
                        }
                        column(Blank_Control1102159146; Blank)
                        {
                        }
                        column(Blank_Control1102159147; Blank)
                        {
                        }
                        column(Blank_Control1102159148; Blank)
                        {
                        }
                        column(Blank_Control1102159151; Blank)
                        {
                        }
                        column(Blank_Control1102159157; Blank)
                        {
                        }
                        column(Blank_Control1102159158; Blank)
                        {
                        }
                        column(Blank_Control1102159159; Blank)
                        {
                        }
                        column(Blank_Control1102159160; Blank)
                        {
                        }
                        column(Blank_Control1102159161; Blank)
                        {
                        }
                        column(Blank_Control1102159164; Blank)
                        {
                        }
                        column(Blank_Control1102159170; Blank)
                        {
                        }
                        column(Blank_Control1102159171; Blank)
                        {
                        }
                        column(Blank_Control1102159172; Blank)
                        {
                        }
                        column(Blank_Control1102159173; Blank)
                        {
                        }
                        column(Blank_Control1102159174; Blank)
                        {
                        }
                        column(Blank_Control1102159177; Blank)
                        {
                        }
                        column(Blank_Control1102159183; Blank)
                        {
                        }
                        column(Blank_Control1102159184; Blank)
                        {
                        }
                        column(Blank_Control1102159185; Blank)
                        {
                        }
                        column(Blank_Control1102159186; Blank)
                        {
                        }
                        column(Blank_Control1102159187; Blank)
                        {
                        }
                        column(Blank_Control1000000000; Blank)
                        {
                        }
                        column(Blank_Control1000000007; Blank)
                        {
                        }
                        column(Blank_Control1000000009; Blank)
                        {
                        }
                        column(Blank_Control1000000010; Blank)
                        {
                        }
                        column(Blank_Control1000000017; Blank)
                        {
                        }
                        column(Blank_Control1000000018; Blank)
                        {
                        }
                        column(Blank_Control1000000021; Blank)
                        {
                        }
                        column(Blank_Control1000000029; Blank)
                        {
                        }
                        column(Blank_Control1000000030; Blank)
                        {
                        }
                        column(Blank_Control1000000031; Blank)
                        {
                        }
                        column(Blank_Control1000000032; Blank)
                        {
                        }
                        column(Blank_Control1000000034; Blank)
                        {
                        }
                        column(Blank_Control1000000037; Blank)
                        {
                        }
                        column(Blank_Control1000000065; Blank)
                        {
                        }
                        column(Blank_Control1000000066; Blank)
                        {
                        }
                        column(Blank_Control1000000067; Blank)
                        {
                        }
                        column(Blank_Control1000000068; Blank)
                        {
                        }
                        column(Blank_Control1000000069; Blank)
                        {
                        }
                        column(Blank_Control1000000072; Blank)
                        {
                        }
                        column(Blank_Control1000000078; Blank)
                        {
                        }
                        column(Blank_Control1000000079; Blank)
                        {
                        }
                        column(Blank_Control1000000080; Blank)
                        {
                        }
                        column(Blank_Control1000000081; Blank)
                        {
                        }
                        column(Blank_Control1000000082; Blank)
                        {
                        }
                        column(Blank_Control1000000085; Blank)
                        {
                        }
                        column(Blank_Control1000000091; Blank)
                        {
                        }
                        column(Blank_Control1000000092; Blank)
                        {
                        }
                        column(Blank_Control1000000093; Blank)
                        {
                        }
                        column(Blank_Control1000000094; Blank)
                        {
                        }
                        column(Blank_Control1000000095; Blank)
                        {
                        }
                        column(Blank_Control1000000098; Blank)
                        {
                        }
                        column(Blank_Control1000000104; Blank)
                        {
                        }
                        column(Blank_Control1000000105; Blank)
                        {
                        }
                        column(Blank_Control1000000106; Blank)
                        {
                        }
                        column(Blank_Control1000000107; Blank)
                        {
                        }
                        column(Blank_Control1000000108; Blank)
                        {
                        }
                        column(Blank_Control1000000111; Blank)
                        {
                        }
                        column(Blank_Control1000000117; Blank)
                        {
                        }
                        column(Blank_Control1000000118; Blank)
                        {
                        }
                        column(Blank_Control1000000119; Blank)
                        {
                        }
                        column(Blank_Control1000000120; Blank)
                        {
                        }
                        column(Blank_Control1000000121; Blank)
                        {
                        }
                        column(TotalAmountExclVat; TotalAmountExclVat)
                        {
                        }
                        column(remarks; remarksGlobal)
                        {
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        column(SNo_Caption; SNo_CaptionLbl)
                        {
                        }
                        column(UnitCaption; UnitCaptionLbl)
                        {
                        }
                        column(QuantityCaption; QuantityCaptionLbl)
                        {
                        }
                        column(Unit_CostCaption; Unit_CostCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(Requested_By_Caption; Requested_By_CaptionLbl)
                        {
                        }
                        column(Budget_Checked_By_Caption; Budget_Checked_By_CaptionLbl)
                        {
                        }
                        column(Date_Caption; Date_CaptionLbl)
                        {
                        }
                        column(Name_Caption; Name_CaptionLbl)
                        {
                        }
                        column(SignatureCaption; SignatureCaptionLbl)
                        {
                        }
                        column(Total_AmountCaption; Total_AmountCaptionLbl)
                        {
                        }
                        column(Remarks_Caption; Remarks_CaptionLbl)
                        {
                        }
                        column(ApprovalsCaption; ApprovalsCaptionLbl)
                        {
                        }
                        column(Recommended_By_Caption; Recommended_By_CaptionLbl)
                        {
                        }
                        column(Approved_By_Caption; Approved_By_CaptionLbl)
                        {
                        }
                        column(RoundLoop_Number; Number)
                        {
                        }
                        column(DoNotShow; DoNotShow)
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = filter(1 ..));

                            column(DimText_Control60; DimText)
                            {
                            }
                            column(DimensionLoop2_Number; DimensionLoop2.Number)
                            {
                            }
                            column(DimText_Control80; DimText)
                            {
                            }
                            column(Line_DimensionsCaption; Line_DimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimensionSetEntry2.Find('-') then
                                        CurrReport.Break();
                                end else
                                    if not Continue then
                                        CurrReport.Break();

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo(
                                          Txt9000Txt, DimensionSetEntry2."Dimension Code", DimensionSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                           Txt9001Txt, DimText,
                                            DimensionSetEntry2."Dimension Code", DimensionSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until (DimensionSetEntry2.Next() = 0);
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfoGlobal then
                                    CurrReport.Break();
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            "SNo." := "SNo." + 1;
                            if Number = 1 then
                                TempPurchaseLine.Find('-')
                            else
                                TempPurchaseLine.Next();
                            "Purchase Line" := TempPurchaseLine;

                            DimensionSetEntry2.SetRange("Dimension Set ID", "Purchase Line"."Dimension Set ID");
                            //DocDim2.SETRANGE(Document Type","Purchase Line"."Document Type");
                            //DocDim2.SETRANGE("Document No.","Purchase Line"."Document No.");
                            //DocDim2.SETRANGE("Line No.","Purchase Line"."Line No.");

                            TotalAmountInclVat := TotalAmountInclVat + TempPurchaseLine."Amount Including VAT";
                            TotalAmountExclVat := (100 * TotalAmountInclVat) / (TempPurchaseLine."VAT %" + 100);
                            TotalVat := TotalAmountExclVat * (TempPurchaseLine."VAT %" / 100);
                            //MESSAGE('first'+'%1',CountLine);
                            if "SNo." <> 0 then
                                DoNotShow := true;
                        end;

                        trigger OnPostDataItem()
                        begin
                            TempPurchaseLine.DeleteAll();
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := TempPurchaseLine.Find('+');
                            while MoreLines and (TempPurchaseLine.Description = '') and (TempPurchaseLine."Description 2" = '') and
                                  (TempPurchaseLine."No." = '') and (TempPurchaseLine.Quantity = 0) and
                                  (TempPurchaseLine.Amount = 0)
                            do
                                MoreLines := TempPurchaseLine.Next(-1) <> 0;

                            if not MoreLines then
                                CurrReport.Break();

                            TempPurchaseLine.SetRange("Line No.", 0, TempPurchaseLine."Line No.");
                            SetRange(Number, 1, TempPurchaseLine.Count);

                            TotalAmountInclVat := 0;
                            TotalAmountExclVat := 0;
                            TotalVat := 0;
                            CountLine := 0;
                            CountLine := "Purchase Line".Count;
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));

                        trigger OnPreDataItem()
                        begin
                            if "Purchase Header"."Buy-from Vendor No." = "Purchase Header"."Pay-to Vendor No." then
                                CurrReport.Break();
                        end;
                    }
                    dataitem(Total3; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));

                        trigger OnPreDataItem()
                        begin
                            if ("Purchase Header"."Sell-to Customer No." = '') and (ShipToAddr[1] = '') then
                                CurrReport.Break();
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    "SNo." := 0;

                    Clear(TempPurchaseLine);
                    Clear(PurchPost);
                    TempPurchaseLine.DeleteAll();
                    PurchPost.GetPurchLines("Purchase Header", TempPurchaseLine, 0);

                    if Number > 1 then begin
                        CopyText := Text001Lbl;
                        OutputNo += 1;
                    end;
                end;

                trigger OnPostDataItem()
                begin
                    if not CurrReport.Preview then
                        PurchHeaderPrinted.Run("Purchase Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopiesGlobal) + 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);

                    OutputNo := 1;
                    if "Purchase Header"."Prices Including VAT" = true then
                        VatBool := true;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                "SNo." := 0;

                CompanyInformation.Get();
                CompanyInformation.CalcFields(Picture);

                if ResponsibilityCenter.Get("Responsibility Center") then begin
                    FormatAddress.RespCenter(CompanyAddr, ResponsibilityCenter);
                    CompanyInformation."Phone No." := ResponsibilityCenter."Phone No.";
                    CompanyInformation."Fax No." := ResponsibilityCenter."Fax No.";
                end else
                    FormatAddress.Company(CompanyAddr, CompanyInformation);

                DimensionSetEntry1.SetRange("Dimension Set ID", "Purchase Header"."Dimension Set ID");

                if "Purchaser Code" = '' then begin
                    SalesPersonPurchaser.Init();
                    PurchaserText := '';
                end else begin
                    SalesPersonPurchaser.Get("Purchaser Code");
                    PurchaserText := Text000Lbl
                end;

                if "Your Reference" = '' then
                    ReferenceText := ''
                else
                    ReferenceText := FieldCaption("Your Reference");

                if "VAT Registration No." = '' then
                    VATNoText := ''
                else
                    VATNoText := FieldCaption("VAT Registration No.");

                FormatAddress.PurchHeaderPayTo(VendAddr, "Purchase Header");

                if "Shipment Method Code" = '' then
                    ShipmentMethod.Init()
                else begin
                    ShipmentMethod.Get("Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Language Code");
                end;

                FormatAddress.PurchHeaderShipTo(ShipToAddr, "Purchase Header");

                if not CurrReport.Preview then begin
                    if ArchiveDocumentGlobal then
                        ArchiveManagement.StorePurchDocument("Purchase Header", LogInteractionGlobal);

                    if LogInteractionGlobal then begin
                        CalcFields("No. of Archived Versions");
                        SegManagement.LogDocument(
                          11, "No.", "Doc. No. Occurrence", "No. of Archived Versions", Database::Vendor, "Pay-to Vendor No.",
                          "Purchaser Code", '', "Posting Description", '');
                    end;
                end;

                if "Currency Code" = '' then begin
                    GeneralLedgerSetup.Get();
                    TotalInclVATText := StrSubstNo(Text004Lbl, GeneralLedgerSetup."LCY Code");
                    TotalExclVATText := StrSubstNo(Text005Lbl, GeneralLedgerSetup."LCY Code");
                end else begin
                    TotalInclVATText := StrSubstNo(Text004Lbl, "Currency Code");
                    TotalExclVATText := StrSubstNo(Text005Lbl, "Currency Code");
                end;

                if LocationRec.Get("Location Code") then;

                CompanyAddr[1] := CopyStr(LocationRec.Name + ' ' + LocationRec."Name 2", 1, MaxStrLen(CompanyAddr[1]));
                CompanyAddr[2] := LocationRec.City;
                CompanyAddr[3] := 'PH: ' + Format(LocationRec."Phone No.") + ' Fax: ' + Format(LocationRec."Fax No.");

                GetRequistionData();
            end;

            trigger OnPreDataItem()
            begin
                if LocationRec.Get("Location Code") then
                    ;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    Visible = false;

                    field(remarks; remarksGlobal)
                    {
                        Caption = 'Remarks';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Remarks field.';
                    }
                    field(NoOfCopies; NoOfCopiesGlobal)
                    {
                        Caption = 'No. of Copies';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the No. of Copies field.';
                    }
                    field(ShowInternalInfo; ShowInternalInfoGlobal)
                    {
                        Caption = 'Show Internal Information';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Show Internal Information field.';
                    }
                    field(ArchiveDocument; ArchiveDocumentGlobal)
                    {
                        Caption = 'Archive Document';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Archive Document field.';

                        trigger OnValidate()
                        begin
                            if not ArchiveDocumentGlobal then
                                LogInteractionGlobal := false;
                        end;
                    }
                    field(LogInteraction; LogInteractionGlobal)
                    {
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Log Interaction field.';

                        trigger OnValidate()
                        begin
                            if LogInteractionGlobal then
                                ArchiveDocumentGlobal := ArchiveDocumentEnable;
                        end;
                    }
                }
            }
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            LogInteractionGlobal := SegManagement.FindInteractionTemplateCode(Enum::"Interaction Log Entry Document Type"::"Purch.Qte.") <> '';

            LogInteractionEnable := LogInteractionGlobal;
        end;
    }

    var
        ShipmentMethod: Record "Shipment Method";
        SalesPersonPurchaser: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        TempPurchaseLine: Record "Purchase Line" temporary;
        DimensionSetEntry1: Record "Dimension Set Entry";
        DimensionSetEntry2: Record "Dimension Set Entry";
        ResponsibilityCenter: Record "Responsibility Center";
        GeneralLedgerSetup: Record "General Ledger Setup";
        LocationRec: Record Location;
        PurchHeaderPrinted: Codeunit "Purch.Header-Printed";
        PurchPost: Codeunit "Purch.-Post";
        SegManagement: Codeunit SegManagement;
        ArchiveManagement: Codeunit ArchiveManagement;
        FormatAddress: Codeunit "Format Address";
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[100];
        PurchaserText: Text[30];
        VATNoText: Text;//[80];
        ReferenceText: Text;//[80];
        MoreLines: Boolean;
        NoOfCopiesGlobal: Integer;
        NoOfLoops: Integer;
        CountLine: Integer;
        VatBool: Boolean;
        CopyText: Text[30];
        DimText: Text[150];
        OldDimText: Text[150];
        ShowInternalInfoGlobal: Boolean;
        Continue: Boolean;
        ArchiveDocumentGlobal: Boolean;
        LogInteractionGlobal: Boolean;
        [InDataSet]
        ArchiveDocumentEnable: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        TotalAmountInclVat: Decimal;
        TotalVat: Decimal;
        TotalAmountExclVat: Decimal;
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        "SNo.": Integer;
        Blank: Text[2];
        remarksGlobal: Text[60];
        DemandedByName: Text;
        RecommendationByName: Text;
        BudgetCheckedByName: Text;
        ApprovedByName: Text;
        DoNotShow: Boolean;
        TotAmt: Decimal;
        Text000Lbl: Label 'Purchaser';
        Text001Lbl: Label 'COPY';
        Text004Lbl: Label 'Total %1 Incl. VAT', Comment = 'Total %1 Incl. VAT';
        Text005Lbl: Label 'Total %1 Excl. VAT', Comment = 'Total %1 Excl. VAT';
        PQ_No_CaptionLbl: Label 'PQ-No.';
        DateCaptionLbl: Label 'Date';
        ProjectCaptionLbl: Label 'Project';
        DonorCaptionLbl: Label 'Donor';
        DepartmentCaptionLbl: Label 'Department';
        EmptyStringCaptionLbl: Label ':';
        OutputNo: Integer;
        EmptyStringCaption_Control1102159017Lbl: Label ':';
        EmptyStringCaption_Control1102159018Lbl: Label ':';
        EmptyStringCaption_Control1102159021Lbl: Label ':';
        EmptyStringCaption_Control1102159022Lbl: Label ':';
        Transport_DetailCaptionLbl: Label 'Transport Detail';
        EmptyStringCaption_Control1000000045Lbl: Label ':';
        LocationCaptionLbl: Label 'Location';
        EmptyStringCaption_Control1000000053Lbl: Label ':';
        NO_BUDGET_CaptionLbl: Label 'NO BUDGET!';
        Purchase_Header___Rejected_By_CaptionLbl: Label 'Rejected By';
        EmptyStringCaption_Control1000000204Lbl: Label ':';
        Header_DimensionsCaptionLbl: Label 'Header Dimensions';
        DescriptionCaptionLbl: Label 'Description';
        SNo_CaptionLbl: Label 'SNo.';
        UnitCaptionLbl: Label 'Unit';
        QuantityCaptionLbl: Label 'Quantity';
        Unit_CostCaptionLbl: Label 'Unit Cost';
        AmountCaptionLbl: Label 'Amount';
        Requested_By_CaptionLbl: Label 'Requested By:';
        Budget_Checked_By_CaptionLbl: Label 'Budget Checked By:';
        Date_CaptionLbl: Label 'Date:';
        Name_CaptionLbl: Label 'Name:';
        SignatureCaptionLbl: Label 'Signature';
        Total_AmountCaptionLbl: Label 'Total Amount';
        Remarks_CaptionLbl: Label 'Remarks:';
        ApprovalsCaptionLbl: Label 'Approvals';
        Recommended_By_CaptionLbl: Label 'Recommended By:';
        Approved_By_CaptionLbl: Label 'Approved By:';
        Line_DimensionsCaptionLbl: Label 'Line Dimensions';
        RepCaptionLbl: Label 'REQUISITION FORM';
        Txt9000Txt: Label '%1 - %2', Locked = true;
        Txt9001Txt: Label '%1; %2 - %3', Locked = true;

    local procedure GetRequistionData()
    begin
        // IF Customer.GET("Purchase Header"."Demanded by No.") THEN
        //  DemandedByName := Customer.Name
        // ELSE
        //  DemandedByName := '';
        //
        // IF Customer.GET("Purchase Header"."Recommended By") THEN
        //  RecommendationByName := Customer.Name
        // ELSE
        //  RecommendationByName := '';
        //
        // IF Customer.GET("Purchase Header"."Budget Checked By") THEN
        //  BudgetCheckedByName := Customer.Name
        // ELSE
        //  BudgetCheckedByName := '';
        //
        // IF Customer.GET("Purchase Header"."Approved By") THEN
        //  ApprovedByName := Customer.Name
        // ELSE
        //  ApprovedByName := '';
    end;
}