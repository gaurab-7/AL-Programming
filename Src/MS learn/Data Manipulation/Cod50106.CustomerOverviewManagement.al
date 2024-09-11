codeunit 50106 "Customer Overview Management"
{
    trigger OnRun()
    var
        CustomerOverview: Record "Customer Overview";
        customer: Record Customer;
        SourceCode: Record "Source Code";
        GLEntry: Record "G/L Entry";
        NextEntryNo: Integer;
    begin
        Clear(SourceCode);
        Clear(CustomerOverview);
        Clear(GLEntry);

        if CustomerOverview.FindLast() then
            NextEntryNo := CustomerOverview."Entry No." + 1
        else
            NextEntryNo := 1;

        if SourceCode.FindSet() then
            repeat
                if customer.FindSet() then
                    repeat
                        GLEntry.SetRange("Source Type", GLEntry."Source Type"::Customer);
                        GLEntry.SetRange("Source Code", SourceCode.Code);
                        GLEntry.SetRange("Source No.", customer."No.");
                        if GLEntry.FindSet() then begin
                            GLEntry.CalcSums(GLEntry.Amount);
                            CustomerOverview."Entry No." := NextEntryNo;
                            CustomerOverview."Customer No." := customer."No.";
                            CustomerOverview."Customer Name" := customer.Name;
                            CustomerOverview."Source Code" := SourceCode.Code;
                            CustomerOverview.Amount := GLEntry.Amount;
                            CustomerOverview.LastRunDate := CurrentDateTime();
                            CustomerOverview.Insert();
                            NextEntryNo += 1;
                        end;
                    until customer.Next() = 0;
            until SourceCode.Next() = 0
    end;
}
