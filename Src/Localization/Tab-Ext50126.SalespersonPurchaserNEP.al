tableextension 50126 "Salesperson/Purchaser NEP" extends "Salesperson/Purchaser"
{
    fields
    {
        field(90000; Level; Option)
        {
            OptionMembers = " ",Representative,"Area Manager","Country Manager";
            OptionCaption = ' ,Representative,Area Manager,Country Manager';
            DataClassification = CustomerContent;
        }
        field(90001; Team; Code[10])
        {
            Caption = 'Team';
            DataClassification = CustomerContent;
        }
        field(90002; "Regional Manager"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup";
        }
        field(90003; "Country Manager"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup";
        }
        field(90004; Type; Enum "SalesPerson/Purchaser NEP")
        {
            DataClassification = CustomerContent;
        }
        modify(Code)
        {
            trigger OnAfterValidate()
            begin
                CreateDimension();
            end;
        }
        modify(Name)
        {
            trigger OnAfterValidate()
            begin
                CreateDimension();
            end;
        }
    }

    trigger OnInsert()
    begin
        CreateDimension();
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        DimValue: Record "Dimension Value";
        DefaultDimension: Record "Default Dimension";
        DimName: Text[50];

    procedure CreateDimension()
    begin
        SalesSetup.Get();

        SalesSetup.TestField("Salesperson Dimension Code");
        DimName := CopyStr((Name), 1, 50);

        DimValue.Reset();
        DimValue.SetRange("Dimension Code", SalesSetup."Salesperson Dimension Code");
        DimValue.SetRange(Code, Code);
        if not DimValue.FindFirst() then begin
            DimValue.Init();
            DimValue.Validate(Code, Code);
            DimValue.Validate("Dimension Code", SalesSetup."Salesperson Dimension Code");
            DimValue.Validate(Name, DimName);
            DimValue.Insert(true);
        end else
            if DimValue.Name <> Name then begin
                DimValue.Validate(Name, DimName);
                DimValue.Modify();
            end;

        DefaultDimension.Reset();
        DefaultDimension.SetRange("No.", Code);
        DefaultDimension.SetRange("Dimension Value Code", Code);
        DefaultDimension.SetRange("Dimension Code", SalesSetup."Salesperson Dimension Code");
        if not DefaultDimension.FindFirst() then begin
            DefaultDimension.Init();
            DefaultDimension."No." := Code;
            DefaultDimension.Validate("Dimension Code", SalesSetup."Salesperson Dimension Code");
            DefaultDimension.Validate("Dimension Value Code", Code);
            DefaultDimension.Validate("Value Posting", DefaultDimension."Value Posting"::"Same Code");
            DefaultDimension.Validate("Table ID", Database::"Salesperson/Purchaser");
            DefaultDimension.Insert(true);
        end;
    end;
}