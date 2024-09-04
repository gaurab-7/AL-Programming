tableextension 50110 "General Ledger Setup" extends "General Ledger Setup"
{
    fields
    {
        field(50100; "T-Loan No. Series"; Code[20])
        {
            Caption = 'T-Loan No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50101; "T-Loan Shipment No. Series"; Code[20])
        {
            Caption = 'T-Loan Shipment No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50102; "T-Loan Receipt No. Series"; Code[20])
        {
            Caption = 'T-Loan Receipt No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
