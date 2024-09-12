tableextension 50121 "G/L Entry NEP" extends "G/L Entry"
{
    fields
    {
        modify("External Document No.")
        {
            Caption = 'Bill/Cheque No.';
        }
        field(90000; "Localized VAT Identifier"; Enum "Localized VAT Identifier NEP")
        {
            DataClassification = CustomerContent;
        }
        field(90045; Narration; Text[250])
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
            if ("Document Class" = const("Bank Account")) "Bank Account"
            else
            if ("Document Class" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Document Class" = const(employee)) Employee;
        }
        field(90096; "LC No."; Code[20])
        {
            TableRelation = "LC Details NEP"."No.";
            DataClassification = CustomerContent;
        }
        field(90005; "Transaction Type"; Code[20])
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;
        }
        field(90006; "Pre-Assigned No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90007; "Budget Name"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90008; "Employee Name"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90009; "Bank LC Name"; Code[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90094; PragyapanPatra; Code[100])
        {
            DataClassification = CustomerContent;
            Caption = 'PragyapanPatra';
            Description = 'NP15.1001';
        }
        //TDS1.00
        field(90061; "TDS Group"; Code[20])
        {
            Caption = 'TDS Group';
            Description = 'TDS 1.00';
            TableRelation = "TDS Posting Group NEP".Code;
            DataClassification = CustomerContent;
        }
        field(90062; "TDS %"; Decimal)
        {
            Caption = 'TDS %';
            Description = 'TDS 1.00';
            DataClassification = CustomerContent;
        }
        field(90063; "TDS Type"; Option)
        {
            OptionMembers = " ","Purchase TDS","Sales TDS";
            Caption = 'TDS Type';
            Description = 'TDS 1.00';
            DataClassification = CustomerContent;
        }
        field(90064; "TDS Amount"; Decimal)
        {
            Caption = 'TDS Amount';
            Description = 'TDS 1.00';
            DataClassification = CustomerContent;
        }
        field(90065; "TDS Base Amount"; Decimal)
        {
            Caption = 'TDS Base Amount';
            Description = 'TDS 1.00';
            DataClassification = CustomerContent;
        }
        field(90066; "TDS Reference Line No."; Integer)
        {
            Caption = 'TDS Reference Line No.';
            DataClassification = CustomerContent;
        }
        field(90017; "Creation date"; Date)
        {
            Caption = 'Creation Date';
            DataClassification = CustomerContent;
        }
        field(90018; "Creation Time"; Time)
        {
            Caption = 'Creation Time';
            DataClassification = CustomerContent;
        }
        field(90019; "TDS Entry No."; Integer)
        {
            Caption = 'TDS Entry No.';
            DataClassification = CustomerContent;
        }
        field(90020; "PDC Entry No."; Integer)
        {
            Caption = 'PDC Entry No.';
            DataClassification = CustomerContent;
        }
        field(90021; "TDS Rebate Posted"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90055; "Nepali Date"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "English-Nepali Date NEP"."Nepali Date";
        }
        field(90023; "LC Entry Type"; Enum "LC Entry Type NEP")
        {
            DataClassification = CustomerContent;
        }
        // field(90024; "Source Name"; Text[250])
        // {
        //     DataClassification = CustomerContent;
        // }
    }

    keys
    {
        key(Sk; "TDS Entry No.")
        {

        }
        // key(SK; "Source Type", "Source no.")
        // {
        //     SumIndexFields = "Debit Amount", "Credit Amount", Amount;
        // }
    }
}