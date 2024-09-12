codeunit 50112 "TDS Management NEP"
{
    // Permissions = tabledata "G/L Entry" = rim;
    // trigger OnRun()
    // begin
    // end;

    // var
    //     Vendor: Record Vendor;
    //     GLAccount: Record "G/L Account";
    //     TDSpostingGroup: Record "TDS Posting Group NEP";
    //     TDSEntry: Record "TDS Entry NEP";
    //     VendorName: Text[100];
    //     GLAccountName: Text[100];
    //     GLAccountNo: Code[20];

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeCheckGenJnlLine', '', false, false)]
    // local procedure OnBeforeCheckGenJnlLine(GenJnlLine: Record "Gen. Journal Line"; CheckLine: Boolean; var IsHandled: Boolean);
    // begin
    //     DocumentClassMandatoryforTDSPosting(GenJnlLine);
    // end;

    // local procedure DocumentClassMandatoryforTDSPosting(GenJnlLine: Record "Gen. Journal Line")
    // var

    // begin
    //     if (GenJnlLine."TDS Group" <> '') or (GenJnlLine."VAT %" <> 0) then
    //         GenJnlLine.TestField("External Document No.");
    // end;

    // procedure GetPurchaseTDSVendorName(GenJournalLine: Record "Gen. Journal Line")
    // begin
    //     Clear(VendorName);
    //     if GenJournalLine."TDS Group" <> '' then begin
    //         Vendor.Reset();
    //         if Vendor.FindFirst() then
    //             VendorName := Vendor.Name;
    //     end;
    // end;

    // procedure GetTDSGLCodeName(GenJournalLine: Record "Gen. Journal Line")
    // begin
    //     Clear(GLAccountNo);
    //     Clear(GLAccountName);

    //     if GenJournalLine."TDS Group" <> '' then begin
    //         TDSpostingGroup.Reset();
    //         TDSpostingGroup.SetRange(Code, GenJournalLine."TDS Group");
    //         if TDSpostingGroup.FindFirst() then begin
    //             GLAccountNo := TDSpostingGroup."GL Account No.";
    //             GLAccount.Reset();
    //             GLAccount.SetRange("No.", GLAccountNo);
    //             if GLAccount.FindFirst() then
    //                 GLAccountName := GLAccount.Name;
    //         end;
    //     end;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterSettingIsTransactionConsistent', '', true, true)]
    // local procedure OnAfterSettingIsTransactionConsistent(GenJournalLine: Record "Gen. Journal Line"; var IsTransactionConsistent: Boolean)
    // var
    //     GenJnlLine: record "Gen. Journal Line";
    // begin
    //     GenJnlLine.Reset();
    //     GenJnlLine.setrange("Journal Template Name", GenJournalLine."Journal Template Name");
    //     GenJnlLine.SetRange("Journal Batch Name", GenJournalLine."Journal Batch Name");
    //     GenJnlLine.SetRange("Document No.", GenJournalLine."Pre-Assigned No.");
    //     GenJnlLine.SetFilter("TDS Group", '<>%1', '');
    //     GenJnlLine.SetFilter("TDS Amount (LCY)", '<>%1', 0);
    //     // GenJnlLine.SetFilter("Account Type", '<>%1&<>%2', GenJnlLine."Account Type"::"Fixed Asset", GenJnlLine."Account Type"::Employee);
    //     if GenJnlLine.FindFirst() then begin
    //         IsTransactionConsistent := false;
    //         GenJnlLine.Reset();
    //         GenJnlLine.setrange("Journal Template Name", GenJournalLine."Journal Template Name");
    //         GenJnlLine.SetRange("Journal Batch Name", GenJournalLine."Journal Batch Name");
    //         GenJnlLine.SetRange("Document No.", GenJournalLine."Pre-Assigned No.");
    //         GenJnlLine.CalcSums("Amount (LCY)", "TDS Amount (LCY)");
    //         if GenJnlLine."Amount (LCY)" - GenJnlLine."TDS Amount (LCY)" = 0 then
    //             IsTransactionConsistent := true;
    //     end;
    // end;

    // procedure CalcTDSBalance(var GenJnlLine: Record "Gen. Journal Line"; LastGenJnlLine: Record "Gen. Journal Line"; var TDSBalance: Decimal; var TotalTDSBalance: Decimal; var ShowTDSBalance: Boolean; var ShowTotalTDSBalance: Boolean)
    // var
    //     GenJnlLine2: Record "Gen. Journal Line";
    // begin
    //     GenJnlLine2.CopyFilters(GenJnlLine);

    //     ShowTotalTDSBalance := GenJnlLine2.CalcSums("TDS Amount");
    //     if ShowTotalTDSBalance then begin
    //         if GenJnlLine."Bal. Account No." = '' then
    //             TotalTDSBalance := GenJnlLine2."TDS Amount"
    //         else
    //             TotalTDSBalance := 0;

    //         if GenJnlLine."Line No." = 0 then
    //             if GenJnlLine."Bal. Account No." = '' then
    //                 TotalTDSBalance := TotalTDSBalance + LastGenJnlLine."TDS Amount"
    //             else
    //                 TotalTDSBalance := 0;
    //     end;

    //     if GenJnlLine."Line No." <> 0 then begin
    //         GenJnlLine2.SetRange("Line No.", 0, GenJnlLine."Line No.");
    //         ShowTDSBalance := GenJnlLine2.CalcSums("TDS Amount");
    //         if ShowTDSBalance then
    //             if GenJnlLine."Bal. Account No." = '' then
    //                 TDSBalance := GenJnlLine2."TDS Amount"
    //             else
    //                 TDSBalance := 0;
    //     end else begin
    //         GenJnlLine2.SetRange("Line No.", 0, LastGenJnlLine."Line No.");
    //         ShowTDSBalance := GenJnlLine2.CalcSums("TDS Amount");
    //         if ShowTDSBalance then begin
    //             TDSBalance := GenJnlLine2."TDS Amount";
    //             GenJnlLine2.CopyFilters(GenJnlLine);
    //             GenJnlLine2 := LastGenJnlLine;
    //             if GenJnlLine2.Next() = 0 then
    //                 TDSBalance := TDSBalance + LastGenJnlLine."TDS Amount";
    //         end;
    //     end;
    // end;

    // procedure CalcTDSEntryTDSBalance(var ParmTDSEntryNep: Record "TDS Entry NEP"; LastTDSEntryNep: Record "TDS Entry NEP"; var TDSBalance: Decimal; var TotalTDSBalance: Decimal; var ShowTDSBalance: Boolean; var ShowTotalTDSBalance: Boolean)
    // var
    //     TDSEntry2: Record "TDS Entry NEP";
    // begin
    //     TDSEntry2.CopyFilters(TDSEntry);

    //     ShowTotalTDSBalance := TDSEntry2.CalcSums("TDS Amount");
    //     if ShowTotalTDSBalance then begin
    //         TotalTDSBalance := TDSEntry2."TDS Amount";
    //         if TDSEntry."Entry No." = 0 then
    //             TotalTDSBalance := TotalTDSBalance + LastTDSEntryNep."TDS Amount";
    //     end;

    //     if TDSEntry."Entry No." <> 0 then begin
    //         TDSEntry2.SetRange("Entry No.", 0, TDSEntry."Entry No.");
    //         ShowTDSBalance := TDSEntry2.CalcSums("TDS Amount");
    //         if ShowTDSBalance then
    //             TDSBalance := TDSEntry2."TDS Amount";
    //     end else begin
    //         TDSEntry2.SetRange("Entry No.", 0, LastTDSEntryNep."Entry No.");
    //         ShowTDSBalance := TDSEntry2.CalcSums("TDS Amount");
    //         if ShowTDSBalance then begin
    //             TDSBalance := TDSEntry2."TDS Amount";
    //             TDSEntry2.CopyFilters(TDSEntry);
    //             TDSEntry2 := LastTDSEntryNep;
    //             if TDSEntry2.Next() = 0 then
    //                 TDSBalance := TDSBalance + LastTDSEntryNep."TDS Amount";
    //         end;
    //     end;
    // end;

    // procedure CalcTDSEntryBaseBalance(var TDSEntry: Record "TDS Entry NEP"; LastTDSEntry: Record "TDS Entry NEP"; var BaseBalance: Decimal; var TotalBaseBalance: Decimal; var ShowBaseBalance: Boolean; var ShowTotalBaseBalance: Boolean)
    // var
    //     TDSEntry2: Record "TDS Entry NEP";
    // begin
    //     TDSEntry2.CopyFilters(TDSEntry);

    //     ShowTotalBaseBalance := TDSEntry2.CalcSums(Base);
    //     if ShowTotalBaseBalance then begin
    //         TotalBaseBalance := TDSEntry2.Base;
    //         if TDSEntry."Entry No." = 0 then
    //             TotalBaseBalance := TotalBaseBalance + LastTDSEntry.Base;
    //     end;

    //     if TDSEntry."Entry No." <> 0 then begin
    //         TDSEntry2.SetRange("Entry No.", 0, TDSEntry."Entry No.");
    //         ShowBaseBalance := TDSEntry2.CalcSums(Base);
    //         if ShowBaseBalance then
    //             BaseBalance := TDSEntry2.Base;
    //     end else begin
    //         TDSEntry2.SetRange("Entry No.", 0, LastTDSEntry."Entry No.");
    //         ShowBaseBalance := TDSEntry2.CalcSums(Base);
    //         if ShowBaseBalance then begin
    //             BaseBalance := TDSEntry2.Base;
    //             TDSEntry2.CopyFilters(TDSEntry);
    //             TDSEntry2 := LastTDSEntry;
    //             if TDSEntry2.Next() = 0 then
    //                 BaseBalance := BaseBalance + LastTDSEntry.Base;
    //         end;
    //     end;
    // end;

    // procedure GetNextTdsEntryNo(): Integer
    // begin
    //     exit(NextTdsEntryNo());
    // end;

    // procedure NextTdsEntryNo(): Integer
    // var
    //     TDSEntry1: Record "TDS Entry NEP";
    //     TDSEntryNo: Integer;
    // begin
    //     TDSEntry1.LockTable();
    //     TDSEntry1.Reset();
    //     if TDSEntry1.FindLast() then
    //         TDSEntryNo := TDSEntry1."Entry No." + 1
    //     else
    //         TDSEntryNo := 1;
    //     exit(TDSEntryNo);
    // end;

    // procedure SetTDSAmounts(var InvoicePostBuffer: Record "invoice posting buffer"; TotalTDSAmount: Decimal; TotalTDSBaseAmount: Decimal)
    // begin
    //     InvoicePostBuffer."TDS Amount" := TotalTDSAmount;
    //     InvoicePostBuffer."TDS Base Amount" := TotalTDSBaseAmount;
    // end;

    // procedure UpdateTDSFieldsSalesTDS(var SalesLine: Record "Sales Line"; var InvoicePostBuffer: Record "invoice posting buffer")
    // begin
    //     if SalesLine."TDS Group" <> '' then
    //         InvoicePostBuffer."TDS Group" := SalesLine."TDS Group";

    //     if SalesLine."TDS %" <> 0 then
    //         InvoicePostBuffer."TDS %" := SalesLine."TDS %";

    //     if SalesLine."TDS Type" <> SalesLine."TDS Type"::" " then
    //         InvoicePostBuffer."TDS Type" := SalesLine."TDS Type";
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertGLEntryBuffer', '', true, true)]
    // local procedure OnBeforeInsertGLEntryBufferGenJnlPostLine(var TempGLEntryBuf: Record "G/L Entry" temporary; var GenJournalLine: Record "Gen. Journal Line"; var BalanceCheckAmount: Decimal; var BalanceCheckAmount2: Decimal; var BalanceCheckAddCurrAmount: Decimal; var BalanceCheckAddCurrAmount2: Decimal; var NextEntryNo: Integer; var TotalAmount: Decimal; var TotalAddCurrAmount: Decimal)
    // var
    //     PostingDate: Date;
    //     Amount: Decimal;
    // begin
    //     PostingDate := GenJournalLine."Posting Date";
    //     Amount := -GenJournalLine."TDS Amount";

    //     if Abs(GenJournalLine."VAT Base Amount") = Abs(TempGLEntryBuf.Amount) then
    //         if PostingDate = NormalDate(PostingDate) then begin
    //             BalanceCheckAmount :=
    //               BalanceCheckAmount + Amount * ((PostingDate - 00000101D) mod 99 + 1);
    //             BalanceCheckAmount2 :=
    //               BalanceCheckAmount2 + Amount * ((PostingDate - 00000101D) mod 98 + 1);
    //         end else begin
    //             BalanceCheckAmount :=
    //               BalanceCheckAmount + Amount * ((NormalDate(PostingDate) - 00000101D + 50) mod 99 + 1);
    //             BalanceCheckAmount2 :=
    //               BalanceCheckAmount2 + Amount * ((NormalDate(PostingDate) - 00000101D + 50) mod 98 + 1);
    //         end;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Reverse", 'OnReverseOnBeforeFinishPosting', '', true, true)]
    // local procedure OnReverseOnBeforeFinishPosting(var ReversalEntry: Record "Reversal Entry"; var ReversalEntry2: Record "Reversal Entry"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; var GLRegister: Record "G/L Register")
    // var
    //     TDSEntry2: Record "TDS Entry NEP";
    // begin
    //     TDSEntry2.SetRange("Transaction No.", ReversalEntry."Transaction No.");
    //     ReverseTDS(TDSEntry2, ReversalEntry, ReversalEntry."Source Code", GenJnlPostLine);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Batch", 'OnAfterUpdateLineBalance', '', false, false)]
    // local procedure OnAfterUpdateLineBalance(var GenJournalLine: Record "Gen. Journal Line")
    // begin
    //     GenJournalLine."Balance (LCY)" -= GenJournalLine."TDS Amount";
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch. Post Invoice Events", 'OnPrepareLineOnBeforeSetAmounts', '', true, true)]
    // local procedure OnFillInvoicePostBufferOnAfterInitAmountsPurchPost(PurchLine: Record "Purchase Line"; PurchLineACY: Record "Purchase Line"; var InvoicePostingBuffer: Record "Invoice Posting Buffer" temporary)
    // begin
    //     SetTDSAccount(InvoicePostingBuffer, PurchLine);
    //     //TDS1.00

    //     if PurchLine.Quantity <> 0 then begin
    //         InvoicePostingBuffer."TDS Amount" := PurchLine."TDS Amount" / PurchLine.Quantity * PurchLine."Qty. to Invoice";
    //         InvoicePostingBuffer."TDS Base Amount" := PurchLine."TDS Base Amount" / PurchLine.Quantity * PurchLine."Qty. to Invoice";
    //         InvoicePostingBuffer."TDS Amount (ACY)" := PurchLineACY."TDS Amount" / PurchLine.Quantity * PurchLine."Qty. to Invoice";
    //         InvoicePostingBuffer."TDS Base Amount (ACY)" := PurchLineACY."TDS Base Amount" / PurchLine.Quantity * PurchLine."Qty. to Invoice";
    //     end else begin
    //         InvoicePostingBuffer."TDS Amount" := PurchLine."TDS Amount";
    //         InvoicePostingBuffer."TDS Base Amount" := PurchLine."TDS Base Amount";
    //         InvoicePostingBuffer."TDS Amount (ACY)" := PurchLineACY."TDS Amount";
    //         InvoicePostingBuffer."TDS Base Amount (ACY)" := PurchLineACY."TDS Base Amount";
    //     end;
    //     if PurchLine."Document Type" = PurchLine."Document Type"::"Credit Memo" then begin
    //         InvoicePostingBuffer."TDS Amount" := -InvoicePostingBuffer."TDS Amount";
    //         InvoicePostingBuffer."TDS Base Amount" := -InvoicePostingBuffer."TDS Base Amount";
    //         InvoicePostingBuffer."TDS Amount (ACY)" := -InvoicePostingBuffer."TDS Amount (ACY)";
    //         InvoicePostingBuffer."TDS Base Amount (ACY)" := -InvoicePostingBuffer."TDS Base Amount (ACY)";
    //     end;
    //     //TDS1.00
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInitQtyToInvoice', '', false, false)]
    // local procedure OnAfterInitQtyToInvoice(CurrFieldNo: Integer; var PurchLine: Record "Purchase Line")
    // begin
    //     PurchLine.ClearTDSFields();
    //     PurchLine.CalculateTDSAmount();
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Invoice Posting Buffer", 'OnUpdateOnBeforeModify', '', true, true)]
    // local procedure OnBeforeInvPostBufferModify(FromInvoicePostingBuffer: Record "Invoice Posting Buffer" temporary; var InvoicePostingBuffer: Record "Invoice Posting Buffer" temporary)
    // begin
    //     InvoicePostingBuffer."TDS Amount" += FromInvoicePostingBuffer."TDS Amount";
    //     InvoicePostingBuffer."TDS Base Amount" += FromInvoicePostingBuffer."TDS Base Amount";
    //     InvoicePostingBuffer."TDS Base Amount (ACY)" += FromInvoicePostingBuffer."TDS Base Amount (ACY)";
    //     InvoicePostingBuffer."TDS Amount (ACY)" += FromInvoicePostingBuffer."TDS Amount (ACY)";
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Invoice Posting Buffer", 'OnAfterPreparePurchase', '', true, true)]
    // local procedure OnAfterInvPostBufferPreparePurchase(var PurchaseLine: Record "Purchase Line"; var InvoicePostingBuffer: Record "Invoice Posting Buffer" temporary)
    // begin
    //     SetTDSAccount(InvoicePostingBuffer, PurchaseLine);
    //     if PurchaseLine."Document Type" = PurchaseLine."Document Type"::"Credit Memo" then
    //         SetTDSAmounts(InvoicePostingBuffer, -PurchaseLine."TDS Amount", -PurchaseLine."TDS Base Amount")
    //     else
    //         SetTDSAmounts(InvoicePostingBuffer, PurchaseLine."TDS Amount", PurchaseLine."TDS Base Amount");
    //     //SetTDSAmounts(InvoicePostBuffer, PurchaseLine."TDS Amount", PurchaseLine."TDS Base Amount");
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Invoice Posting Buffer", 'OnAfterCopyToGenJnlLine', '', false, false)]
    // local procedure OnAfterCopyToGenJnlLine(var GenJnlLine: Record "Gen. Journal Line"; InvoicePostingBuffer: Record "Invoice Posting Buffer" temporary);
    // begin
    //     CopyTDSFields(GenJnlLine, InvoicePostingBuffer);
    // end;

    // local procedure CopyTDSFields(var GenJnlLine: Record "Gen. Journal Line"; InvoicePostBuffer: Record "Invoice Posting Buffer")
    // begin
    //     GenJnlLine."TDS Group" := InvoicePostBuffer."TDS Group";
    //     GenJnlLine."TDS %" := InvoicePostBuffer."TDS %";
    //     GenJnlLine."TDS Type" := InvoicePostBuffer."TDS Type";
    //     GenJnlLine."TDS Amount" := InvoicePostBuffer."TDS Amount";
    //     GenJnlLine."TDS Base Amount" := InvoicePostBuffer."TDS Base Amount";
    //     GenJnlLine."TDS Amount (LCY)" := InvoicePostBuffer."TDS Amount";
    //     GenJnlLine."TDS Base Amount (LCY)" := InvoicePostBuffer."TDS Base Amount";
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch. Post Invoice Events", 'OnPostLinesOnAfterGenJnlLinePost', '', false, false)]
    // local procedure OnAfterPostInvPostBufferForFA(var GenJnlLine: Record "Gen. Journal Line"; TempInvoicePostingBuffer: Record "Invoice Posting Buffer" temporary; GLEntryNo: Integer; PreviewMode: Boolean; PurchHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    // var
    //     GLEntry: Record "G/L Entry";
    // begin
    //     if (GenJnlLine."TDS Group" <> '') and (GenJnlLine."Account Type" = GenJnlLine."Account Type"::"Fixed Asset") then begin
    //         InsertTDSEntry(GenJnlLine, GLEntry, GenJnlPostLine.GetNextTransactionNo());
    //         GLEntry."Entry No." := GenJnlPostLine.GetNextEntryNo();
    //         GenJnlPostLine.IncrNextEntryNo();
    //         GLEntry."Transaction No." := GLEntry."Transaction No.";
    //         GLEntry.Insert();
    //     end;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterPostVend', '', false, false)]
    // local procedure OnAfterPostVend(var GenJournalLine: Record "Gen. Journal Line"; var TempGLEntryBuf: Record "G/L Entry"; var NextEntryNo: Integer; var NextTransactionNo: Integer; Balancing: Boolean)
    // var
    //     GLEntry: Record "G/L Entry";
    // begin
    //     if GenJournalLine."TDS Group" = '' then
    //         exit;

    //     InsertTDSEntry(GenJournalLine, GLEntry, NextTransactionNo);
    //     GLEntry."Entry No." := NextEntryNo;
    //     NextEntryNo += 1;
    //     GLEntry."Transaction No." := NextTransactionNo;
    //     TempGLEntryBuf := GLEntry;
    //     TempGLEntryBuf.Insert(true);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterPostGLAcc', '', false, false)]
    // local procedure PostTDS(var GenJnlLine: Record "Gen. Journal Line"; var TempGLEntryBuf: Record "G/L Entry"; var NextEntryNo: Integer; var NextTransactionNo: Integer; Balancing: Boolean)
    // var
    //     GLEntry: Record "G/L Entry";
    // begin
    //     if GenJnlLine."TDS Group" = '' then
    //         exit;

    //     InsertTDSEntry(GenJnlLine, GLEntry, NextTransactionNo);
    //     GLEntry."Entry No." := NextEntryNo;
    //     NextEntryNo += 1;
    //     GLEntry."Transaction No." := NextTransactionNo;
    //     TempGLEntryBuf := GLEntry;
    //     TempGLEntryBuf.Insert(true);
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Reversal Entry", 'OnAfterInsertReversalEntry', '', false, false)]
    // local procedure OnAfterInsertReversalEntry(var TempRevertTransactionNo: Record "Integer"; Number: Integer; RevType: Option Transaction,Register; var NextLineNo: Integer; var TempReversalEntry: Record "Reversal Entry" temporary)
    // var
    //     ReversalEntry: Record "Reversal Entry";
    // begin
    //     ReversalEntry.InsertFromTDSEntry(TempReversalEntry, TempRevertTransactionNo, Number, RevType::Transaction, NextLineNo);
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Reversal Entry", 'OnAfterSetReverseFilter', '', false, false)]
    // local procedure OnAfterSetReverseFilter(Number: Integer; RevType: Option Transaction,Register; GLRegister: Record "G/L Register")
    // var
    //     TDSEntry2: Record "TDS Entry NEP";
    // begin
    //     if RevType = RevType::Transaction then begin
    //         TDSEntry2.SetCurrentKey("Transaction No.");
    //         TDSEntry2.SetRange("Transaction No.", Number);
    //     end;

    //     //tds from and to entry no. is not developed so cannot be used commented by Suman
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Reversal Entry", 'OnAfterCheckEntries', '', false, false)]
    // local procedure OnAfterCheckEntries(var MaxPostingDate: Date)
    // begin
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Reversal Entry", 'OnCheckGLAccOnBeforeTestFields', '', false, false)]
    // local procedure OnCheckGLAccOnBeforeTestFields(GLAcc: Record "G/L Account"; GLEntry: Record "G/L Entry"; var IsHandled: Boolean)
    // begin
    //     CheckTDS_PDC_Entries(GLEntry);
    // end;

    // [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnAfterNavigateFindRecords', '', false, false)]
    // local procedure OnAfterFindRecords(var DocumentEntry: Record "Document Entry"; DocNoFilter: Text; PostingDateFilter: Text)
    // var
    //     Navigate: Page Navigate;
    // begin
    //     Navigate.FindTDSEntries(DocumentEntry, DocNoFilter, PostingDateFilter);
    // end;

    // [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnAfterNavigateShowRecords', '', false, false)]
    // local procedure OnAfterNavigateShowRecords(TableID: Integer; DocNoFilter: Text; PostingDateFilter: Text; ItemTrackingSearch: Boolean; var TempDocumentEntry: Record "Document Entry" temporary; SalesInvoiceHeader: Record "Sales Invoice Header"; SalesCrMemoHeader: Record "Sales Cr.Memo Header"; PurchInvHeader: Record "Purch. Inv. Header"; PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; ServiceInvoiceHeader: Record "Service Invoice Header"; ServiceCrMemoHeader: Record "Service Cr.Memo Header"; ContactType: Enum "Navigate Contact Type"; ContactNo: Code[250]; ExtDocNo: Code[250])
    // var
    //     Navigate: Page Navigate;
    // begin
    //     Navigate.ShowTDSEntries(TableID, DocNoFilter, PostingDateFilter);
    // end;

    // //Purchase TDS
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterReverseAmount', '', false, false)]
    // local procedure OnAfterReverseAmount(var PurchLine: Record "Purchase Line")
    // begin
    //     purchline."TDS Amount" := -PurchLine."TDS Amount";
    //     PurchLine."TDS Base Amount" := -PurchLine."TDS Base Amount";
    // end;
    // //upanshu
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch. Post Invoice Events", 'OnPostLedgerEntryOnBeforeGenJnlPostLine', '', false, false)]
    // local procedure OnPostLedgerEntryOnBeforeGenJnlPostLine(var GenJnlLine: Record "Gen. Journal Line"; var PurchHeader: Record "Purchase Header"; var TotalPurchLine: Record "Purchase Line"; var TotalPurchLineLCY: Record "Purchase Line"; PreviewMode: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    // begin
    //     GenJnlLine.Amount := -(TotalPurchLine."Amount Including VAT" - TotalPurchLine."TDS Amount");
    //     GenJnlLine."Amount (LCY)" := -(TotalPurchLineLCY."Amount Including VAT" - TotalPurchLineLCY."TDS Amount");
    //     GenJnlLine."Source Currency Amount" := GenJnlLine.Amount;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch. Post Invoice Events", 'OnPostBalancingEntryOnBeforeGenJnlPostLine', '', false, false)]
    // local procedure OnPostBalancingEntryOnBeforeGenJnlPostLine(var GenJnlLine: Record "Gen. Journal Line"; var PurchHeader: Record "Purchase Header"; var TotalPurchLine: Record "Purchase Line"; var TotalPurchLineLCY: Record "Purchase Line"; PreviewMode: Boolean)
    // begin
    //     GenJnlLine.Amount := GenJnlLine.Amount - TotalPurchLine."TDS Amount";
    //     GenJnlLine."Source Currency Amount" := GenJnlLine.Amount;
    //     GenJnlLine."Amount (LCY)" := GenJnlLine."Amount (LCY)" - TotalPurchLineLCY."TDS Amount";
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnRoundAmountOnBeforeIncrAmount', '', true, true)]
    // local procedure OnRoundAmountOnBeforeIncrAmount(PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line"; PurchLineQty: Decimal; var TotalPurchLine: Record "Purchase Line"; var TotalPurchLineLCY: Record "Purchase Line")
    // var
    //     CurrExchRate: Record "Currency Exchange Rate";
    //     Usedate: Date;
    // begin
    //     if PurchaseHeader."Currency Code" <> '' then begin
    //         if PurchaseHeader."Posting Date" = 0D then
    //             Usedate := WorkDate
    //         else
    //             Usedate := PurchaseHeader."Posting Date";

    //         PurchaseLine."TDS Amount" :=
    //                   Round(
    //                     CurrExchRate.ExchangeAmtFCYToLCY(
    //                       Usedate, PurchaseHeader."Currency Code",
    //                       TotalPurchLine."TDS Amount", PurchaseHeader."Currency Factor")) -
    //                   TotalPurchLineLCY."TDS Amount";
    //         PurchaseLine."TDS Base Amount" :=
    //                 Round(
    //                     CurrExchRate.ExchangeAmtFCYToLCY(
    //                       Usedate, PurchaseHeader."Currency Code",
    //                       TotalPurchLine."TDS Base Amount", PurchaseHeader."Currency Factor")) -
    //                   TotalPurchLineLCY."TDS Base Amount";
    //     end;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterIncrAmount', '', false, false)]
    // local procedure OnAfterIncrAmount(var TotalPurchLine: Record "Purchase Line"; PurchLine: Record "Purchase Line")
    // begin
    //     if PurchLine.Quantity <> 0 then begin
    //         Increment(TotalPurchLine."TDS Base Amount", (PurchLine."TDS Base Amount" / PurchLine.Quantity * PurchLine."Qty. to Invoice"));
    //         Increment(TotalPurchLine."TDS Amount", (PurchLine."TDS Amount" / PurchLine.Quantity * PurchLine."Qty. to Invoice"));
    //     end else begin
    //         Increment(TotalPurchLine."TDS Base Amount", PurchLine."TDS Base Amount");
    //         Increment(TotalPurchLine."TDS Amount", PurchLine."TDS Amount");
    //     end;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterCheckAndUpdate', '', false, false)]
    // local procedure OnAfterCheckAndUpdate(var PurchaseHeader: Record "Purchase Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean)
    // var
    //     Currency: Record Currency;
    // begin
    //     if Currency.Get(PurchaseHeader."Currency Code") then;
    //     PurchaseHeader.CalculateTDS(Currency);
    // end;

    // //Sales TDS
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterReverseAmount', '', false, false)]
    // local procedure OnAfterReverseAmountSalesTDS(var SalesLine: Record "Sales Line")
    // begin
    //     SalesLine."TDS Amount" := -SalesLine."TDS Amount";
    //     SalesLine."TDS Base Amount" := -SalesLine."TDS Base Amount";
    // end;
    // //upanshu tds
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Post Invoice Events", 'OnPostLedgerEntryOnBeforeGenJnlPostLine', '', false, false)]
    // local procedure OnBeforePostCustomerEntry(var GenJnlLine: Record "Gen. Journal Line"; var SalesHeader: Record "Sales Header"; var TotalSalesLine: Record "Sales Line"; var TotalSalesLineLCY: Record "Sales Line"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    // begin
    //     GenJnlLine.Amount := -(TotalSalesLine."Amount Including VAT" - TotalSalesLine."TDS Amount");
    //     GenJnlLine."Amount (LCY)" := -(TotalSalesLine."Amount Including VAT" - TotalSalesLine."TDS Amount");
    //     GenJnlLine."Source Currency Amount" := GenJnlLine.Amount;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Post Invoice Events", 'OnPostBalancingEntryOnBeforeGenJnlPostLine', '', false, false)]
    // local procedure OnBeforePostBalancingEntrySalesTDS(SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var GenJnlLine: Record "Gen. Journal Line"; var TotalSalesLine: Record "Sales Line"; var TotalSalesLineLCY: Record "Sales Line")
    // begin
    //     GenJnlLine.Amount := GenJnlLine.Amount - TotalSalesLine."TDS Amount";
    //     GenJnlLine."Source Currency Amount" := GenJnlLine.Amount;
    //     GenJnlLine."Amount (LCY)" := GenJnlLine."Amount (LCY)" - TotalSalesLineLCY."TDS Amount";
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterIncrAmount', '', false, false)]
    // local procedure OnAfterIncrAmountSalesTDS(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; var TotalSalesLine: Record "Sales Line")
    // begin
    //     Increment(TotalSalesLine."TDS Base Amount", SalesLine."TDS Base Amount");
    //     Increment(TotalSalesLine."TDS Amount", SalesLine."TDS Amount");
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterCheckAndUpdate', '', false, false)]
    // local procedure OnAfterCheckAndUpdateSalesTDS(CommitIsSuppressed: Boolean; PreviewMode: Boolean; var SalesHeader: Record "Sales Header")
    // var
    //     Currency: Record Currency;
    // begin
    //     if Currency.Get(SalesHeader."Currency Code") then;
    //     SalesHeader.CalculateTDS(currency);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Post Invoice Events", 'OnPrepareLineOnAfterFillInvoicePostingBuffer', '', false, false)]
    // local procedure OnAfterFillInvoicePostBufferSalesTDS(var InvoicePostingBuffer: Record "Invoice Posting Buffer" temporary; SalesLine: Record "Sales Line")
    // begin
    //     SetTDSAccountSalesTDS(InvoicePostingBuffer, SalesLine);
    //     SetTDSAmounts(InvoicePostingBuffer, SalesLine."TDS Amount", SalesLine."TDS Base Amount");
    //     UpdateTDSFieldsSalesTDS(SalesLine, InvoicePostingBuffer);
    // end;

    // local procedure ReverseTDS(var TDSEntry: Record "TDS Entry NEP"; var TempReversedGLEntry: Record "Reversal Entry"; SourceCode: Code[10]; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    // var
    //     NewTDSEntry: Record "TDS Entry NEP";
    //     ReversedTDSEntry: Record "TDS Entry NEP";
    //     CannotReverseErr: Label 'You cannot reverse the transaction, because it has already been reversed.';
    // begin
    //     if TDSEntry.FindSet() then
    //         repeat
    //             if TDSEntry."Reversed by Entry No." <> 0 then
    //                 Error(CannotReverseErr);

    //             NewTDSEntry := TDSEntry;
    //             NewTDSEntry."Posting Date" := TempReversedGLEntry."Posting Date";
    //             NewTDSEntry.Base := -NewTDSEntry.Base;
    //             NewTDSEntry."TDS Amount" := -NewTDSEntry."TDS Amount";
    //             NewTDSEntry."Transaction No." := GenJnlPostLine.GetNextTransactionNo();
    //             NewTDSEntry."Source Code" := SourceCode;
    //             NewTDSEntry."User id" := CopyStr(UserId, 1, MaxStrLen(NewTDSEntry."User ID"));
    //             NewTDSEntry."Entry No." := NextTdsEntryNo();
    //             NewTDSEntry."Reversed Entry No." := TDSEntry."Entry No.";
    //             NewTDSEntry.Reversed := true;
    //             // Reversal of Reversal
    //             if TDSEntry."Reversed Entry No." <> 0 then begin
    //                 ReversedTDSEntry.Get(TDSEntry."Reversed Entry No.");
    //                 ReversedTDSEntry."Reversed by Entry No." := 0;
    //                 ReversedTDSEntry.Reversed := false;
    //                 ReversedTDSEntry.Modify();
    //                 TDSEntry."Reversed Entry No." := NewTDSEntry."Entry No.";
    //                 NewTDSEntry."Reversed by Entry No." := TDSEntry."Entry No.";
    //             end;

    //             TDSEntry."Reversed by Entry No." := NewTDSEntry."Entry No.";
    //             TDSEntry.Reversed := true;
    //             TDSEntry.Modify();
    //             NewTDSEntry.Insert();
    //         until TDSEntry.Next() = 0;
    // end;

    // local procedure SetTDSAccount(var InvoicePostBuffer: Record "Invoice Posting Buffer"; PurchLine: Record "Purchase Line")
    // begin
    //     if PurchLine."TDS Group" <> '' then begin
    //         InvoicePostBuffer."TDS Group" := PurchLine."TDS Group";
    //         InvoicePostBuffer."Additional Grouping Identifier" := PurchLine."TDS Group";
    //     end;

    //     if PurchLine."TDS %" <> 0 then begin
    //         InvoicePostBuffer."TDS %" := PurchLine."TDS %";
    //         PurchLine.TestField("TDS Group");
    //     end;

    //     if PurchLine."TDS Type" <> PurchLine."TDS Type"::" " then
    //         InvoicePostBuffer."TDS Type" := PurchLine."TDS Type";
    // end;

    // local procedure InsertTDSEntry(GenJnlLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry"; TransactionNo: Integer)
    // var
    //     TDSPostingGrp: Record "TDS Posting Group NEP";
    //     GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
    // begin
    //     TDSEntry.Init();
    //     TDSEntry.CopyFromGenJnlLine(GenJnlLine);
    //     TDSEntry."Entry No." := NextTdsEntryNo();
    //     TDSEntry.Insert(true);
    //     TDSPostingGrp.Get(GenJnlLine."TDS Group");
    //     GenJnlPostLine.InitGLEntry(GenJnlLine, GLEntry, TDSPostingGrp."GL Account No.", -GenJnlLine."TDS Amount", 0, false, true);
    //     GenJnlPostLine.InsertGLEntry(GenJnlLine, GLEntry, false);
    //     GLentry.UpdateDebitCredit(GenJnlLine.Correction);
    //     TDSEntry."Transaction No." := TransactionNo;
    //     TDSEntry.Modify(true);
    // end;

    // local procedure CheckTDS_PDC_Entries(GL_Entry: Record "G/L Entry")
    // var
    //     TDSEntryNotBlankErr: Label 'You cannot reverse the TDS Payment (Doc. No. %1) from this functionality. Please reverse it from TDS Entries Page.', Comment = '%1 = TDS Payment Document No';
    //     PDCEntryNotBlankErr: Label 'You cannot reverse the PDC Payment (Doc. No. %1) from this functionality. Please reverse it from PDC Entries Page.', comment = '%1 = PDS Payment Document No';
    // begin
    //     if (GL_Entry."TDS Entry No." <> 0) then
    //         Error(TDSEntryNotBlankErr, GL_Entry."Document No.");

    //     if GL_Entry."PDC Entry No." <> 0 then
    //         Error(PDCEntryNotBlankErr, GL_Entry."Document No.");
    // end;

    // local procedure Increment(var Number: Decimal; Number2: Decimal)
    // begin
    //     Number := Number + Number2;
    // end;

    // local procedure SetTDSAccountSalesTDS(var InvoicePostBuffer: Record "invoice posting buffer"; SalesLine: Record "Sales Line")
    // begin
    //     if SalesLine."TDS Group" <> '' then
    //         InvoicePostBuffer."TDS Group" := SalesLine."TDS Group";

    //     if SalesLine."TDS %" <> 0 then
    //         InvoicePostBuffer."TDS %" := SalesLine."TDS %";

    //     if SalesLine."TDS Type" <> SalesLine."TDS Type"::" " then
    //         InvoicePostBuffer."TDS Type" := SalesLine."TDS Type";
    // end;
}