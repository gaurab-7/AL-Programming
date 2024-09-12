page 50140 "LC Details NEP"
{
    ApplicationArea = All;
    Caption = 'LC/BG/DO Details';
    PageType = List;
    SourceTable = "LC Details NEP";
    CardPageId = "LC Detail Card NEP";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("LC\DO No."; Rec."LC\DO No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC\DO No. field.';
                }
                field("Issued To/Received From"; Rec."Issued To/Received From")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued To/Received From field.';
                }
                field("Issued To/Received From Name"; Rec."Issued To/Received From Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued To/Received From Name field.';
                }
                field(Units; Rec.Units)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Units field.';
                }
                field("Utilized Value"; Rec."Utilized Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Utilized Value field.';
                }
                field("LC Value"; Rec."LC Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC Value field.';
                }
                field("Date of Issue"; Rec."Date of Issue")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Issue field.';
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Type field.';
                }
                field("LC Type"; Rec."LC Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC Type field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field(Released; Rec.Released)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Released field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("LC Value (LCY)"; Rec."LC Value (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC Value (LCY) field.';
                }
                field("Sales LC Utilised"; Rec."Sales LC Utilised")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales LC Utilised field.';
                }
                field("Remaining Value (LCY)"; Rec."Remaining Value (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remaining Value (LCY) field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    var
    begin

    end;
}