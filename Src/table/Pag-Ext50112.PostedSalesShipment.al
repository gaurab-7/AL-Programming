pageextension 50112 "Posted Sales Shipment" extends "Posted Sales Shipment"
{
    layout
    {
        addafter("Ship-to Post Code")
        {
            field("Contract No."; Rec."Contract No.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter("&Track Package")
        {
            action(Message)
            {
                ApplicationArea = All;
                Image = SendConfirmation;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    Message('Message Is Printed !');
                end;
            }
        }
    }
}
