table 50103 Table1
{
    Caption = 'Table1';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[100])
        {
            Caption = 'Name';
            Editable = false;
        }
        field(2; Phone; Integer)
        {
            Caption = 'Phone';
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(4; Address; Text[30])
        {
            Caption = 'Address';
            TableRelation = Location;
        }
        field(5; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(6; EmpName; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; Block; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Total_amount; Decimal)
        {
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // begin
            //     Final_Balance := code.add(Total_amount, Deposited_amount);
            // end;
        }
        field(9; Deposited_amount; Decimal)
        {
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // begin
            //     Final_Balance := code.add(Total_amount, Deposited_amount);
            // end;
        }
        field(10; Final_Balance; Decimal)
        {
            // DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = sum("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field("No.")));
            // Editable = false;
        }
        field(11; Type; Option)
        {
            OptionMembers = " ",Customer,Employee;
        }
        field(12; "Sell To Customer"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const(Employee)) Employee else if (Type = const(Customer)) Customer;
            // trigger OnValidate()
            // var
            //     cus: Record Customer;
            //     emp: Record Employee;
            // begin
            //     TestField(Type);
            //     if Type = Type::Customer then begin
            //         Cus.Reset();
            //         // Cus.SetRange("No.", Rec.);
            //     end;
            // end;
        }
        field(13; NickName; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;

            trigger OnValidate()
            var
                customers: Record Customer;
            begin
                customers.Get(Rec."No.");
                Rec.Name := customers.Name;
            end;
        }
        field(15; Count; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Cust. Ledger Entry" where("Document Type" = const(Invoice), "Customer No." = field("No.")));
        }
        field(16; "Average Invoice Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = average("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field("No.")));
        }
        field(17; "Max Invoice Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = max("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field("No.")));
        }
        field(18; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; ProgressBar; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Base64Text; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(21; Blob; Blob)
        {
            Subtype = Bitmap;
        }
        field(22; Blob1; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(key1; "No.") { }
    }
}
