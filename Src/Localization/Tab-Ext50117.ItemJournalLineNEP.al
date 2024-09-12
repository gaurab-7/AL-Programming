tableextension 50117 "Item Journal Line NEP" extends "Item Journal Line"
{
    fields
    {
        field(90000; "Localized VAT Identifier"; Enum "Localized VAT Identifier NEP")
        {
            DataClassification = CustomerContent;
        }
        field(90045; Narration; text[250])
        {
            Caption = 'Narration';
            DataClassification = CustomerContent;
        }
        field(90094; PragyapanPatra; Code[100])
        {
            Caption = 'PragyapanPatra';
            DataClassification = CustomerContent;
            TableRelation = "PragyapanPatra NEP";
        }
        field(90095; "Purchase Consignment No."; Code[20])
        {
            Caption = 'Purchase Consignment No.';
            DataClassification = CustomerContent;
            TableRelation = "Purchase Consignment NEP";
        }
        field(90203; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(90204; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(90205; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(90206; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(90207; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(90208; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
        field(90096; "LC No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90044; "Requisition No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Created Purch. Order No.';
        }
        field(90011; "Demanded By"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Demanded By';
        }
        field(90012; "Demanded Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Demanded Date';
        }
        field(90055; "Nepali Date"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "English-Nepali Date NEP"."Nepali Date";

            trigger OnValidate()
            var
                EnglishNepaliDate: Record "English-Nepali Date NEP";
            begin
                if "Nepali Date" <> '' then
                    Rec.Validate("Posting Date", EnglishNepaliDate.getEngDate("Nepali Date"))
                else
                    Rec.Validate("Posting Date", 0D);
            end;
        }
        modify("Posting Date")
        {
            trigger OnAfterValidate()
            var
                EnglishNepaliDate: Record "English-Nepali Date NEP";
            begin
                if "Posting Date" <> 0D then
                    "Nepali Date" := EnglishNepaliDate.getNepaliDate("Posting Date")
                else
                    "Nepali Date" := '';
            end;
        }
    }

    procedure FilterBatch2(TempName: Code[20]): Code[2048]
    var
        Security: Record "Template Security NEP";
        batch: Code[2048];
    begin
        if not Rec.AllowBatch() then begin
            Security.SetRange(Security."User Id", UserId);
            if TempName = '' then
                Security.SetRange(Security."Template Name", Rec.GetRangeMax("Journal Template Name"))
            else
                Security.SetRange(Security."Template Name", TempName);


            if Security.FindSet() then begin
                repeat
                    if batch = '' then
                        batch := Security."Batch Name"
                    else
                        batch := CopyStr(batch + '|' + Security."Batch Name", 1, 2048);
                until Security.Next() = 0;

                exit(batch);
            end else
                Error('Please assign template and batch in template security setup.');
        end;
    end;

    procedure AllowBatch(): Boolean
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        if UserSetup."Allow All Batch" then
            exit(true)
        else
            exit(false);
    end;
}