table 50121 "PragyapanPatra NEP"
{
    Caption = 'PragyapanPatra';
    DataClassification = CustomerContent;
    LookupPageId = "PragyapanPatra NEP";
    DrillDownPageId = "PragyapanPatra NEP";

    fields
    {
        field(90002; Code; Code[100])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if Code = '' then
                    Error(PleaseEnterCodeErr)
            end;
        }
        field(90095; "Purchase Consignment No."; Code[20])
        {
            Caption = 'Purchase Consignment No.';
            DataClassification = CustomerContent;
            TableRelation = "Purchase Consignment NEP"."No.";
        }
        field(90001; "Date of Custom Clerance"; Date)
        {
            Caption = 'Date of Custom Clerance';
            DataClassification = CustomerContent;
        }
        field(90003; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if Code = '' then
            Error(PleaseEnterCodeErr);
    end;

    trigger OnModify()
    begin
        if ExistsInPostedPurchaseDocument(Code) then
            Error(PostedPurchaseInvoiceErr, PostedPurchaseDocumentNo);
        if ExistsInPurchaseDocument(Code) then
            Error(RemovePPNoErr, PurchaseDocumentNo, Code);
    end;

    trigger OnDelete()
    begin
        if ExistsInPostedPurchaseDocument(Code) then
            Error(PostedPurchaseInvoiceErr, PostedPurchaseDocumentNo);
        if ExistsInPurchaseDocument(Code) then
            Error(RemovePPNoErr, PurchaseDocumentNo, Code);
    end;

    trigger OnRename()
    begin
        if ExistsInPostedPurchaseDocument(xRec.Code) then
            Error(PostedPurchaseInvoiceErr, PostedPurchaseDocumentNo);
        if ExistsInPurchaseDocument(xRec.Code) then
            Error(RemovePPNoErr, PurchaseDocumentNo, xRec.Code);
    end;

    var
        PostedPurchaseDocumentNo: Code[20];
        PurchaseDocumentNo: Code[20];
        PostedPurchaseInvoiceErr: Label 'You cannot modify or Delete or Rename PragaypanPatra Details as it Exists in Posted Purchase Invoice %1', Comment = '%1 = Posted Purchase Invoice No.';
        RemovePPNoErr: Label 'You cannot modify or Delete or Rename PragaypanPatra Details as it Exists in Purchase Document %1. Please remove PPNo %2 from Purchase Document %1 to delete or modify or Rename.', Comment = '%1 = Purchase Document, %2 = PPNo';
        PleaseEnterCodeErr: Label 'Please Enter Code';

    procedure CreatePurchaseConsignment(var PragyapanPatraNep: Record "PragyapanPatra NEP")
    var
        PurchaseConsignmentNep: Record "Purchase Consignment NEP";
        PurchaseConsignmentNep1: Record "Purchase Consignment NEP";
    begin
        PurchaseConsignmentNep.Reset();
        PurchaseConsignmentNep.SetRange(PragyapanPatra, PragyapanPatraNep.Code);
        if PurchaseConsignmentNep.FindFirst() then begin
            Page.Run(Page::"Purchase Consignment NEP", PurchaseConsignmentNep);
            exit
        end;

        Clear(PurchaseConsignmentNep1);
        PurchaseConsignmentNep1.Init();
        PurchaseConsignmentNep1.PragyapanPatra := Code;
        PurchaseConsignmentNep1.Insert(true);

        PragyapanPatraNep."Purchase Consignment No." := PurchaseConsignmentNep1."No.";
        PragyapanPatraNep.Modify();
        Page.Run(Page::"Purchase Consignment NEP", PurchaseConsignmentNep1);
    end;

    local procedure ExistsInPostedPurchaseDocument(PPNo: Code[100]): Boolean
    var
        PurchInvHeader: Record "Purch. Inv. Header";
    begin
        Clear(PostedPurchaseDocumentNo);
        PurchInvHeader.Reset();
        PurchInvHeader.SetRange(PragyapanPatra, PPNo);
        if PurchInvHeader.FindFirst() then begin
            PostedPurchaseDocumentNo := PurchInvHeader."No.";
            exit(true);
        end;
    end;

    local procedure ExistsInPurchaseDocument(PPNo: Code[100]): Boolean
    var
        PurchaseLine: Record "Purchase Line";
        PurchaseHeader: Record "Purchase Header";
    begin
        Clear(PurchaseDocumentNo);
        PurchaseHeader.Reset();
        PurchaseHeader.SetRange(PragyapanPatra, PPNo);
        if PurchaseHeader.FindFirst() then begin
            PurchaseDocumentNo := PurchaseHeader."No.";
            exit(true);
        end;

        Clear(PurchaseDocumentNo);
        PurchaseLine.Reset();
        PurchaseLine.SetRange(PragyapanPatra, PPNo);
        if PurchaseLine.FindFirst() then begin
            PurchaseDocumentNo := PurchaseLine."Document No.";
            exit(true);
        end;
    end;
}