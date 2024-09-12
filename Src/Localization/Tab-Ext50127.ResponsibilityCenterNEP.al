tableextension 50127 "Responsibility Center NEP" extends "Responsibility Center"
{
    fields
    {
        field(90000; "Sale Quote Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90001; "Sales Blanket Order Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90002; "Sales Order Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90003; "Sales Return Order Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90004; "Sales Invoice Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90005; "Sales Posted Invoice Nos"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                SysMgt.MarkDateOrder("Sales Posted Invoice Nos");
            end;
        }
        field(90006; "Sales Credit Memo Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90007; "Sales Posted Credit Memo Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                SysMgt.MarkDateOrder("Sales Posted Credit Memo Nos.");
            end;
        }
        field(90008; "Sales Posted Shipment Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                SysMgt.MarkDateOrder("Sales Posted Shipment Nos.");
            end;
        }
        field(90009; "Purch. Quote Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90010; "Purch. Blanket Order Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90011; "Purch. Order Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90012; "Purch. Return Order Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90013; "Purch. Invoice Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90014; "Purch. Posted Invoice Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = AccountData;
        }
        field(90015; "Purch. Credit Memo Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90016; "Purch. Posted Credit Memo Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90017; "Purch. Posted Receipt Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90018; "Trans. Order Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90019; "Posted Transfer Shpt. Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90020; "Posted Transfer Rcpt. Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90021; "Purch. Posted Prept. Inv. Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90022; "Purch. Ptd. Prept. Cr. M. Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90023; "Purch. Ptd. Return Shpt. Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90024; "Sales Posted Prepmt. Inv. Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90025; "Sales Ptd. Prept. Cr. M. Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90026; "Sales Ptd. Return Receipt Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                SysMgt.MarkDateOrder("Sales Ptd. Return Receipt Nos.");
            end;
        }
        field(90027; "Complaint Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90028; "Service Invoice Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90029; "Service Order Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90030; "Service Quote Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90031; "Posted Service Invoice Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                SysMgt.MarkDateOrder("Posted Service Invoice Nos.");
            end;
        }
        field(90032; "Posted Ser. Credit Memo Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                SysMgt.MarkDateOrder("Posted Ser. Credit Memo Nos.");
            end;
        }
        field(90033; "Posted Service Shipment Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                SysMgt.MarkDateOrder("Posted Service Shipment Nos.");
            end;
        }
        field(90034; "Service Credit Memo Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90035; "Insurance Memo Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90036; "Custome Clearance Memo Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90037; "Registration Memo Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90038; "Debit Note Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90039; "Credit Note Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90040; "Transfer Requisition Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90041; "Edit Unit Price In SO"; boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90042; "Requisition Order Nos"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90043; "Invt. Receipt Nos."; Code[20])
        {
            Caption = 'Invt. Receipt Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90044; "Posted Invt. Receipt Nos."; Code[20])
        {
            Caption = 'Posted Invt. Receipt Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90045; "Invt. Shipment Nos."; Code[20])
        {
            Caption = 'Invt. Shipment Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90046; "Posted Invt. Shipment Nos."; Code[20])
        {
            Caption = 'Posted Invt. Shipment Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90047; "Assembly Quots Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90048; "Assembly Order Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90049; "Assembly Blanket Order Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90050; "Posted Assembly Order Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
    }

    var
        SysMgt: Codeunit "System Managements NEP";
}