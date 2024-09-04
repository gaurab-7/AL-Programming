pageextension 50113 "Transfer Order" extends "Transfer Order"
{
    layout
    {
        addafter(Status)
        {
            field("Start Date"; Rec."Start Date")
            {
                ApplicationArea = All;
            }
            field("End Date"; Rec."End Date")
            {
                ApplicationArea = All;
            }
        }
    }
}
