page 50139 "TDS Posting Group NEP"
{
    PageType = List;
    SourceTable = "TDS Posting Group NEP";
    Caption = 'TDS Posting Group';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("IRD Code"; rec."IRD Code")
                {
                    ApplicationArea = All;
                    Caption = 'IRD Code';
                    ToolTip = 'Specifies the value of the IRD Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("TDS %"; Rec."TDS %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TDS % field.';
                }
                field("GL Account No."; Rec."GL Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the GL Account No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Effective From"; Rec."Effective From")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Effective From field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }
}