pageextension 50103 GeneralJournalExt extends "General Journal"
{
    layout
    {
        addafter(Amount)
        {
            field(Training; Rec.Training)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
