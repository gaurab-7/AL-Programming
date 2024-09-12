tableextension 50115 "FA Setup NEP" extends "FA Setup"
{
    fields
    {
        field(90000; "FA Numbering Code"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(90001; "FA Numbering Joiner"; Code[5])
        {
            DataClassification = CustomerContent;
        }
        field(90002; "FA Dimension 1 Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90003; "FA Dimension 2 Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90004; "Branch Dimension"; Code[20])
        {
            TableRelation = Dimension;
            DataClassification = CustomerContent;
        }
        field(90005; "Department Dimension"; Code[20])
        {
            TableRelation = Dimension;
            DataClassification = CustomerContent;
        }
    }
}