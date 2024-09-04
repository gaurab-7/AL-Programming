table 50117 CueTable
{
    Caption = 'CueTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Expired; Integer)
        {
            Caption = 'Expired';
        }
        field(2; Active; Integer)
        {
            Caption = 'Active';
        }
        field(3; PrimaryKey; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
    }
    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
}
