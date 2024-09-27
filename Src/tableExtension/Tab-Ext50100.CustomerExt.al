tableextension 50100 CustomerExt extends Customer
{
    fields
    {
        field(50100; Facebook; Text[50])
        {
            Caption = 'Facebook';
            DataClassification = ToBeClassified;
        }
        field(50101; Instagram; Text[50])
        {
            Caption = 'Instagram';
            DataClassification = ToBeClassified;
        }
        field(50102; LinkedIn; Text[50])
        {
            Caption = 'LinkedIn';
            DataClassification = ToBeClassified;
        }
        field(50111; UName; Text[30])
        {
            Caption = 'UName';
            FieldClass = FlowField;
            CalcFormula = lookup(Try.UName where("TNo." = field("No.")));
        }
        field(50112; Gender; Option)
        {
            OptionMembers = Male,Female,Other;
        }
    }
}
