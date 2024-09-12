tableextension 50116 "User Setup NEP" extends "User Setup"
{
    fields
    {
        field(90000; "Default Location"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(90001; "Default Responsibility Center"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center";
        }
        field(90002; "Skip Update Posting Date"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        //TDS1.00
        field(90003; "Allow TDS A/C Direct Posting"; Boolean)
        {
            Caption = 'Allow TDS A/C Direct Posting';
            Description = 'TDS 1.00';
            DataClassification = CustomerContent;
        }
        field(90004; "Blank IRD Voucher No."; Boolean)
        {
            Caption = 'Blank IRD Voucher No.';
            DataClassification = CustomerContent;
        }
        field(90005; "Allow all Batch"; Boolean)
        {
            Caption = 'Allow All Batch';
            DataClassification = CustomerContent;
        }
        field(90006; "Default Item Jnl Template"; Code[20])
        {
            Caption = 'Default Item Jnl Template';
            TableRelation = "Item Journal Template".Name;
            DataClassification = CustomerContent;
        }
        field(90007; "Default Item Jnl Batch"; Code[20])
        {
            Caption = 'Default Item Jnl Batch';
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Default Item Jnl Template"));
            DataClassification = CustomerContent;
        }
        field(90008; "Location Filter"; Code[100])
        {
            Caption = 'Location Filter';
            DataClassification = CustomerContent;
        }
        field(90009; "Hide Financial Data"; Boolean)
        {
            Caption = 'Hide Financial Data';
            DataClassification = CustomerContent;
        }
    }
}