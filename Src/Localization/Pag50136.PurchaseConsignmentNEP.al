page 50136 "Purchase Consignment NEP"
{
    ApplicationArea = All;
    Caption = 'Purchase Consignment';
    PageType = List;
    SourceTable = "Purchase Consignment NEP";
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
                field("Commercial Invoice No."; Rec."Commercial Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Commercial Invoice No. field.';
                }
                field("Vendor Code"; Rec."Vendor Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Code field.';
                }
                field(PragyapanPatra; Rec.PragyapanPatra)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PragyapanPatra field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Purchase Consginment Date"; Rec."Purchase Consginment Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Purchase Consginment Date field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Posted Document List")
            {
                action("Posted Purchase Invoices List")
                {
                    Image = Invoice;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Posted Purchase Invoices List action.';

                    trigger OnAction()
                    begin
                        PurchaseInvoices.Reset();
                        PurchaseInvoices.SetRange("Purchase Consignment No.", Rec."No.");
                        if PurchaseInvoices.FindFirst() then begin
                            PostedPurchaseInvoice.SETTABLEVIEW(PurchaseInvoices);
                            PostedPurchaseInvoice.Run();
                        end;
                    end;
                }
                action("Posted Purchase Credit Memos List")
                {
                    ApplicationArea = All;
                    ToolTip = 'Executes the Posted Purchase Credit Memos List action.';

                    trigger OnAction()
                    begin
                        PurchaseCreditmemos.Reset();
                        PurchaseCreditmemos.SetRange("Purchase Consignment No.", Rec."No.");
                        if PurchaseCreditmemos.FindFirst() then begin
                            PostedPurchaseCreditmemo.SETTABLEVIEW(PurchaseCreditmemos);
                            PostedPurchaseCreditmemo.Run();
                        end;
                    end;
                }
            }
            group(Create)
            {
                action("Create PragyapanPatra")
                {
                    Image = Ledger;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Create PragyapanPatra action.';

                    trigger OnAction()
                    begin
                        if not Rec.Blocked then begin
                            PragyapanPatraRec.Reset();
                            PragyapanPatraList.SETTABLEVIEW(PragyapanPatrarec);
                            PragyapanPatraList.Run();
                        end
                    end;
                }
            }
            group("Document List")
            {
            }
        }
    }

    var
        PurchaseInvoices: Record "Purch. Inv. Header";
        PurchaseCreditmemos: Record "Purch. Cr. Memo Hdr.";
        PragyapanPatraRec: Record "PragyapanPatra NEP";
        PostedPurchaseInvoice: Page "Posted Purchase Invoice";
        PostedPurchaseCreditmemo: Page "Posted Purchase Credit Memo";
        PragyapanPatraList: Page "PragyapanPatra NEP";
}