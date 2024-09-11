codeunit 50108 CueCodeunit
{
    procedure GetCue(var Active: integer; var Expired: Integer; var PreDate: Integer)
    var
        TransferHeader: Record "Transfer Header";
        count: Integer;
    // Active: Integer;
    // Expired: Integer;
    // CueTable: Record CueTable;
    begin
        // CueTable.DeleteAll();
        count := 0;
        TransferHeader.Reset();
        TransferHeader.SetFilter("Start Date", '<1/15/2024');
        TransferHeader.SetFilter("End Date", '>1/15/2024');
        if TransferHeader.FindSet() then
            repeat begin
                count := count + 1;
            end;
            until TransferHeader.Next() = 0;

        Active := count;
        // CueTable.Active := count;
        // CueTable.Modify();

        count := 0;
        TransferHeader.Reset();
        TransferHeader.SetFilter("Start Date", '>1/15/2024');
        if TransferHeader.FindSet() then
            repeat
            begin
                count := count + 1;
            end;
            until TransferHeader.Next() = 0;

        PreDate := count;
        // CueTable.Expired := count;
        // CueTable.Modify();

        count := 0;
        TransferHeader.Reset();
        TransferHeader.SetFilter("End Date", '<1/15/2024');
        if TransferHeader.FindSet() then
            repeat
            begin
                count := count + 1;
            end;
            until TransferHeader.Next() = 0;

        Expired := count;
        // CueTable.Expired := count;
        // CueTable.Modify();
    end;
}
