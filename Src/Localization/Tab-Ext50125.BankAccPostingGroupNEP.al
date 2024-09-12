tableextension 50125 "Bank Acc Posting Group NEP" extends "Bank Account Posting Group"
{
    fields
    {
        field(90000; "Object Type"; Enum "Bank Account Option Type NEP")
        {
            DataClassification = CustomerContent;
        }
        field(90001; "Is Loan Interest"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }
}