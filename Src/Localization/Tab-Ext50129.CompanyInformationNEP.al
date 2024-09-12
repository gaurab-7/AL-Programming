
tableextension 50129 "Company Information NEP" extends "Company Information"
{
    fields
    {
        field(90000; "IRD Approval"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90001; "CBMS Username"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(90002; "CBMS Password"; Text[50])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = Masked;
        }
        field(90003; "CBMS Base URL"; text[50])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = URL;
        }
        field(90004; "Enable CBMS Realtime Sync"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90005; "Activate Local Resp. Center"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(90006; "System Information"; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(90007; "Support Email"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(90008; "Agile Email"; text[50])
        {
            DataClassification = ToBeClassified;
        }
    }
}