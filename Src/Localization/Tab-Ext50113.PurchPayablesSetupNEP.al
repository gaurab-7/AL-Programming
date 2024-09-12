tableextension 50113 "Purch. & Payables Setup NEP" extends "Purchases & Payables Setup"
{
    fields
    {
        field(90000; "Purchase Consignment Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Purchase Consignment Nos.';
            TableRelation = "No. Series";
        }
        field(90003; "Quote Mandatory"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90001; "Purchase Requisition Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Purchase Requisition Nos.';
            TableRelation = "No. Series";
        }
    }
}
