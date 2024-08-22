page 50104 Page1
{
    ApplicationArea = All;
    Caption = 'Page1';
    PageType = List;
    SourceTable = Table1;
    UsageCategory = Administration;
    // Editable = false;
    CardPageId = Card1;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Your Name Here';
                }
                // field(Phone; Rec.Phone)
                // {
                //     ApplicationArea = All;
                // }
                // field(Date; Rec.Date)
                // {
                //     ApplicationArea = All;
                // }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                // field(Address; Rec.Address)
                // {
                //     ApplicationArea = All;
                // }
                // field(Block; Rec.Block)
                // {
                //     ApplicationArea = All;
                // }
                field(Final_Balance; Rec.Final_Balance)
                {
                    ApplicationArea = All;
                }
                field(count; Rec.Count)
                {
                    ApplicationArea = All;
                }
                field("Average Invoice Amount"; Rec."Average Invoice Amount")
                {
                    ApplicationArea = All;
                }
                field("Max Invoice Amount"; Rec."Max Invoice Amount")
                {
                    ApplicationArea = All;
                }
            }
        }

        area(FactBoxes)
        {
            part(CustomerList; "Customer Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
            part(Listpart; "Item Attributes Factbox")
            {
                ApplicationArea = All;
            }
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(FilterBuilder)
            {
                ApplicationArea = All;
                Image = Edit;

                trigger OnAction()
                var
                    FilterPageBuilder: FilterPageBuilder;
                    Table1: Record Table1;
                    amount: Decimal;
                    number: Code[20];

                begin
                    FilterPageBuilder.AddRecord('Table 1', Table1);
                    FilterPageBuilder.AddField('Table 1', Table1."No.");
                    FilterPageBuilder.AddField('Table 1', Table1.Amount);

                    if FilterPageBuilder.RunModal() then begin
                        Table1.SetView(FilterPageBuilder.GetView('Table 1'));

                        Evaluate(amount, Table1.GetFilter(Amount));

                        Evaluate(number, Table1.GetFilter("No."));
                        Table1.Reset();
                        Table1.SetRange("No.", number);
                        if Table1.FindSet() then begin
                            Table1.Amount := amount;
                            Table1.Modify();
                        end;

                        //changing all the data records to the same amount

                        //     if Table1.FindSet() then
                        //         repeat
                        //             Table1.Amount := amount;
                        //             Table1.Modify();
                        //         until Table1.Next() = 0;
                    end;
                end;
            }
        }
    }
}