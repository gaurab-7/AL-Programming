table 50126 "Template Security NEP"
{
    Caption = 'Template Security';
    DataClassification = CustomerContent;

    fields
    {
        field(90000; "Table Name"; Option)
        {
            Caption = 'Table Name';
            DataClassification = CustomerContent;
            OptionMembers = "General Journal","FA Journal","FA Reclass Journal","Insurance Journal","Item Journal","Recurring General Journal","Recurring FA Journal";
        }
        field(90001; "Template Name"; Code[20])
        {
            Caption = 'Template Name';
            DataClassification = CustomerContent;
            TableRelation = if ("Table Name" = const("General Journal")) "Gen. Journal Template" else
            if ("Table Name" = const("FA Journal")) "FA Journal Template" else
            if ("Table Name" = const("FA Reclass Journal")) "FA Reclass. Journal Template" else
            if ("Table Name" = const("Insurance Journal")) "Item Journal Template" else
            if ("Table Name" = const("Recurring General Journal")) "Gen. Journal Template" where(Recurring = const(true)) else
            if ("Table Name" = const("Recurring FA Journal")) "FA Journal Template" where(Recurring = const(true)) else
            if ("Table Name" = const("Item Journal")) "Item Journal Template";
        }
        field(90002; "Batch Name"; Code[20])
        {
            Caption = 'Batch Name';
            DataClassification = CustomerContent;
            TableRelation = if ("Table Name" = const("General Journal")) "Gen. Journal Batch".Name where("Journal Template Name" = field("Template Name")) else
            if ("Table Name" = const("FA Journal")) "FA Journal Batch".Name where("Journal Template Name" = field("Template Name")) else
            if ("Table Name" = const("FA Reclass Journal")) "FA Reclass. Journal Batch".Name where("Journal Template Name" = field("Template Name")) else
            if ("Table Name" = const("Insurance Journal")) "Insurance Journal Batch".Name where("Journal Template Name" = field("Template Name")) else
            if ("Table Name" = const("Item Journal")) "Item Journal Batch".Name where("Journal Template Name" = field("Template Name")) else
            if ("Table Name" = const("Recurring General Journal")) "Gen. Journal Batch".Name where("Journal Template Name" = field("Template Name")) else
            if ("Table Name" = const("Recurring FA Journal")) "FA Journal Batch".Name where("Journal Template Name" = field("Template Name"));
        }
        field(90003; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
            TableRelation = "User Setup";
        }
        field(90004; "Branch Code"; Code[10])
        {
            Caption = 'Branch Code';
            DataClassification = CustomerContent;
        }
        field(90005; Posting; Boolean)
        {
            Caption = 'Posting';
            DataClassification = CustomerContent;
        }
        field(90006; "Authorised Limit"; Decimal)
        {
            Caption = 'Authorised Limit';
            DataClassification = CustomerContent;
        }
        field(90007; "PDC Journal"; Boolean)
        {
            Caption = 'PDC Journal';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Table Name", "Template Name", "Batch Name", "User ID")
        {
            Clustered = true;
        }
    }
}