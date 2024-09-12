page 50142 "LC Amend Detail Card NEP"
{
    Caption = 'LC Amend Detail Card';
    PageType = Card;
    SourceTable = "LC Amend Detail NEP";
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = DocumentEditable;

                field("Version No."; Rec."Version No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Version No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("LC Type"; Rec."LC Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC Type field.';
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
                field("Issued To/Received From Name"; Rec."Issued To/Received From Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued To/Received From Name field.';
                }
                field("Issuing Bank"; Rec."Issuing Bank")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issuing Bank field.';
                }
                field("Issue Bank Name 1"; Rec."Issue Bank Name 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issue Bank Name 1 field.';
                }
                field("Issue Bank name 2"; Rec."Issue Bank name 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issue Bank name 2 field.';
                }
                field("Receiving Bank"; Rec."Receiving Bank")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receiving Bank field.';
                }
                field("Receiving Bank Name"; Rec."Receiving Bank Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receiving Bank Name field.';
                }
                field(Released; Rec.Released)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Released field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Date of Issue"; Rec."Date of Issue")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Issue field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shipment Date field.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field("Bank Ammend No."; Rec."Bank Ammend No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Ammend No. field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exchange Rate field.';
                }
            }
            group(Invoicing)
            {
                Editable = DocumentEditable;

                field("LC Value"; Rec."LC Value")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the LC Value field.';
                }
                field("LC Value (LCY)"; Rec."LC Value (LCY)")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the LC Value (LCY) field.';
                }
                field("Amended Value"; Rec."Amended Value")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Amend Value field.';
                }
                field("Previous LC Value"; Rec."Previous LC Value")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Previous LC Value field.';
                }
                field("Purchase LC Utilised Value"; Rec."Purchase LC Utilised Value")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Purchase LC Utilised Value field.';
                }
                field("Sales LC Utilised Value"; Rec."Sales LC Utilised Value")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Sales LC Utilised Value field.';
                }
                field("Remaining Value"; Rec."LC Value (LCY)" - Rec."Purchase LC Utilised Value" - Rec."Sales LC Utilised Value")
                {
                    Caption = 'Remaining Value';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the LC Value (LCY) - Rec.Purchase LC Utilised Value - Rec.Sales LC Utilised Value field.';
                }
            }
            group(Remark)
            {
                Editable = DocumentEditable;

                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Release)
            {
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                Enabled = DocumentEditable;
                ToolTip = 'Executes the Release action.';

                trigger OnAction()
                begin
                    if Rec.Released = false then begin
                        if Confirm('Do you want to release the document?') then begin
                            Rec.Released := true;
                            Rec.Modify();
                        end;
                    end else
                        Message('Document already released!');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DocumentEditable := not Rec.Released;
    end;

    var
        DocumentEditable: Boolean;
}