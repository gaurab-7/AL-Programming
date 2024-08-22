table 50106 postingtable
{
    Caption = 'postingtable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Code[10])
        {
            Caption = 'ID';
        }
        field(2; UserName; Text[30])
        {
            Caption = 'UserName';
        }
        field(3; Address; Text[30])
        {
            Caption = 'Address';
        }
        field(4; Phone; Integer)
        {
            Caption = 'Phone';
        }
        field(5; Company; Text[30])
        {
            Caption = 'Company';
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}
