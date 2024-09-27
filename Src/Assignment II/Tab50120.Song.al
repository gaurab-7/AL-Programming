table 50120 Song
{
    Caption = 'Song';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Title; Text[80])
        {
            Caption = 'Title';
        }
        field(3; "Artist Code"; Code[10])
        {
            Caption = 'Artist Code';
            TableRelation = Artist;

            trigger OnValidate()
            var
                Artist: Record Artist;
            begin
                Artist.SetRange(Code, "Artist Code");
                "Artist Name" := Artist.Description;
            end;
        }
        field(4; "Artist Name"; Text[50])
        {
            Caption = 'Artist Name';
            Editable = false;
        }
        field(5; "Music Genre Code"; Code[10])
        {
            Caption = 'Music Genre Code';
            TableRelation = "Music Genre";
        }
        field(6; "Music Genre Name"; Text[50])
        {
            Caption = 'Music Genre Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Music Genre".Description where(Code = field("Music Genre Code"), Blocked = const(false)));
        }
        field(7; "Song Length"; Decimal)
        {
            Caption = 'Song Length';
        }
        field(8; "Released Date"; Date)
        {
            Caption = 'Released Date';

            trigger OnValidate()
            begin
                "Released Year" := Date2DMY("Released Date", 3);
            end;
        }
        field(9; "Released Year"; Integer)
        {
            Caption = 'Released Year';
        }
        field(10; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(11; Hits; Integer)
        {
            Caption = 'Hits';
        }
        field(12; "No. of Songs This Year"; Integer)
        {
            Caption = 'No. of Songs This Year';
            FieldClass = FlowField;
            CalcFormula = count(Song where("Released Date" = field("Date Filter")));
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
