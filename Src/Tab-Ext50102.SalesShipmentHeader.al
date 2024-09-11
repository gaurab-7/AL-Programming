tableextension 50102 "Sales Shipment Header" extends "Sales Shipment Header"
{
    fields
    {
        field(50100; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            DataClassification = ToBeClassified;
        }
    }
}