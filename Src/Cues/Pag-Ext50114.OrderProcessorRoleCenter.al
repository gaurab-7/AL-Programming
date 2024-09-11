pageextension 50114 "Order Processor Role Center" extends "Order Processor Role Center"
{
    layout
    {
        addafter(Control1901851508)
        {
            group(Deadline)
            {
                part(CuePage; CuePage)
                {
                    Caption = 'Transfer Status';
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }
}
