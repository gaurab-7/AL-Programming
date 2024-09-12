tableextension 50122 "Value Entry NEP" extends "Value Entry"
{
    fields
    {
        field(90094; PragyapanPatra; Code[100])
        {
            Caption = 'PragyapanPatra';
            DataClassification = CustomerContent;
            TableRelation = "PragyapanPatra NEP";
        }
        field(90095; "Purchase Consignment No."; Code[20])
        {
            Caption = 'Purchase Consignment No.';
            DataClassification = CustomerContent;
            TableRelation = "Purchase Consignment NEP";
        }
        field(90096; "Sys.LC No."; Code[20])
        {
            Caption = 'LC No.';
            DataClassification = CustomerContent;
        }
    }
}