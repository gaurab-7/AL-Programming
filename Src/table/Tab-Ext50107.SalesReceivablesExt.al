tableextension 50107 "Sales&ReceivablesExt" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Inventory Mgmt No. Series"; Code[20])
        {
            Caption = 'Inventory Management';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
