table 50124 "English-Nepali Date NEP"
{
    Caption = 'English-Nepali Date';
    DrillDownPageId = "English-Nepali Date NEP";
    LookupPageID = "English-Nepali Date NEP";
    DataClassification = CustomerContent;

    fields
    {
        field(90000; "English Year"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(90001; "English Month"; Enum "English Month NEP")
        {
            DataClassification = CustomerContent;
        }
        field(90002; "English Day"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(90003; Week; Enum "Week Day NEP")
        {
            DataClassification = CustomerContent;
        }
        field(90004; "English Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(90005; "Week Integer"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(90006; "Day Off"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90055; "Nepali Date"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(90008; "Nepali Year"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(90009; "Nepali Month"; Enum "Nepali Month NEP")
        {
            DataClassification = CustomerContent;
        }
        field(90010; "Nepali Day"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(90011; "Fiscal Year"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(90012; "Floating Holiday"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90013; Description; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(90014; "Open Date for Appraisal"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90015; "Close Date for Appraisal"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90016; "Opening Fiscal Year"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90017; "Closing Fiscal Year"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Nepali Year", "English Year", "English Month", "English Day", "Fiscal Year", "Nepali Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "English Date", "Nepali Date", "Fiscal Year")
        {
        }
    }

    procedure getNepaliMonth(EngDate: Date): Text[100]
    var
        EnglishNepaliDateNEP: Record "English-Nepali Date NEP";
    begin
        EnglishNepaliDateNEP.Reset();
        EnglishNepaliDateNEP.SetRange("English Date", EngDate);
        if EnglishNepaliDateNEP.FindFirst() then
            exit(Format(EnglishNepaliDateNEP."Nepali Month"));
    end;

    procedure getNepaliDate(EngDate: Date): Code[10]
    var
        EnglishNepaliDateNEP: Record "English-Nepali Date NEP";
    begin
        EnglishNepaliDateNEP.Reset();
        EnglishNepaliDateNEP.SetRange("English Date", EngDate);
        if EnglishNepaliDateNEP.FindFirst() then
            exit(EnglishNepaliDateNEP."Nepali Date");
    end;

    procedure getEngDate(NepDate: Code[20]): Date
    var
        EnglishNepaliDateNEP: Record "English-Nepali Date NEP";
    begin
        EnglishNepaliDateNEP.Reset();
        EnglishNepaliDateNEP.SetRange("Nepali Date", NepDate);
        if EnglishNepaliDateNEP.FindFirst() then
            exit(EnglishNepaliDateNEP."English Date");
    end;

    procedure GetNepaliYear(EngDate: Date): Integer
    var
        EnglishNepaliDateNEP: Record "English-Nepali Date NEP";
    begin
        EnglishNepaliDateNEP.Reset();
        EnglishNepaliDateNEP.SetRange("English Date", EngDate);
        if EnglishNepaliDateNEP.FindFirst() then
            exit(EnglishNepaliDateNEP."Nepali Year");
    end;

    procedure GetEnglishYear(EngDate: Date): Integer
    var
        EnglishNepaliDateNEP: Record "English-Nepali Date NEP";
    begin
        EnglishNepaliDateNEP.Reset();
        EnglishNepaliDateNEP.SetRange("English Date", EngDate);
        if EnglishNepaliDateNEP.FindFirst() then
            exit(EnglishNepaliDateNEP."English Year");
    end;

    procedure getNepaliMonthEnum(EngDate: Date): Enum "Nepali Month NEP"
    var
        EnglishNepaliDateNEP: Record "English-Nepali Date NEP";
    begin
        EnglishNepaliDateNEP.Reset();
        EnglishNepaliDateNEP.SetRange("English Date", EngDate);
        if EnglishNepaliDateNEP.FindFirst() then
            exit(EnglishNepaliDateNEP."Nepali Month");
    end;
}