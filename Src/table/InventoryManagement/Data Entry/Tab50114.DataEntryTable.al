table 50114 "Data Entry Table"
{
    Caption = 'Data Entry Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = if (Type = const(Purchase)) Vendor else if (Type = const(Sales)) CustomersInv;
            trigger OnValidate()
            var
                customerInv: Record CustomersInv;
                vendorInv: Record Vendor;
            begin
                if Type = Type::Sales then begin
                    customerInv.Reset();
                    customerInv.SetRange("Customer No.", "Customer No.");
                    if customerInv.FindFirst() then
                        "Customer Name" := customerInv.Name;
                end else if Type = Type::Purchase then begin
                    vendorInv.Reset();
                    vendorInv.SetRange("No.", "Customer No.");
                    if vendorInv.FindFirst() then
                        "Customer Name" := vendorInv.Name;
                end;
            end;
        }
        field(2; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';
            Editable = false;
        }
        field(3; "Item No."; Code[50])
        {
            Caption = 'Item No.';
            TableRelation = "Inventory Management";

            trigger OnValidate()
            var
                inv: Record "Inventory Management";
            begin
                inv.Reset();
                inv.SetRange("Item No.", "Item No.");
                if inv.FindFirst() then begin
                    "Item Name" := inv."Item Name";
                    "Item in stock" := inv."Quantity In Stock";
                end;
            end;
        }
        field(4; "Item Name"; Text[50])
        {
            Caption = 'Item Name';
            Editable = false;
        }
        field(5; "Item Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Type; Option)
        {
            OptionMembers = " ",Purchase,Sales;
        }
        field(7; "Item in stock"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Transaction ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Transaction ID" <> xRec."Transaction ID" then begin
                    SalesSetup.Get();
                    SalesSetup.TestField(SalesSetup."Inventory Mgmt No. Series");
                    NoSeriesMgt.SetSeries("Transaction ID");
                end
            end;
        }
        field(9; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Transaction ID")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "Transaction ID" = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Inventory Mgmt No. Series");
            NoSeriesMgt.InitSeries(SalesSetup."Inventory Mgmt No. Series", xRec."No. Series", 0D, "Transaction ID", "No. Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
