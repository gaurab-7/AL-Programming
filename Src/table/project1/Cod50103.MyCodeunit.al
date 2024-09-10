codeunit 50103 MyCodeunit
{
    procedure add(num1: Integer; num2: Integer): Decimal
    var
        myInt: Integer;
    begin
        myInt := num1 + num2;
        exit(myInt);
        Error('Successful');
    end;

    procedure GetRates()
    var
        client: HttpClient;
        request: HttpRequestMessage;
        response: HttpResponseMessage;
        outputString: Text;
    begin
        request.SetRequestUri('https://www.nrb.org.np/api/forex/v1/rate');
        request.Method := 'Get';
        if client.Send(request, response) then
            if response.IsSuccessStatusCode() then begin
                response.Content.ReadAs(outputString);
                ParseResponse(outputString);
            end else
                Error('Error %1', response.ReasonPhrase);
    end;

    procedure ParseResponse(OutputString: Text)
    var
        RatesJson, RatesObject, InfoObject : JsonObject;
        RatesArray: JsonArray;
        StatusJsonToken, RatesToken, RateToken, ResultToken : JsonToken;
        CurrencyRates: Record "Currency Rates";
    begin
        RatesJson.ReadFrom((OutputString));
        RatesJson.Get('data', RatesToken);
        RatesJson.ReadFrom(Format(RatesToken));
        RatesJson.Get('payload', RatesToken);
        RatesJson.ReadFrom(Format(RatesToken));
        RatesJson.Get('rates', RatesToken);
        RatesArray.ReadFrom(Format(RatesToken));
        CurrencyRates.DeleteAll();
        foreach RateToken in RatesArray do begin
            RatesObject := RateToken.AsObject();
            RatesObject.Get('buy', ResultToken);
            CurrencyRates."Buy Rate" := ResultToken.AsValue().AsDecimal();
            RatesObject.Get('sell', ResultToken);
            CurrencyRates."Sell Rate" := ResultToken.AsValue().AsDecimal();
            RatesObject.Get('currency', ResultToken);
            InfoObject := ResultToken.AsObject();
            InfoObject.Get('iso3', ResultToken);
            CurrencyRates."Country Code" := ResultToken.AsValue().AsCode();
            InfoObject.Get('name', ResultToken);
            CurrencyRates."Country Name" := ResultToken.AsValue().AsText();
            InfoObject.Get('unit', ResultToken);
            CurrencyRates.Unit := ResultToken.AsValue().AsInteger();
            CurrencyRates.Insert();
        end;
    end;
}