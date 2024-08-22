pageextension 50105 ItemPageExt extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field(Rating; Rec.Rating)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(Reports)
        {
            action(SetRangeeee)
            {
                ApplicationArea = All;
                Image = Filter;

                trigger OnAction()
                var
                    "vendorNo.": Code[20];
                    count: Integer;
                begin
                    Rec.SetRange("Vendor No.", "vendorNo.");
                    if Rec.FindSet() then
                        repeat
                            count += 1;
                        until Rec.Next() = 0;
                end;
            }

            action("Refresh Rating")
            {
                Image = Refresh;
                ApplicationArea = All;
                trigger OnAction()
                var
                    ReviewTable: Record "Product Review";
                    item: Record Item;
                    sum: Integer;
                    count: Integer;
                begin
                    if item.FindSet() then
                        repeat
                            sum := 0;
                            count := 0;
                            ReviewTable.Reset();
                            ReviewTable.SetRange("Product No.", item."No.");
                            if ReviewTable.FindSet() then begin
                                repeat
                                    sum += ReviewTable.Rating;
                                    count += 1;
                                until ReviewTable.Next() = 0;
                                // Message('%1 and %2', sum, count);
                                item.Rating := sum / count;
                                item.Modify();
                            end else
                                item.Rating := 0;
                            item.Modify();
                        until item.Next() = 0;
                end;
            }
        }
    }
}
