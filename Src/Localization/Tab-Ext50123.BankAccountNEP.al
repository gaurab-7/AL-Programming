tableextension 50123 "Bank Account NEP" extends "Bank Account"
{
    fields
    {
        field(90000; "Account Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","Call Account","Current Account","Fixed Account","Overdraft";
        }
        field(90001; "Object Type"; Enum "Bank Account Option Type NEP")
        {
            DataClassification = CustomerContent;
        }
        field(90002; "Issuing Bank"; Text[100])
        {
            TableRelation = "Bank Account";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                BankAccount: Record "Bank Account";
            begin
                "Issuing Bank name" := '';
                if BankAccount.Get("Issuing Bank") then
                    "Issuing Bank Name" := BankAccount.Name;
            end;
        }
        field(90003; "Issuing Bank Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(90004; "Loan Type"; Enum "Loan Type NEP")
        {
            DataClassification = CustomerContent;
        }
        field(90005; "Start Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(90006; "End Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(90007; "Loan Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(90008; "Disbursement Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(90009; "Interest Rate"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(90010; Released; Boolean)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90011; "Bank Acc. Posting Group1"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account Posting Group';
            TableRelation = if ("Object Type" = const(Loan)) "Bank Account Posting Group" where("Object Type" = const(Loan))
            else
            if ("Object Type" = const(bank)) "Bank Account Posting Group" where("Object Type" = const(Bank));

            trigger OnValidate()
            begin
                Validate("Bank Acc. Posting Group", "Bank Acc. Posting Group1");
            end;
        }
        modify("Bank Account No.")
        {
            Caption = 'Account No.';
        }
    }

    keys
    {
        //  key(SK; "Bank Account No.")
        // {
        // }
    }

    fieldgroups
    {
        addlast(DropDown; "Bank Account No.")
        {
        }
    }

    trigger OnBeforeInsert()
    var
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        GLSetup.Get();
        if "No." = '' then
            case "Object Type" of
                "Object Type"::Bank:
                    begin
                        GLSetup.TestField("Bank Account Nos.");
                        NoSeriesMgt.InitSeries(GLSetup."Bank Account Nos.", xRec."No. Series", 0D, "No.", "No. Series");
                    end;
                "Object Type"::Loan:
                    begin
                        GLSetup.TestField("Loan Account Nos.");
                        NoSeriesMgt.InitSeries(GLSetup."Loan Account Nos.", xRec."No. Series", 0D, "No.", "No. Series");
                    end;
            end;
    end;
}