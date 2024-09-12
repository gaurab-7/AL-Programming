table 50125 "TDS Posting Group NEP"
{
    Caption = 'TDS Posting Group';
    DataClassification = CustomerContent;
    DrillDownPageId = "TDS Posting Group NEP";
    LookupPageId = "TDS Posting Group NEP";

    fields
    {
        field(90000; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(90062; "TDS %"; Decimal)
        {
            Caption = 'TDS %';
            DataClassification = CustomerContent;
        }
        field(90002; "GL Account No."; Code[20])
        {
            Caption = 'GL Account No.';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(90003; Type; Option)
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
            OptionMembers = " ","Purchase TDS","Sales TDS";
        }
        field(90004; "Effective From"; Date)
        {
            Caption = 'Effective From';
            DataClassification = CustomerContent;
        }
        field(90005; Blocked; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = CustomerContent;
        }
        field(90006; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(90007; "IRD Code"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'IRD Code';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, "IRD Code", "TDS %", Description)
        {
        }
        fieldgroup(Brick; Code, "IRD Code", "TDS %", Description)
        {
        }
    }

    procedure FindTDSGroup(TDSGroup: Code[20]; EffectiveDate: Date): Boolean
    begin
        Reset();
        SetRange(Code, TDSGroup);
        SetRange(Blocked, false);
        exit(FindLast());
    end;
}