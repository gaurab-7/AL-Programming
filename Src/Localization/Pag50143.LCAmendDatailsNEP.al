page 50143 "LC Amend Datails NEP"
{
    ApplicationArea = All;
    Caption = 'LC Amend Details';
    PageType = List;
    SourceTable = "LC Amend Detail NEP";
    UsageCategory = Lists;
    Editable = false;
    InsertAllowed = false;
    CardPageId = "LC Amend Detail Card NEP";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Version No."; Rec."Version No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Version No. field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("LC No."; Rec."LC No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Type field.';
                }
                field("Issued To/Received From"; Rec."Issued To/Received From")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued To/Received From field.';
                }
                field("Issuing Bank"; Rec."Issuing Bank")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issuing Bank field.';
                }
                field("Date of Issue"; Rec."Date of Issue")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Issue field.';
                }
            }
        }
    }
}