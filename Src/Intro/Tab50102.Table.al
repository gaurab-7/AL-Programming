table 50102 Table
{
    Caption = 'Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(2; Number; Integer)
        {
            Caption = 'Number';
        }
        field(3; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(4; Organization; Text[30])
        {
            Caption = 'Organization';
        }
        field(5; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }
}
