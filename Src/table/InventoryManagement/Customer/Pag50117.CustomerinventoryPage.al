page 50117 CustomerInventoryPage
{
    ApplicationArea = All;
    Caption = 'CustomerInventoryPage';
    PageType = List;
    SourceTable = "Inventory Customer";
    UsageCategory = Administration;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Transaction ID"; Rec."Transaction ID")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
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
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Item Name"; Rec."Item Name")
                {
                    ApplicationArea = All;
                }
                field("Item Quantity"; Rec."Item Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Quantity field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Filter)
            {
                ApplicationArea = All;
                Image = Filter;

                trigger OnAction()
                var
                    FilterPageBuilder: FilterPageBuilder;
                    customerInventory: Record "Inventory Customer";
                    ItmNo: Code[20];
                begin
                    FilterPageBuilder.AddRecord('customer inventory', customerInventory);
                    FilterPageBuilder.AddField('customer inventory', customerInventory."Item No.");

                    if FilterPageBuilder.RunModal() then begin
                        customerInventory.SetView(FilterPageBuilder.GetView('customer inventory'));
                        ItmNo := customerInventory.GetFilter("Item No.");
                        Rec.SetRange("Item No.", ItmNo);
                    end;
                end;
            }

            action("Customer Report")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Report.Run(Report::CustomerReport, true, true);
                end;
            }
            action("Vendor Report")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Report.Run(Report::VendorReport, true, true);
                end;
            }
        }
    }
}
