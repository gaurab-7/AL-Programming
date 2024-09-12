tableextension 50120 "Purch. Cr. Memo Hdr. NEP" extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(90000; "Posting Time"; Time)
        {
            DataClassification = CustomerContent;
        }
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
        field(90096; "LC No."; Code[20])
        {
            caption = 'LC No.';
            DataClassification = CustomerContent;
            TableRelation = "LC Details NEP";
        }
        field(90097; "Bank LC No."; Code[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("LC Details NEP"."LC\DO No." where("No." = field("LC No.")));
        }
        field(90005; "Proforma Invoice No."; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(90006; "Proforma Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(90110; "PI Received"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "No","Yes";
        }
        field(90111; "PI Approved"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "No","Yes";
        }
        //ratan , for purchase cues
        field(90112; "Purch Management Applied"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90114; "GRN Raised"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90045; "Narration"; text[250])
        {
            DataClassification = CustomerContent;
        }
        field(90118; "Freight"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Paid,"To Pay";
        }
        field(90120; "Godown Landing Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(90013; Remarks; text[250])
        {
            DataClassification = CustomerContent;
        }
        field(90108; "Booked From"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(90016; "Memo Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","Insurance Memo","Custom Clearance Memo","Registration Memo";
        }
        field(90055; "Nepali Date"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "English-Nepali Date NEP"."Nepali Date";
        }
        field(90085; "Return Reason Code"; Code[10])
        {
            TableRelation = "Return Reason";
            DataClassification = CustomerContent;
        }
    }
    trigger OnDelete()
    begin
        Error('You cannot delete a posted document');
    end;
}