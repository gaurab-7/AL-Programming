page 50107 PostedPurchaseCard

{
    ApplicationArea = All;
    Caption = 'PostedPurchaseCard';
    PageType = Card;
    SourceTable = PostedPurchaseHeader;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Details)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Buy From Vendor"; Rec."Buy From Vendor")
                {
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Purchase Lines")
            {
                part("Posted Purchase Line"; PostedPurchaseLineListPart)
                {
                    SubPageLink = "Document No" = field("No.");
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Print)
            {
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    PostedBillHdr: Record PostedPurchaseHeader;
                begin
                    // if PostedBillHdr.Get(Rec."Bill No") then
                    //    Report.Run(Report::"Bill Invoice", true, true, PostedBillHdr);

                    PostedBillHdr.Reset();
                    PostedBillHdr.SetRange("No.", Rec."No.");
                    if PostedBillHdr.FindFirst() then
                        Report.Run(Report::BillInvoiceReport, true, true, PostedBillHdr);
                end;
            }
        }
    }
}
