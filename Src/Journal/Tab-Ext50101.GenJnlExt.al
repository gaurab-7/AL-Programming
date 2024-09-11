tableextension 50101 GenJnlExt extends "Gen. Journal Line"
{
    fields
    {
        field(60013; Training; Text[20])
        {
            Caption = 'Training';
            DataClassification = ToBeClassified;
        }
        field(60014; "Sum of Tax"; Decimal)
        {
            Caption = 'Sum of Tax';
            DataClassification = ToBeClassified;
        }
    }
}
