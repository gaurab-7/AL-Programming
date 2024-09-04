table 50118 "Currency Rates"
{
    Caption = 'Currency Rates';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Country Code"; Code[20])
        {
            Caption = 'Country Code';
        }
        field(2; Unit; Integer)
        {
            Caption = 'Unit';
        }
        field(3; "Buy Rate"; Decimal)
        {
            Caption = 'Buy Rate';
        }
        field(4; "Sell Rate"; Decimal)
        {
            Caption = 'Sell Rate';
        }
        field(5; "Country Name"; Text[50])
        {
            Caption = 'Country Name';
        }
    }
    keys
    {
        key(PK; "Country Code")
        {
            Clustered = true;
        }
    }
}
