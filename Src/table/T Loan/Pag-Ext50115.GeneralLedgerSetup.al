pageextension 50115 "General Ledger Setup" extends "General Ledger Setup"
{
    layout
    {
        addafter(General)
        {
            group("T Loan")
            {
                Caption = 'T Loan';
                field("T-Loan No. Series"; Rec."T-Loan No. Series")
                {
                    ApplicationArea = All;
                }
                field("T-Loan Shipment No. Series"; Rec."T-Loan Shipment No. Series")
                {
                    ApplicationArea = All;
                }
                field("T-Loan Receipt No. Series"; Rec."T-Loan Receipt No. Series")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
