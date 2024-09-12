table 50127 "LC Amend Detail NEP"
{
    Caption = 'LC Amend Detail';
    DataClassification = CustomerContent;

    fields
    {
        field(90001; "Version No."; Code[10])
        {
            Caption = 'Version No.';
            DataClassification = CustomerContent;
        }
        field(90002; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            TableRelation = "LC Details NEP"."No.";
            Editable = false;
        }
        field(90096; "LC No."; Code[20])
        {
            Caption = 'LC No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90004; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(90005; "Transaction Type"; Option)
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;
            OptionMembers = "Purchase","Sale";
        }
        field(90006; "Issued To/Received From"; Code[20])
        {
            Caption = 'Issued To/Received From';
            DataClassification = CustomerContent;
            TableRelation = if ("Transaction Type" = const(Sale)) Customer."No." where(Blocked = filter(<> All))
            else
            if ("Transaction Type" = const(Purchase)) Vendor."No." where(Blocked = filter(<> All));
        }
        field(90007; "Issuing Bank"; Code[20])
        {
            Caption = 'Issuing Bank';
            DataClassification = CustomerContent;
            TableRelation = if ("Transaction Type" = const(Sale)) "Customer Bank Account".Code where("Customer No." = field("Issued To/Received From"))
            else
            if ("Transaction Type" = const(Purchase)) "Bank Account"."No.";
        }
        field(90008; "Date of Issue"; Date)
        {
            Caption = 'Date of Issue';
            DataClassification = CustomerContent;
        }
        field(90009; "Receiving Bank"; Code[20])
        {
            Caption = 'Receiving Bank';
            DataClassification = CustomerContent;
            tablerelation = if ("Transaction Type" = const(Purchase)) "Vendor Bank Account".Code where("Vendor No." = field("Issued To/Received From"))
            else
            if ("Transaction Type" = const(Sale)) "Bank Account"."No." where(Blocked = const(false));
        }
        field(90010; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(90011; "LC Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "","Sight LC","Usance LC","Advance Payment","Mixed Payment";
            Editable = false;
        }
        field(90012; "Type of Credit Limit"; Option)
        {
            Caption = 'Type of Credit Limit';
            DataClassification = CustomerContent;
            OptionMembers = "Fixed","Revolving";
        }
        field(90028; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
            DataClassification = CustomerContent;
            TableRelation = Currency;

            trigger OnValidate()
            begin
                if "Currency Code" <> '' then begin
                    CurrencyExchangeRate.SetRange("Currency Code", "Currency Code");
                    CurrencyExchangeRate.SetRange("Starting Date", 0D, "Date of Issue");
                    CurrencyExchangeRate.Find('+');
                    "Exchange Rate" := CurrencyExchangeRate."Relational Exch. Rate Amount" / CurrencyExchangeRate."Exchange Rate Amount";
                end;
            end;
        }
        field(90014; "Exchange Rate"; Decimal)
        {
            Caption = 'Exchange Rate';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 6;

            trigger OnValidate()
            begin
                Validate("LC Value");
            end;
        }
        field(90015; "LC Value"; Decimal)
        {
            Caption = 'LC Value';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Currency Code" <> '' then begin
                    Currency.Get("Currency Code");
                    "LC Value (LCY)" := Round("LC Value" * "Exchange Rate", Currency."Amount Rounding Precision");
                end else
                    "LC Value (LCY)" := "LC Value";

                "Amended Value" := "LC Value" - "Previous LC Value";
            end;
        }
        field(90016; "LC Value (LCY)"; Decimal)
        {
            Caption = 'LC Value (LCY)';
            DataClassification = CustomerContent;
        }
        field(90017; "Purchase LC Utilised Value"; Decimal)
        {
            Caption = 'Purchase LC Utilised Value';
            DataClassification = CustomerContent;
        }
        field(90018; "Sales LC Utilised Value"; Decimal)
        {
            Caption = 'Sales LC Utilised Value';
            DataClassification = CustomerContent;
        }
        field(90019; "Amended Value"; Decimal)
        {
            Caption = 'Amend Value';
            DataClassification = CustomerContent;
        }
        field(90020; Released; Boolean)
        {
            Caption = 'Released';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90021; Closed; Boolean)
        {
            Caption = 'Closed';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90022; "Bank Ammend No."; Code[20])
        {
            Caption = 'Bank Ammend No.';
            DataClassification = CustomerContent;
        }
        field(90023; "Revolving Cr. Limit Type"; Option)
        {
            Caption = 'Revolving Cr. Limit Type';
            DataClassification = CustomerContent;
            OptionMembers = " ","Automatic","Manual";
        }
        field(90024; "Previous LC Value"; Decimal)
        {
            Caption = 'Previous LC Value';
            DataClassification = CustomerContent;
        }
        field(90025; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = CustomerContent;
        }
        field(90026; "No. Series "; Code[20])
        {
            Caption = 'No. Series ';
            DataClassification = CustomerContent;
        }
        field(90027; "Amended Date"; Date)
        {
            Caption = 'Ammend Date';
            DataClassification = CustomerContent;
        }
        field(90013; Remarks; Text[50])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(90029; "Tolerance Percentage"; Decimal)
        {
            Caption = 'Tolerance Percentage';
            DataClassification = CustomerContent;
        }
        field(90030; "Issued To/Received From Name"; Text[50])
        {
            Caption = 'Issued To/Received From Name';
            DataClassification = CustomerContent;
        }
        field(90031; "Issue Bank Name 1"; Text[100])
        {
            Caption = 'Issue Bank Name 1';
            DataClassification = CustomerContent;
        }
        field(90032; "Receiving Bank Name"; Text[100])
        {
            Caption = 'Receiving Bank Name';
            DataClassification = CustomerContent;
        }
        field(90033; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
            DataClassification = CustomerContent;
        }
        field(90034; "Issue Bank Name 2"; Text[50])
        {
            Caption = 'Issue Bank name 2';
            DataClassification = CustomerContent;
        }
        field(90000; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
            OptionMembers = " ","Letter of Credit","Bank Guarantee","Delivery Order";
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Version No.", "LC No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        //Setting Amend flag in LC Detail.
        LCDetailsNEP.Reset();
        LCDetailsNEP.SetRange("No.", "No.");
        if LCDetailsNEP.Find('-') then
            if not LCDetailsNEP."Has Amendment" then begin
                LCDetailsNEP."Has Amendment" := true;
                LCDetailsNEP.Modify();
            end;
    end;

    trigger OnModify()
    begin
        if Closed then
            Error(CannotModifyErr);
    end;

    trigger OnDelete()
    begin
        if Closed or Released then
            Error(CannotDeleteErr);
    end;

    var
        CurrencyExchangeRate: Record "Currency Exchange Rate";
        Currency: Record Currency;
        LCDetailsNEP: Record "LC Details NEP";
        CannotModifyErr: Label 'You cannot modify closed LC.';
        CannotDeleteErr: Label 'You cannot delete closed or released LC.';
}