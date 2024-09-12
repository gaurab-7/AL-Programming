table 50122 "Purchase Consignment NEP"
{
    Caption = 'Purchase Consignment';
    DataClassification = CustomerContent;
    LookupPageId = "Purchase Consignment NEP";
    DrillDownPageId = "Purchase Consignment NEP";

    fields
    {
        field(90000; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    PurchasesPayablesSetup.Get();
                    NoSeriesManagement.TestManual(PurchasesPayablesSetup."Purchase Consignment Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(90001; "Commercial Invoice No."; Code[50])
        {
            Caption = 'Commercial Invoice No.';
            DataClassification = CustomerContent;
        }
        field(90002; Blocked; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = CustomerContent;
        }
        field(90003; "Vendor Code"; Code[20])
        {
            Caption = 'Vendor Code';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
        field(90004; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(90094; PragyapanPatra; Code[100])
        {
            Caption = 'PragyapanPatra';
            DataClassification = CustomerContent;
            TableRelation = "PragyapanPatra NEP";
        }
        field(90006; "Purchase Consginment Date"; Date)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(key1; PragyapanPatra)
        {
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            PurchasesPayablesSetup.Get();
            PurchasesPayablesSetup.TestField("Purchase Consignment Nos.");
            NoSeriesManagement.InitSeries(PurchasesPayablesSetup."Purchase Consignment Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnDelete()
    begin
        Error(NotAllowedToDeleteErr);
    end;

    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        PurchaseConsignmentNep: Record "Purchase Consignment NEP";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NotAllowedToDeleteErr: Label 'You are not allowed to Delete!';

    procedure AssistEdit(): Boolean
    begin
        PurchaseConsignmentNep := Rec;
        PurchasesPayablesSetup.Get();
        PurchasesPayablesSetup.TestField("Purchase Consignment Nos.");
        if NoSeriesManagement.SelectSeries(PurchasesPayablesSetup."Purchase Consignment Nos.", xRec."No. Series", PurchaseConsignmentNep."No. Series") then begin
            PurchasesPayablesSetup.Get();
            PurchasesPayablesSetup.TestField("Purchase Consignment Nos.");
            NoSeriesManagement.SetSeries(PurchaseConsignmentNep."No.");
            Rec := PurchaseConsignmentNep;
            exit(true);
        end;
    end;
}