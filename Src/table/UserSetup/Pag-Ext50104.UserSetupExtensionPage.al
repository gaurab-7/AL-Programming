pageextension 50104 UserSetupExtensionPage extends "User Setup"
{
    layout
    {
        addafter("Allow Posting From")
        {
            field("Allow Bill Post"; Rec."Allow Bill Post")
            {
                ApplicationArea = All;
            }
        }
    }
}
