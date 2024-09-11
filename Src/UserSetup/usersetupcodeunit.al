codeunit 50105 UserSetupCodeUnit
{
    procedure CheckIfUserCanPostBill(): Boolean
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        if UserSetup."Allow Bill Post" then
            exit(true)
        else
            exit(false);
    end;

    procedure PostBilltoPostedBill(BillCode: Code[20]; VendorCode: Code[20])
    var
        BillHeader: Record Table1;
        PurchAndRec: Record "Purchases & Payables Setup";

    begin
        if not CheckIfUserCanPostBill then
            Error('Access Denied');
        PurchAndRec.Get();
        if BillHeader.Get(BillCode) then begin
            BillHeader.TestField("Sell To Customer");
            if BillHeader.Type = BillHeader.Type::" " then
                Error('Type is mandatory to select before posting.');
        end;
    end;
}