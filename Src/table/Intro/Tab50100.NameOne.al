table 50100 NameOne
{
    Caption = 'NameOne';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; EmpName; Text[50])
        {
            Caption = 'Name';
        }
        field(3; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(4; Month; Enum "Nepali Month")
        {
            Caption = 'Month';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
