page 50129 "Currency Exchange"
{
    ApplicationArea = All;
    Caption = 'Currency Exchange';
    PageType = Card;
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Country Code"; CountryCode)
                {
                    ToolTip = 'Specifies the value of the Country Code field.', Comment = '%';
                    TableRelation = "Currency Rates";
                    trigger OnValidate()
                    var
                        CurrencyRates: Record "Currency Rates";
                    begin
                        if CountryCode = '' then
                            Error('Country Code cannot be empty !');
                        CurrencyRates.Get(CountryCode);
                        CountryName := CurrencyRates."Country Name";
                        Clear(SellAmount);
                        Clear(BuyAmount);
                        Clear(TotalAmount);
                    end;
                }
                field("Country Name"; CountryName)
                {
                    ToolTip = 'Specifies the value of the Country Name field.', Comment = '%';
                    Editable = false;
                }
                field("Exchange Type"; ExchangeType)
                {
                    ToolTip = 'Specifies the value of the Exchange Type field.', Comment = '%';
                    trigger OnValidate()
                    var

                    begin
                        case ExchangeType of
                            ExchangeType::Buy:
                                begin
                                    EditableBuy := true;
                                    EditableSell := false;
                                    Clear(SellAmount);
                                end;
                            ExchangeType::Sell:
                                begin
                                    EditableSell := true;
                                    EditableBuy := false;
                                    Clear(BuyAmount);
                                end;
                        end;
                    end;
                }
                field("Buy Amount"; BuyAmount)
                {
                    ToolTip = 'Specifies the value of the Buy Amount field.', Comment = '%';
                    Editable = EditableBuy;
                    trigger OnValidate()
                    begin
                        CalculateRates(BuyAmount);
                    end;
                }
                field("Sell Amount"; SellAmount)
                {
                    ToolTip = 'Specifies the value of the Sell Amount field.', Comment = '%';
                    Editable = EditableSell;
                    trigger OnValidate()
                    begin
                        CalculateRates(SellAmount);
                    end;
                }
                field("Total Amount"; TotalAmount)
                {
                    Caption = 'Total Amount (Rs.)';
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                    Editable = false;
                }
            }
        }
    }

    var
        CountryCode: Code[20];
        ExchangeType: Enum "Currency Exchange Type";
        BuyAmount, SellAmount, TotalAmount : Decimal;
        CountryName: Text[50];
        EditableSell, EditableBuy : Boolean;

    procedure CalculateRates(Amount: Decimal)
    var
        CurrencyRates: Record "Currency Rates";
    begin
        if CountryCode <> '' then begin
            CurrencyRates.Get(CountryCode);
            if ExchangeType = ExchangeType::Sell then
                TotalAmount := (CurrencyRates."Sell Rate" / CurrencyRates.Unit) * Amount
            else if ExchangeType = ExchangeType::Buy then
                TotalAmount := (CurrencyRates."Buy Rate" / CurrencyRates.Unit) * Amount;
        end;
    end;
}

