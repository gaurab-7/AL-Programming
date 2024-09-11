codeunit 50102 "Inventory Code Unit"
{
    procedure purchase(ItmNo: Code[50]; Quantity: Integer; Type: Option " ",Purchase,Sales; inStock: Integer; TransID: Code[20]; CustNo: Code[20])
    var
        CustomerInventory: Record "Inventory Customer";
        MainInventory: Record "Inventory Management";
        DataEntry: Record "Data Entry Table";
        CustomerDetails: Record CustomersInv;
        VendorDetails: Record Vendor;
    begin
        if CustomerInventory.Get(TransID) then
            Message('The record with transaction ID %1 already exists !', TransID)
        else
            if (Type = Type::Purchase) then begin
                MainInventory.Reset();
                MainInventory.SetRange("Item No.", ItmNo);
                if MainInventory.FindFirst() then begin
                    MainInventory."Quantity In Stock" := MainInventory."Quantity In Stock" + Quantity;
                    MainInventory.Modify();
                    VendorDetails.Reset();
                    VendorDetails.SetRange("No.", CustNo);
                    if VendorDetails.FindFirst() then begin
                        CustomerInventory."Customer Name" := VendorDetails.Name;
                        CustomerInventory."Transaction ID" := TransID;
                        CustomerInventory.Type := Type;
                        CustomerInventory."Customer No." := CustNo;
                        CustomerInventory."Item No." := ItmNo;
                        CustomerInventory.Amount := MainInventory."Unit Price" * Quantity;
                        CustomerInventory."Item Name" := MainInventory."Item Name";
                        CustomerInventory."Item Quantity" := Quantity;
                        CustomerInventory.Insert();
                        DataEntry.DeleteAll();
                    end;
                    // TransferData(ItmNo, Quantity, Type, TransID, MainInventory."Item Name", CustNo, MainInventory."Unit Price");
                    Message('Congratulations, %1 %2 Purchased !', Quantity, MainInventory."Item Name");
                end;
            end else if (Type = Type::Sales) then begin
                if (inStock >= Quantity) then begin
                    MainInventory.Reset();
                    MainInventory.SetRange("Item No.", ItmNo);
                    if MainInventory.FindFirst() then begin
                        MainInventory."Quantity In Stock" := MainInventory."Quantity In Stock" - Quantity;
                        MainInventory.Modify();
                        CustomerDetails.Reset();
                        CustomerDetails.SetRange("Customer No.", CustNo);
                        if CustomerDetails.FindFirst() then begin
                            CustomerInventory."Customer Name" := CustomerDetails.Name;
                            CustomerInventory."Transaction ID" := TransID;
                            CustomerInventory.Type := Type;
                            CustomerInventory."Customer No." := CustNo;
                            CustomerInventory."Item No." := ItmNo;
                            CustomerInventory.Amount := MainInventory."Unit Price" * Quantity;
                            CustomerInventory."Item Name" := MainInventory."Item Name";
                            CustomerInventory."Item Quantity" := Quantity;
                            CustomerInventory.Insert();
                            DataEntry.DeleteAll();
                        end;
                        // TransferData(ItmNo, Quantity, Type, TransID, MainInventory."Item Name", CustNo, MainInventory."Unit Price");
                        Message('Congratulations, %1 %2 Sold !', Quantity, MainInventory."Item Name");
                    end;
                end else
                    Error('Our stock doesnot have the desired quantity of this item.');
            end else
                Error('Type should be mentioned before continuing !');
    end;

    [EventSubscriber(ObjectType::Table, Database::CustomersInv, 'OnAfterInsertEvent', '', true, true)]
    local procedure OnAfterInsertEvent()
    begin
        Message('Event subscriber');
    end;

    [EventSubscriber(ObjectType::Table, Database::CustomersInv, 'OnAfterDeleteEvent', '', true, true)]
    local procedure OnAfterDeleteEvent()
    begin
        Message('Deleted !');
    end;

    [EventSubscriber(ObjectType::Table, Database::CustomersInv, 'OnAfterValidateEvent', 'Address', true, true)]
    local procedure OnAfterValidateEvent()
    begin
        Message('Validate Address');
    end;
}