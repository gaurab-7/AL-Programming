page 50105 Card1
{
    ApplicationArea = All;
    Caption = 'Card1';
    PageType = Card;
    SourceTable = Table1;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CurrPage.MyProgressBar.appendName(Rec.Name, compInfo.Name);
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CurrPage.detailControl.click();
                    end;
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = All;
                }
                field(Total_amount; Rec.Total_amount)
                {
                    ApplicationArea = All;
                }
                field(Deposited_amount; Rec.Deposited_amount)
                {
                    ApplicationArea = All;
                }
                field(Final_Balance; Rec.Final_Balance)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(EmpName; Rec.EmpName)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Sell To Customer"; Rec."Sell To Customer")
                {
                    ApplicationArea = All;
                }
                field(NickName; Rec.NickName)
                {
                    ApplicationArea = All;
                }
                field(Base64Text; Rec.Base64Text)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        OutS: OutStream;
                        convert: Codeunit "Base64 Convert";
                        InS: InStream;
                    begin
                        Rec.Blob.CreateOutStream(OutS);
                        convert.FromBase64(Rec.Base64Text, OutS);

                        Rec.CalcFields(Blob);
                        Rec.Blob.CreateInStream(InS);
                        Rec.Blob1 := convert.ToBase64(InS);
                    end;
                }
                field(Blob; Rec.Blob)
                {
                    ApplicationArea = All;
                }
                field(Blob1; Rec.Blob1)
                {
                    ApplicationArea = All;
                }
                field(ProgressBar; Rec.ProgressBar)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if Rec.ProgressBar > 100 then Error('Progress cannot exceed 100');
                        CurrPage.MyProgressBar.SetProgress(Rec.ProgressBar);
                        CurrPage.MyProgressBar.alert();
                    end;
                }
                usercontrol(MyProgressBar; MyProgressBar)
                {
                    ApplicationArea = All;
                    trigger IAmReady()
                    begin
                        CurrPage.MyProgressBar.SetProgress(Rec.ProgressBar);
                        CurrPage.MyProgressBar.appendName(Rec.Name, compInfo.Name);
                    end;
                }
            }

            group(Details)
            {
                usercontrol(detailControl; detailControl)
                {
                    ApplicationArea = All;

                    trigger MeReady()
                    begin
                    end;

                    trigger inputData(text: Text[30])
                    begin
                        Rec.EmpName := text;
                        Rec.Modify();
                        Message('Data has been sent to EmpName!');
                    end;
                }
            }
            group(Details2)
            {
                usercontrol(chartsAddIns; chartsAddIns)
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
            action(Print)
            {
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    PostedBillHdr: Record Table1;
                begin
                    // if PostedBillHdr.Get(Rec."Bill No") then
                    //    Report.Run(Report::"Bill Invoice", true, true, PostedBillHdr);

                    PostedBillHdr.Reset();
                    PostedBillHdr.SetRange(Name, Rec.Name);
                    if PostedBillHdr.FindFirst() then
                        Report.Run(Report::BillInvoiceReport, true, true, PostedBillHdr);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        compInfo.Get();
    end;

    var
        compInfo: Record "Company Information";
}
