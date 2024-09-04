codeunit 50109 TLoan
{
    [EventSubscriber(ObjectType::Table, Database::"Transfer Header", 'OnInitInsertOnBeforeInitSeries', '', false, false)]
    local procedure OnInitInsertOnBeforeInitSeries(sender: Record "Transfer Header"; var xTransferHeader: Record "Transfer Header"; var IsHandled: Boolean)
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if sender.TLoan then begin
            IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Header", 'OnAfterInitRecord', '', false, false)]
    local procedure OnBeforeInitInsert(var TransferHeader: Record "Transfer Header")
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if TransferHeader.TLoan then begin
            GeneralLedgerSetup.Get();
            GeneralLedgerSetup.TestField("T-Loan No. Series");
            TransferHeader."No." := NoSeriesMgt.GetNextNo(GeneralLedgerSetup."T-Loan No. Series", WorkDate(), true)
            // NoSeriesMgt.InitSeries(GeneralLedgerSetup."T-Loan No. Series", GeneralLedgerSetup."T-Loan No. Series", 0D, TransferHeader."No.", TransferHeader."No. Series");
        end;
    end;
}
