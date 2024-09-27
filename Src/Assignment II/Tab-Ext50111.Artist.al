tableextension 50111 Artist extends Artist
{
    fields
    {
        field(50100; "No. of Songs"; Integer)
        {
            Caption = 'No. of Songs';
            FieldClass = FlowField;
            CalcFormula = count(Song where("Artist Code" = field(Code)));
        }
        field(50101; "Artist Image"; Blob)
        {
            Caption = 'Artist Image';
            DataClassification = ToBeClassified;
        }
        field(50102; Age; Integer)
        {
            Caption = 'Age';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if (Age < 1) and (Age > 150) then
                    Error('Age must be between 1 and 150.');
            end;
        }
    }
}
