codeunit 50111 "Codeunit2"
{
    trigger OnRun()
    var
        PurchaseHeader: Record "Purch Header";
        Option: Option;
        // QuoteIndex, OrderIndex, CreditMemoIndex, InvoiceIndex, BlanketOrderIndex, ReturnOrderIndex : Option;
        Filter: text;
        Separators: text;
        Results: List of [Text];
        Result: Text;
        Value: Integer;
        Values: List of [Integer];
        FinalResult: Text;
        OptionVar: option Quote,Order1,Invoice,"Credit Memo","Blanket Order","Return Order";
        i: integer;
    begin
        // purchaseheader."Document Type" options > Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order
        // QuoteIndex := GetValue(PurchaseHeader."Document Type"::Quote);
        // OrderIndex := GetValue(PurchaseHeader."Document Type"::Order1);
        // InvoiceIndex := GetValue(PurchaseHeader."Document Type"::Invoice);
        // CreditMemoIndex := GetValue(PurchaseHeader."Document Type"::"Credit Memo");
        // BlanketOrderIndex := GetValue(PurchaseHeader."Document Type"::"Blanket Order");
        // ReturnOrderIndex := GetValue(PurchaseHeader."Document Type"::"Return Order");

        PurchaseHeader.SETFILTER("Document Type", '%1|%2|%3|%4',
          PurchaseHeader."Document Type"::Order1,
          PurchaseHeader."Document Type"::"Return Order",
          PurchaseHeader."Document Type"::"Blanket Order",
          PurchaseHeader."Document Type"::"Credit Memo");

        Filter := PurchaseHeader.GetFilter("Document Type"); // invoice|order
        Separators := '|';
        Results := Filter.Split(Separators); // [invoice, order]

        foreach Result in Results do begin
            Evaluate(Optionvar, Result);
            i := Optionvar;
            if FinalResult = '' then
                FinalResult := format(i)
            else
                FinalResult += '|' + format(i);

            // Message('%1', Result);
            //     case Result of
            //         'Invoice':
            //             begin
            //                 Value := GetValue(PurchaseHeader."Document Type"::Invoice);
            //                 Values.Add(Value);
            //             end;
            //         'Order1':
            //             begin
            //                 Value := GetValue(PurchaseHeader."Document Type"::Order1);
            //                 Values.Add(Value);
            //             end;
            //         'Quote':
            //             begin
            //                 Value := GetValue(PurchaseHeader."Document Type"::Quote);
            //                 Values.Add(Value);
            //             end;
            //         'Return Order':
            //             begin
            //                 Value := GetValue(PurchaseHeader."Document Type"::"Return Order");
            //                 Values.Add(Value);
            //             end;
            //         'Blanket Order':
            //             begin
            //                 Value := GetValue(PurchaseHeader."Document Type"::"Blanket Order");
            //                 Values.Add(Value);
            //             end;
            //         'Credit Memo':
            //             begin
            //                 Value := GetValue(PurchaseHeader."Document Type"::"Credit Memo");
            //                 Values.Add(Value);
            //             end;
            //     end;
            // end;
        end;
        Message(FinalResult);
        // foreach Value in Values do begin
        //     OptionVar := Value;
        //     if FinalResult = '' then
        //         FinalResult := Format(Value)
        //     else
        //         FinalResult := FinalResult + '|' + Format(Value);
        // end;
        // Message('%1', FinalResult);
        // Result: Invoice|Return Order|Blanket Order
        // Expected = 2|5|4
    end;

    procedure GetValue(DocumentType: Option): Integer
    begin
        exit(DocumentType);
    end;
}
