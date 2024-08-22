report 50104 GenerateNoSeries
{
    ApplicationArea = All;
    Caption = 'Generate No. Series';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("No. series Line"; "No. Series Line")
        {
            trigger OnPreDataItem()
            var
                Text000: Label 'Processed : #1######\Total Records : #2######## \Modified : #3######';
            begin
                ProgressWindow.Open(Text000);
                totalcount := 0;
                NoFilter := '*' + SearchString + '*';
                "No. series Line".SetFilter("Starting No.", NoFilter);
                if StartingDate = 0D then
                    Error('Please select starting date!');
                Message('%1', "No. series Line".GetFilters);
            end;

            trigger OnAfterGetRecord()
            begin
                totalcount += 1;
                ProgressWindow.Update(2, "No. series Line".Count);
                ProgressWindow.Update(1, totalcount);
                PreviousStartingNo := "Starting No.";
                if not NoSeries.Get("Series Code") then
                    CurrReport.Skip;
                NoSeriesLine.Reset;
                NoSeriesLine.SetCurrentKey(NoSeriesLine."Line No.");
                NoSeriesLine.SetRange("Series Code", "No. series Line"."Series Code");
                if NoSeriesLine.FindLast then
                    LastLineNo := NoSeriesLine."Line No." + 10000
                else
                    LastLineNo := 10000;
                if (StartingDate <> 0D) and (SearchString <> '') and (ReplaceWith <> '') then begin //for format like ABC78/77-0001
                    Position := StrPos(PreviousStartingNo, SearchString);
                    if Position <> 0 then begin
                        NewStartingNo := ReplaceString(PreviousStartingNo, SearchString, ReplaceWith);
                        NoSeriesLine.Reset;
                        NoSeriesLine.SetRange("Series Code", "No. series Line"."Series Code");
                        NoSeriesLine.SetRange(NoSeriesLine."Starting No.", NewStartingNo);
                        if not NoSeriesLine.FindFirst then begin
                            NoSeriesLine.Init;
                            NoSeriesLine."Series Code" := "Series Code";
                            NoSeriesLine."Line No." := LastLineNo;
                            NoSeriesLine."Starting Date" := StartingDate;
                            NoSeriesLine."Starting No." := NewStartingNo;
                            NoSeriesLine."Increment-by No." := 1;
                            NoSeriesLine.Open := true;
                            NoSeriesLine.New := true;
                            NoSeriesLine.Insert;
                            NoSeries.Get("No. series Line"."Series Code");
                            NoSeries."New Series Line Created" := true;
                            NoSeries.Modify;
                        end;
                        ProgressWindow.Update(3, totalcount);
                    end;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Updated Successfully!');
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Nepali Year")
                {
                    field(Year; Year)
                    {
                        ApplicationArea = All;
                    }
                }
                group(Ac)
                {
                    field(SearchString; SearchString)
                    {
                        ApplicationArea = All;
                        Caption = 'FY Search String';
                    }
                    field(ReplaceWith; ReplaceWith)
                    {
                        ApplicationArea = All;
                        Caption = 'New FY Code';
                    }
                }
                group(AS)
                {
                    field(StartingDate; StartingDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Starting Date';
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        Year: Integer;
        StartingDate: Date;
        NoFilter: Code[20];
        PreviousStartingNo: Code[20];
        NewStartingNo: Code[20];
        Position: Integer;
        NoSeriesLine: Record "No. Series Line";
        totalcount: Integer;
        ProgressWindow: Dialog;
        LastLineNo: Integer;
        SearchString: Text;
        NewString: Text;
        ReplaceWith: Text;
        NoSeries: Record "No. Series";

    local procedure ReplaceString(String: Text; FindWhat: Text; ReplaceWith: Text) NewString: Text
    begin
        while StrPos(String, FindWhat) > 0 do
            String := DelStr(String, StrPos(String, FindWhat)) + ReplaceWith + CopyStr(String, StrPos(String, FindWhat) + StrLen(FindWhat));
        NewString := String;
        exit(NewString);
    end;
}