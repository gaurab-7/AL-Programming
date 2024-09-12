tableextension 50112 "Employee NEP" extends Employee
{
    fields
    {
        field(90000; "Balance (LCY) NEP"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance (LCY) NEP';
            FieldClass = FlowField;
            CalcFormula = sum("Detailed Employee Ledger Entry"."Amount (LCY)" where("Ledger Entry Amount" = const(true),
                                                                                     "Employee No." = field("No."),
                                                                                     "Posting Date" = field("Date Filter"),
                                                                                     "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                     "Employee Posting Group" = field("posting group filter")));
        }
        field(90001; "G/L Account Filter"; Code[20])
        {
            Caption = 'G/L Account Filter';
            FieldClass = FlowFilter;
            TableRelation = "G/L Account";
        }
        field(90002; "Net Change (LCY) NEP"; decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Employee Ledger Entry"."Amount (LCY)" where("Employee No." = field("No."),
                                                                                   "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = field("Date Filter"),
                                                                                   "Employee Posting Group" = field("posting group filter")));
            Caption = 'Net Change (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(90003; "Debit Amount (LCY) NEP"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Detailed Employee Ledger Entry"."Debit Amount (LCY)" where("Employee No." = field("No."),
                                                                                        "Entry Type" = filter(<> Application),
                                                                                        "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                        "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                        "Posting Date" = field("Date Filter"),
                                                                                        "Employee Posting Group" = field("posting group filter")));
            Caption = 'Debit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(90004; "Credit Amount (LCY) NEP"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Detailed Employee Ledger Entry"."Credit Amount (LCY)" where("Employee No." = field("No."),
                                                                                        "Entry Type" = filter(<> Application),
                                                                                        "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                        "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                        "Posting Date" = field("Date Filter"),
                                                                                        "Employee Posting Group" = field("posting group filter")));
            Caption = 'Credit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(90005; "NAV Login ID"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
        }
        field(90006; "Citizenship No."; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(90007; "Pan No."; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(90008; "SSF No/PF No"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(90009; "Posting Group Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Employee Posting Group";
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
            end;
        }
        modify("First Name")
        {
            trigger OnAfterValidate()
            begin
            end;
        }
    }

    trigger OnInsert()
    begin
    end;
}