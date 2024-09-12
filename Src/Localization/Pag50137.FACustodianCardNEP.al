page 50137 "FA Custodian Card NEP"
{
    PageType = Card;
    SourceTable = "Fa Custodian NEP";
    // ContextSensitiveHelpPage = 'my-feature';
    DelayedInsert = true;
    Caption = 'FA Custodian Card';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("FA No."; rec."FA No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the FA No. field.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("FA Description"; Rec."FA Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the FA Description field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    Caption = 'Custodian Name';
                    ToolTip = 'Specifies the value of the Custodian Name field.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Date of Ownership"; Rec."Date of Ownership")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Ownership field.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Branch field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Current Owner"; Rec."Current Owner")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Owner field.';
                }
                field("Branch Dimension"; Rec."Branch Dimension")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Post)
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Post;
                ApplicationArea = all;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    Rec.Post();
                end;
            }
        }
    }
}