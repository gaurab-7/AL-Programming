codeunit 50101 PostCodeUnit
{
    procedure PostCodeUnit()
    var
        custTable: Record customertable;
        postTable: Record postingtable;

    begin
        if custTable.FindSet() then
            repeat
                // postTable.ID := custTable.ID;
                // postTable.Address := custTable.Address;
                // postTable.Company := custTable.Company;
                // postTable.UserName := custTable.Name;
                // Clear(postTable);
                postTable.TransferFields(custTable);
                postTable.Insert();
            until custTable.Next() = 0;
    end;
}