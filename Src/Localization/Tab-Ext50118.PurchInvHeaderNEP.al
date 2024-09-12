tableextension 50118 "Purch. Inv. Header NEP" extends "Purch. Inv. Header"
{
    fields
    {
        field(90000; "Posting Time"; Time)
        {
            DataClassification = CustomerContent;
        }
        field(90001; "PI Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'PI Date';
        }
        field(90125; "Indian Customs Clear Date"; date)
        {
            DataClassification = CustomerContent;
            Caption = 'Indian Customs Clear Date';
        }
        field(90121; "Nepal Customs Clear Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Nepal Customs Clear Date';
        }
        field(90094; PragyapanPatra; Code[100])
        {
            Caption = 'PragyapanPatra';
            DataClassification = CustomerContent;
            TableRelation = "PragyapanPatra NEP";
            Editable = false;
        }
        field(90095; "Purchase Consignment No."; Code[20])
        {
            Caption = 'Purchase Consignment No.';
            DataClassification = CustomerContent;
            TableRelation = "Purchase Consignment NEP";
            Editable = false;
        }
        field(90096; "LC No."; Code[20])
        {
            caption = 'LC No.';
            DataClassification = CustomerContent;
            TableRelation = "LC Details NEP";
            Editable = false;
        }
        field(90097; "Bank LC No."; Code[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("LC Details NEP"."LC\DO No." where("No." = field("LC No.")));
            Editable = false;
        }
        field(90005; "Proforma Invoice No."; Code[50])
        {
            DataClassification = CustomerContent;
            editable = false;
        }
        field(90006; "Proforma Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
            editable = false;
        }
        field(90110; "PI Received"; Option)
        {
            DataClassification = CustomerContent;
            editable = false;
            OptionMembers = "No","Yes";
        }
        field(90111; "PI Approved"; Option)
        {
            DataClassification = CustomerContent;
            editable = false;
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
        //purchase requisition 
        field(90007; "Is Requisition Order"; Boolean)
        {
            Caption = 'Is Requisition Order';
            DataClassification = CustomerContent;
            editable = false;
        }
        field(90008; "Purchase Requisition Sent"; Boolean)
        {
            Caption = 'Purchase Requisition Sent';
            DataClassification = CustomerContent;
        }
        field(90009; "Purch. Order Created"; Boolean)
        {
            Caption = 'Purch. Order Created';
            DataClassification = CustomerContent;
            editable = false;
        }
        field(90010; "Created Purch. Order No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Created Purch. Order No.';
            editable = false;
        }
        field(90045; "Narration"; text[250])
        {
            DataClassification = CustomerContent;
        }
        field(90016; "Memo Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","Insurance Memo","Custom Clearance Memo","Registration Memo";
        }
        field(90120; "VAT Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(90055; "Nepali Date"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "English-Nepali Date NEP"."Nepali Date";
            Editable = false;
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