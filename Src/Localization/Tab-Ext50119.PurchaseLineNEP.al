tableextension 50119 "Purchase Line NEP" extends "Purchase Line"
{
    fields
    {
        field(90000; "Localized VAT Identifier"; Enum "Localized VAT Identifier NEP")
        {
            DataClassification = CustomerContent;
        }
        field(90001; "Returned Document No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90002; "Document Class"; Enum "Document Class NEP")
        {
            DataClassification = CustomerContent;
        }
        field(90003; "Document Subclass"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = if ("Document Class" = const(Customer)) Customer
            else
            if ("Document Class" = const(Vendor)) Vendor
            else
            if ("Document Class" = const("Bank Account")) "Bank Account";
        }
        field(90094; PragyapanPatra; Code[100])
        {
            Caption = 'PragyapanPatra';
            DataClassification = CustomerContent;
            TableRelation = "PragyapanPatra NEP" where("Purchase Consignment No." = field("Purchase Consignment No."));
        }
        field(90095; "Purchase Consignment No."; Code[20])
        {
            Caption = 'Purchase Consignment No.';
            DataClassification = CustomerContent;
            TableRelation = "Purchase Consignment NEP";
        }
        field(90096; "LC No."; Code[20])
        {
            caption = 'LC No.';
            DataClassification = CustomerContent;
            TableRelation = "LC Details NEP" where(Released = const(true));
        }
        //TDS1.00>>
        field(90061; "TDS Group"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "TDS Posting Group NEP".Code where(Type = filter("Purchase TDS"), Blocked = const(False));

            trigger OnValidate()
            begin
                ClearTDSFields();
                CalculateTDSAmount();
            end;
        }
        field(90062; "TDS %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(90063; "TDS Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","Purchase TDS","Sales TDS";
        }
        field(90064; "TDS Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90065; "TDS Base Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(90066; "TDS Reference Line No."; Integer)
        {
            Caption = 'TDS Reference Line No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        //TDS1.00<< 
        field(90013; "Total Order Quantity"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line".Quantity where("Document Type" = field("Document Type"), "Document No." = field("Document No.")));
        }
        field(90044; "Requisition No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                PurchHeader: Record "Purchase Header";
            begin
                ClearTDSFields();
                CalculateTDSAmount();

                PurchHeader.Get("Document Type", "Document No.");
                "LC No." := PurchHeader."LC No.";
                "Purchase Consignment No." := PurchHeader."Purchase Consignment No.";
                PragyapanPatra := PurchHeader.PragyapanPatra;
            end;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                ClearTDSFields();
                CalculateTDSAmount();
            end;
        }
        modify("Type")
        {
            trigger OnAfterValidate()
            begin
                ClearTDSFields();
                CalculateTDSAmount();
            end;
        }
        modify("Direct Unit Cost")
        {
            trigger OnAfterValidate()
            begin
                ClearTDSFields();
                CalculateTDSAmount();
            end;
        }
        modify("Qty. to Invoice")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                ClearTDSFields();
                CalculateTDSAmount();
            end;
        }
    }

    procedure ClearTDSFields()
    begin
        "TDS %" := 0;
        "TDS Type" := "TDS Type"::" ";
        "TDS Amount" := 0;
        "TDS Base Amount" := 0;
    end;

    procedure CalculateTDSAmount()
    begin
        CalculateTDSAmount2();
    end;

    procedure CalculateTDSAmount2()
    var
        TDSSetup2: Record "TDS Posting Group NEP";
        TDSMgt: Codeunit "TDS Management NEP";
    begin
        if "TDS Reference Line No." <> 0 then
            exit;

        ClearTDSFields();
        TDSSetup2.Reset();
        TDSSetup2.SetRange(Code, "TDS Group");
        if TDSSetup2.FindFirst() then begin
            "TDS %" := TDSSetup2."TDS %";
            "TDS Type" := TDSSetup2.Type;
            "TDS Base Amount" := "VAT Base Amount";
            "TDS Amount" := Round(TDSSetup2."TDS %" / 100 * "VAT Base Amount");
        end;

        Clear(TDSMgt);
    end;
}