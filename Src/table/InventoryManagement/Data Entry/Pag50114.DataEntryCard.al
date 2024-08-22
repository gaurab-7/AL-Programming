page 50114 "Data Entry Card"
{
    ApplicationArea = All;
    Caption = 'Data Entry Card';
    PageType = Card;
    SourceTable = "Data Entry Table";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Transaction ID"; Rec."Transaction ID")
                {
                    ToolTip = 'Specifies the value of the Transaction ID field.', Comment = '%';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    Caption = 'Customer/Vendor No.';
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Caption = 'Customer/Vendor Name';
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Item Name"; Rec."Item Name")
                {
                    ToolTip = 'Specifies the value of the Item Name field.', Comment = '%';
                }
                field("Item Quantity"; Rec."Item Quantity")
                {
                    ToolTip = 'Specifies the value of the Item Quantity field.', Comment = '%';
                }
                field("Item In Stock"; Rec."Item in stock")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Save)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Save;
                trigger OnAction()
                var
                    codeunit: Codeunit "Inventory Code Unit";
                // MainInventory: Record "Inventory Management";

                begin
                    if not Confirm('Do you really want to save the transaction?', false) then
                        exit;
                    codeunit.purchase(Rec."Item No.", Rec."Item Quantity", Rec.Type, Rec."Item in stock", Rec."Transaction ID", Rec."Customer No.");
                    CurrPage.Close();
                    // if Rec.Type = Rec.Type::Purchase then begin
                    //     MainInventory.SetRange("Item No.", Rec."Item No.");
                    //     if MainInventory.FindSet() then begin
                    //         MainInventory."Quantity In Stock" := MainInventory."Quantity In Stock" + Rec."Item Quantity";
                    //         MainInventory.Modify();
                    //         Message('Congratulations, %1 %2 Purchased !', Rec."Item Quantity", Rec."Item Name");
                    //     end;
                    // end else if Rec.Type = Rec.Type::Sales then begin
                    //     MainInventory.SetRange("Item No.", Rec."Item No.");
                    //     if MainInventory.FindSet() then begin
                    //         MainInventory."Quantity In Stock" := MainInventory."Quantity In Stock" - Rec."Item Quantity";
                    //         MainInventory.Modify();
                    //         Message('Congratulations, %1 %2 Sold !', Rec."Item Quantity", Rec."Item Name");
                    //     end;
                    // end else
                    //     Error('You must select a type to proceed !');
                end;
            }
        }
    }
}
