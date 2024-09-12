tableextension 50128 "Vendor NEP" extends Vendor
{
    fields
    {
        // field(90000; "TDS Balance"; Decimal)
        // {
        //     Caption = 'TDS Balance';
        //     FieldClass = FlowField;
        //     CalcFormula = Sum("TDS Entry nep"."TDS Amount" WHERE("Source Type" = CONST(Vendor),

        //                                                       "Bill-to/Pay-to No." = FIELD("No."),

        //                                                       "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),

        //                                                       "Shortcut Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),

        //                                                       Closed = FIELD("TDS Entry Closed Filter"),

        //                                                       "Transaction Type" = CONST("Purchase TDS"),

        //                                                       "Posting Date" = FIELD("Date Filter")));
        // }
        field(90001; "TDS Entry Closed Filter"; Boolean)
        {
            FieldClass = FlowFilter;
        }
        // field(90002; "TDS Balance (Open)"; Decimal)
        // {
        //     Description = 'TDS1.00';
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = Sum("TDS Entry nep"."TDS Amount" WHERE("Source Type" = CONST(Vendor),

        //                                                       "Bill-to/Pay-to No." = FIELD("No."),

        //                                                       "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),

        //                                                       "Shortcut Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),

        //                                                       Closed = CONST(false),

        //                                                       "Transaction Type" = CONST("Purchase TDS"),

        //                                                       "Posting Date" = FIELD("Date Filter"),

        //                                                       Reversed = CONST(false)));
        // }
        field(90003; "LC Mandatory"; Boolean)
        {
            Caption = 'LC Mandatory';
            DataClassification = CustomerContent;
        }
        field(90004; "Consignment No. Mandatory"; Boolean)
        {
            Caption = 'Consignment No. Mandatory';
            DataClassification = CustomerContent;
        }
        field(90005; "PragyapanPatra Mandatory"; Boolean)
        {
            Caption = 'PragyapanPatra Mandatory';
            DataClassification = CustomerContent;
        }
        field(90006; "Credit Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","Nusance LC","LC at sight","Advance RTGS","RTGS Credit",;
            OptionCaption = ' ,Nusance LC,C at sight,Advance RTGS,RTGS Credit';
        }
        field(90007; "Sales Agreement"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Yes,No;
            OptionCaption = 'Yes,No';
        }
        field(90008; "Appointment Letter"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Yes,No;
            OptionCaption = 'Yes,No';
        }
        field(90018; "Purchaser Code1"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser".Code where(Type = filter(Purchaser));
            Caption = 'Purchaser Code';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec.Validate("Purchaser Code", "Purchaser Code1");
            end;
        }
    }
}