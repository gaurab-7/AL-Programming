pageextension 50101 PurchaseOrderExt extends "Purchase Order"
{
    actions
    {
        addafter(Post)
        {
            action(Postt)
            {
                ApplicationArea = All;
                PromotedCategory = Process;
                Promoted = true;
                PromotedIsBig = true;
                Image = Post;
                trigger OnAction()
                var
                    BillMgt: Codeunit PurchaseCodeUnit;
                begin
                    if not Confirm('Do you want to post?', false) then
                        exit;
                    BillMgt.PostPurchToPostedPurch(Rec."No.", Rec."Document Type");
                    Message('Document has been Posted');
                end;
            }
        }
    }
}
