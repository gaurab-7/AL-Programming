page 50124 "Customer Overview List"
{
    ApplicationArea = All;
    Caption = 'Customer Overview List';
    PageType = List;
    SourceTable = "Customer Overview";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Code field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field(LastRunDate; Rec.LastRunDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LastRunDate field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import Records")
            {
                Caption = 'Import Records';
                Image = Import;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    CustomerOverviewMgmt: Codeunit "Customer Overview Management";
                begin
                    CustomerOverviewMgmt.Run();
                end;
            }
        }
    }

    trigger OnClosePage()
    var
        customerOverview: Record "Customer Overview";
    begin
        customerOverview.DeleteAll();
    end;
}
