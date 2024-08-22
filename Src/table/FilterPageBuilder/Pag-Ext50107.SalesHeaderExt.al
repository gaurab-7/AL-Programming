pageextension 50107 SalesHeaderExt extends "Sales Lines"
{
    actions
    {
        addfirst(Reporting)
        {
            action(FilterPageBuilder)
            {
                ApplicationArea = All;
                Image = Edit;

                trigger OnAction()
                var
                    FilterBuilderNumber: FilterPageBuilder;
                    FilterBuilderLocation: FilterPageBuilder;
                    SalesNo: Code[20];
                    LocationCode: Code[10];
                    SalesLine: Record "Sales Line";
                    Location: Record Location;

                begin
                    FilterBuilderNumber.AddRecord('Select No.', SalesLine);
                    FilterBuilderNumber.AddField('Select No.', SalesLine."Document No.");
                    if FilterBuilderNumber.RunModal() then begin
                        SalesLine.SetView(FilterBuilderNumber.GetView('Select No.'));
                        if SalesLine.FindFirst() then
                            SalesNo := SalesLine."No.";
                    end;

                    FilterBuilderLocation.AddRecord('Location Code', Location);
                    FilterBuilderLocation.AddField('Location Code', Location.Code);
                    if FilterBuilderLocation.RunModal() then begin
                        Location.SetView(FilterBuilderLocation.GetView('Location Code'));
                        if Location.FindFirst() then
                            LocationCode := Location.Code;
                    end;
                    Message('%1 and %2', SalesNo, LocationCode);
                end;
            }
        }
    }
}
