codeunit 50100 PurchaseCodeUnit
{
    procedure PostPurchToPostedPurch(PurchCode: Code[20]; doctype: Option)
    var
        PurchaseHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        PostedPurchaseHeader: Record PostedPurchaseHeader;
        PostedPurchaseLine: Record PostedPurchaseLine;
        LocalAmtAfterTax: Decimal;
        PurchAndRec: Record "Purchases & Payables Setup";
        Item: Record Item;
        totalAmount: Decimal;

    begin
        PurchAndRec.Get();
        if PurchaseHeader.Get(doctype, PurchCode) then begin
            PurchaseHeader.TestField("Buy-from Vendor No.");
            PostedPurchaseHeader.Init();
            PostedPurchaseHeader.TransferFields(PurchaseHeader);
            PostedPurchaseHeader.Insert(true);
            PostedPurchaseHeader."Received By" := PurchaseHeader."Purchaser Code";
            PostedPurchaseHeader.Modify();
            Clear(totalAmount);
            PurchLine.Reset();
            PurchLine.SetRange("Document No.", PurchaseHeader."No.");
            if PurchLine.FindSet() then
                repeat
                    PostedPurchaseLine.Init();
                    PostedPurchaseLine.TransferFields(PurchLine);
                    TaxCalculation(LocalAmtAfterTax, PurchLine.Amount);
                    PostedPurchaseLine."Amount after Tax" := LocalAmtAfterTax;
                    PostedPurchaseLine.Insert();
                    // InsertIntoPurchLedger(PurchLine, LocalAmtAfterTax);
                    totalAmount += PurchLine.Amount;
                until PurchLine.Next() = 0;
            PurchLine.SetRange("Document No.", Item."No.");
            PostedPurchaseHeader."Total Amount" := totalAmount;
            // PostedPurchaseHeader."Amount After Tax" := totalAmount + (totalAmount * (PurchAndRec."Purchase Tax %"));
            PostedPurchaseHeader."Amount After Tax" := totalAmount + (totalAmount * 0.13);
            PostedPurchaseHeader.Modify();
            PurchLine.DeleteAll();
            PurchaseHeader.Delete(true);
        end;
    end;

    procedure TaxCalculation(var AmtAfterTax: Decimal; lineAmt: Decimal)
    var
        PurchAndPay: Record "Purchases & Payables Setup";
    begin
        PurchAndPay.Get();
        // AmtAfterTax := (PurchAndPay."Purchase Tax %" / 100)  * lineAmt + lineAmt;
        AmtAfterTax := 0.13 * lineAmt + lineAmt;
        // AmtAfterTax := 0.13 * lineAmt + lineAmt;
    end;
}