codeunit 50107 TempCodeUnit
{
    Permissions = tabledata "G/L Entry" = rim;
    procedure AddSourceName()
    var
        GLEntry: Record "G/L Entry";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Employee: Record Employee;
        BankAccount: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        ICPartner: Record "IC Partner";
    begin
        if GLEntry.FindSet(true) then
            repeat
                // if GLEntry."Source Type" = GLEntry."Source Type"::Customer then begin
                //     Customer.Get(GLEntry."Source No.");
                //     GLEntry."Posting Name" := Customer.Name;
                //     GLEntry.Modify();
                // end;

                // if GLEntry."Source Type" = GLEntry."Source Type"::Vendor then begin
                //     Vendor.Get(GLEntry."Source No.");
                //     GLEntry."Posting Name" := Vendor.Name;
                //     GLEntry.Modify();
                // end;

                case GLEntry."Source Type" of
                    GLEntry."Source Type"::Customer:
                        begin
                            Customer.Get(GLEntry."Source No.");
                            GLEntry."Source Name" := Customer.Name;
                            GLEntry.Modify();
                        end;
                    GLEntry."Source Type"::Vendor:
                        begin
                            Vendor.Get(GLEntry."Source No.");
                            GLEntry."Source Name" := Vendor.Name;
                            GLEntry.Modify();
                        end;
                    GLEntry."Source Type"::Employee:
                        begin
                            Employee.Get(GLEntry."Source No.");
                            GLEntry."Source Name" := Employee.FullName();
                            GLEntry.Modify();
                        end;
                    GLEntry."Source Type"::"Bank Account":
                        begin
                            BankAccount.Get(GLEntry."Source No.");
                            GLEntry."Source Name" := BankAccount.Name;
                            GLEntry.Modify();
                        end;
                    GLEntry."Source Type"::"Fixed Asset":
                        begin
                            FixedAsset.Get(GLEntry."Source No.");
                            GLEntry."Source Name" := FixedAsset.Description;
                            GLEntry.Modify();
                        end;
                    GLEntry."Source Type"::"IC Partner":
                        begin
                            ICPartner.Get(GLEntry."Source No.");
                            GLEntry."Source Name" := ICPartner.Name;
                            GLEntry.Modify();
                        end;
                end;
            until GLEntry.Next() = 0;
    end;
}
