tableextension 50124 "General Ledger Setup NEP" extends "General Ledger Setup"
{
    fields
    {
        field(90000; "Return Qty and Amt Editable"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90001; "Enable Maker-Checker Feature"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        //BUDGET FIELDS >>
        field(90002; "Default Budget GL Acc. Filter"; Code[50])
        {
            DataClassification = CustomerContent;

            trigger OnLookup()
            begin
                "Default Budget GL Acc. Filter" := CopyStr(SelectionFilter.GetSelectionFilterForGLAccount(GL), 1, 50);
            end;
        }
        field(90003; "Check Dimension 1"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90004; "Check Dimension 2"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90005; "Check Dimension 3"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90006; "Check Dimension 4"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90007; "Check Dimension 5"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90008; "Check Dimension 6"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90009; "Check Dimension 7"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90010; "Check Dimension 8"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90011; "Default G/L Budget Name"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "G/L Budget Name";
        }
        //BUDGET FIELDS <<
        field(90012; "Default Cash GL Acc. Filter"; Code[50])
        {
            DataClassification = CustomerContent;

            trigger OnLookup()
            var
                COA: Record "G/L Account";
            begin
                COA.Reset();
                if Page.RunModal(0, COA) = Action::LookupOK then
                    if StrPos("Default Cash GL Acc. Filter", COA."No.") = 0 then
                        if "Default Cash GL Acc. Filter" <> '' then
                            "Default Cash GL Acc. Filter" += '|' + COA."No."
                        else
                            "Default Cash GL Acc. Filter" := COA."No.";
            end;
        }
        field(90013; "Default Bank GL Acc. Filter"; Code[50])
        {
            DataClassification = CustomerContent;

            trigger OnLookup()
            var
                COA: Record "G/L Account";
            begin
                COA.Reset();
                if Page.RunModal(0, COA) = Action::LookupOK then
                    if StrPos("Default Bank GL Acc. Filter", COA."No.") = 0 then
                        if "Default Bank GL Acc. Filter" <> '' then
                            "Default Bank GL Acc. Filter" += '|' + COA."No."
                        else
                            "Default Bank GL Acc. Filter" := COA."No.";
            end;
        }
        field(90014; "Internal Vendor No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
        field(90015; "TDS Branch Code"; Code[20])
        {
            Caption = 'TDS Branch Code';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('BRANCH'));
        }
        field(90016; "Teams Dimension"; Code[20])
        {
            TableRelation = Dimension;
            DataClassification = CustomerContent;
        }
        field(90017; "Employee Dimension"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Dimension;
        }
        field(90018; "LC G/L Account"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90019; "Check Budget"; boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90020; "PDC Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(90021; "BG No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(90022; "DO No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(90096; "LC No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(90024; "Loan Account Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(90025; "Enable Transaction Type"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90026; "Auto Sync IRD"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    var
        GL: Record "G/L Account";
        SelectionFilter: Codeunit SelectionFilterManagement;
}