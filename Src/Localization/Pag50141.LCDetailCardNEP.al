page 50141 "LC Detail Card NEP"
{
    Caption = 'LC Detail Card';
    PageType = Card;
    SourceTable = "LC Details NEP";
    PromotedActionCategories = 'New,Process,Report,LC Amendment';
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = not Rec.Released;

                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Type field.';
                }
                field("Document Type"; rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';

                    trigger OnValidate()
                    begin
                        // CurrPage.Update(false);
                    end;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("LC\DO No."; Rec."LC\DO No.")
                {
                    ApplicationArea = All;
                    Caption = 'LC/BG/DO';
                    ToolTip = 'Specifies the value of the LC/BG/DO field.';

                    trigger OnValidate()
                    begin
                        //CurrPage.Update();
                    end;
                }
                field("LC Type"; Rec."LC Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Issued To/Received From"; Rec."Issued To/Received From")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued To/Received From field.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
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

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Issue Bank Name 1"; Rec."Issue Bank Name 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued Bank Name 1 field.';
                }
                field("Issue Bank Name 2"; Rec."Issue Bank Name 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issue Bank Name 2 field.';
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
                field("Tolerance Percentage"; Rec."Tolerance Percentage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tolerance Percentage field.';
                }
                field(Released; Rec.Released)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Released field.';
                }
                field("Has Amendment"; Rec."Has Amendment")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Has Amendment field.';
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
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                //field("Exchange Rate"; Rec."Exchange Rate")
                // {
                //    ApplicationArea = All;
                //    ToolTip = 'Specifies the value of the Exchange Rate field.';
                // }
            }
            group(Invoicing)
            {
                Editable = not Rec.Released;

                field("LC Value"; Rec."LC Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC Value field.';
                }
                field("LC Value (LCY)"; Rec."LC Value (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC Value (LCY) field.';
                }
                field("Purchase LC Utilised"; Rec."Purchase LC Utilised")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purchase LC Utilised field.';
                }
                field("Purchased LC Utilised (LCY)"; Rec."Purchased LC Utilised (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purchased LC Utilised (LCY) field.';
                }
                field("Revolving Cr. Limit Type"; Rec."Revolving Cr. Limit Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Revolving Cr. Limit Type field.';
                }
                field("Type of Credit Limit"; Rec."Type of Credit Limit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Credit Limit field.';
                }
            }
            group("LC Values")
            {
                Editable = not Rec.Released;

                field("Sales LC Utilised"; Rec."Sales LC Utilised")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales LC Utilised field.';
                }
                field("Utilized Value"; Rec."Utilized Value")
                {
                    ApplicationArea = all;
                    Caption = 'Utilized Value (LCY)';
                    ToolTip = 'Specifies the value of the Utilized Value (LCY) field.';
                }
                field("Document Value"; Rec."Document Value")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Document Value field.';
                }
                field("LC Margin"; Rec."LC Margin")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the LC Margin field.';
                }
                field("LC Charge"; Rec."LC Charge")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the LC Charge field.';
                }
                field("LC Commission"; Rec."LC Commission")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the LC Commission field.';
                }
                field(Notes; Rec.Notes)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Notes field.';
                }
            }
            group(Loan)
            {
                field("Loan No."; Rec."Loan No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Loan No. field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action("&Amendment")
            {
                Image = AdjustEntries;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = all;
                ToolTip = 'Executes the &Amendment action.';

                trigger OnAction()
                begin
                    Rec.AmendLC(Rec);
                end;
            }
            action("A&mendments")
            {
                Caption = 'Amendments List';
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = all;
                ToolTip = 'Executes the Amendments List action.';

                trigger OnAction()
                begin
                    LCAmendDetail.Reset();
                    LCAmendDetail.SetRange("No.", Rec."No.");
                    Page.Run(Page::"LC Amend Datails NEP", LCAmendDetail);
                end;
            }
            action("&Release")
            {
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                ToolTip = 'Executes the &Release action.';

                trigger OnAction()
                begin
                    Rec.TestField("Issuing Bank");
                    Rec.TestField("LC Value");
                    Rec.TestField("Date of Issue");
                    Rec.TestField("Expiry Date");
                    Rec.TestField("LC\DO No.");
                    Rec.ReleaseLC(Rec);
                end;
            }
            action("&Close")
            {
                Image = ClosePeriod;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                ToolTip = 'Executes the &Close action.';

                trigger OnAction()
                begin
                    Rec.CloseLC(Rec);
                end;
            }
            action(Reopen)
            {
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                ToolTip = 'Executes the Reopen action.';

                trigger OnAction()
                begin
                    Rec.ReopenLC(Rec);
                end;
            }
            action("LC Detail Report")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = 'Executes the LC Detail Report action.';

                trigger OnAction()
                var
                    LCDetail: Record "LC Details NEP";
                begin
                    LCDetail.SetRange("No.", Rec."No.");
                    Report.Run(Report::"LC Detail Trial Bal. NEP", true, true, LCDetail);
                end;
            }
        }
    }

    var
        LCAmendDetail: Record "LC Amend Detail NEP";
}