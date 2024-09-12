tableextension 50114 "Detailed Emp Led. Entry NEP" extends "Detailed Employee Ledger Entry"
{
    LookupPageId = "Detailed Empl. Ledger Entries";
    DrillDownPageId = "Detailed Empl. Ledger Entries";

    fields
    {
        field(90000; Description; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(90001; "Payroll Attribute Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Payroll Attribute Code';
        }
        field(90002; "Pay Cycle Term"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Pay Cycle Term';
        }
        field(90003; "Pay Cycle Period"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Pay Cycle Period';
        }
        field(90004; "Pay Period Start Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Pay Period Start Date';
        }
        field(90005; "Pay Period End Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Pay Period End Date';
        }
        field(90006; "Attribute Type"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90007; "Attribute SubType"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90008; "G/L Account No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";
        }
        field(90009; "Employee Posting Group"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Employee Ledger Entry"."Employee Posting Group" where("Entry No." = field("Employee Ledger Entry No.")));
        }
    }
}