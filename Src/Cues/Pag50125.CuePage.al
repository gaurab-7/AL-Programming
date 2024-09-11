page 50125 CuePage
{
    Caption = 'CuePage';
    PageType = CardPart;
    // SourceTable = CueTable;
    // ApplicationArea = All;
    // UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            cuegroup(General)
            {
                Caption = 'Status';

                field(PreDate; PreDate)
                {
                    Caption = 'Pre Date';
                    ApplicationArea = All;
                    StyleExpr = 'Ambiguous';
                    trigger OnDrillDown()
                    var
                        TransferHeader: Record "Transfer Header";
                    begin
                        TransferHeader.SetFilter("Start Date", '>1/15/2024');
                        Page.Run(Page::"Transfer Orders", TransferHeader);
                    end;
                }
                field(Active; Active1)
                {
                    Caption = 'Active';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Active field.', Comment = '%';
                    StyleExpr = 'Favorable';
                    trigger OnDrillDown()
                    var
                        TransferHeader: Record "Transfer Header";
                    begin
                        TransferHeader.SetFilter("Start Date", '<1/15/2024');
                        TransferHeader.SetFilter("End Date", '>1/15/2024');
                        Page.Run(Page::"Transfer Orders", TransferHeader);
                    end;
                }
                field(Expired; Expired1)
                {
                    Caption = 'Expired';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expired field.', Comment = '%';
                    StyleExpr = 'Unfavorable';
                    trigger OnDrillDown()
                    var
                        TransferHeader: Record "Transfer Header";
                    begin
                        TransferHeader.SetFilter("End Date", '<1/15/2024');
                        Page.Run(Page::"Transfer Orders", TransferHeader);
                    end;
                }
            }
            // cuegroup(Actionss)
            // {
            //     actions
            //     {
            //         action(Hello)
            //         {
            //             Caption = 'Hello';
            //             ApplicationArea = All;
            //             trigger OnAction()
            //             begin
            //                 Message('Hello from actions');
            //             end;
            //         }
            //     }
            // }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
        CueCodeunit: Codeunit CueCodeunit;
    begin
        CueCodeunit.GetCue(Active1, Expired1, PreDate);
    end;

    var
        Active1: Integer;
        Expired1: Integer;
        PreDate: Integer;
}
