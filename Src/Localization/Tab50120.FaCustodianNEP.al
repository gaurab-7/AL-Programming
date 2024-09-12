table 50120 "Fa Custodian NEP"
{
    DataClassification = CustomerContent;
    Caption = 'FA custodian';

    fields
    {
        field(90000; "FA No."; Code[20])
        {
            TableRelation = "Fixed Asset";
            DataClassification = CustomerContent;
        }
        field(90001; "Employee No."; Code[20])
        {
            TableRelation = Employee;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get("Employee No.") then
                    "Employee Name" := CopyStr(Emp.FullName(), 1, 50)
                else
                    "Employee Name" := '';
            end;
        }
        field(90002; "Employee Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90003; "FA Description"; Text[100])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Fixed Asset".Description where("No." = field("FA No.")));
        }
        field(90004; "Reason"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(90013; "Remarks"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(90006; "Date of Transfer"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(90007; "Department Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Dimension Code" = field("Department Dimension"));
        }
        field(90008; Branch; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Dimension code" = field("Branch Dimension"));
        }
        field(90009; "Current Owner"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90010; Posted; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90011; "Date of Ownership"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ("Date of Ownership" <> 0D) and ("Date of Ownership" > Today) then
                    Error('Cannot fill date of ownership in future date.');
            end;
        }
        field(90012; "Branch Dimension"; Code[20])
        {
            TableRelation = Dimension;
            DataClassification = CustomerContent;
        }
        field(90005; "Department Dimension"; Code[20])
        {
            TableRelation = Dimension;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "FA No.", "Employee No.", "Date of Ownership")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        FACustodianNEP.Reset();
        FACustodianNEP.SetRange("FA No.", "FA No.");
        FACustodianNEP.SetRange("Current Owner", true);
        if FACustodianNEP.FindFirst() then
            if FACustodianNEP."Employee No." <> "Employee No." then begin
                FACustodianNEP."Current Owner" := false;
                FACustodianNEP."Date of Transfer" := "Date of Ownership";
                FACustodianNEP.Modify();
            end;

        FASetup.Get();
        "Department Dimension" := FASetup."Department Dimension";
        "Branch Dimension" := FASetup."Branch Dimension";
    end;

    trigger OnDelete()
    begin
        if Posted then
            Error('posted records cannot be modified');
    end;

    trigger OnRename()
    begin
        FACustodianNEP."Date of Transfer" := "Date of Ownership";
    end;

    var
        FACustodianNEP: Record "Fa Custodian NEP";
        FASetup: Record "FA Setup";

    procedure Post()
    var
        FixedAsset: Record "Fixed Asset";
    begin
        if not Confirm('Confirm Post?', false) then
            exit;

        if Rec.Posted then
            Rec.TestField(Posted, false);

        OnBeforePostFACust(Rec);

        FACustodianNEP.Reset();
        FACustodianNEP.SetRange("FA No.", Rec."FA No.");
        FACustodianNEP.SetFilter("Employee No.", '<>%1', Rec."Employee No.");
        if FACustodianNEP.FindFirst() then
            repeat
                FACustodianNEP."Current Owner" := false;
                FACustodianNEP.Modify();
            until FACustodianNEP.Next() = 0;

        Rec.Posted := true;
        Rec."Current Owner" := true;
        Rec.Modify();

        if FixedAsset.Get(Rec."FA No.") then
            FixedAsset.Validate("Responsible Employee", Rec."Employee No.")
        else
            FixedAsset."Responsible Employee" := '';

        OnAfterPostFACust(Rec, FixedAsset);
        FixedAsset.Modify();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePostFACust(var FACustodianNEP: Record "Fa Custodian NEP")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPostFACust(var FACustodianNEP: Record "Fa Custodian NEP"; FixedAsset: Record "Fixed Asset")
    begin
    end;
}