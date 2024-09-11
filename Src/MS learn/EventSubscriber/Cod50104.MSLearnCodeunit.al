codeunit 50104 "MS Learn Codeunit"
{
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeValidateEvent', 'Address', true, true)]
    local procedure OnBeforeValidateEventAddress(var Rec: Record Customer)
    begin
        CheckForPlusSign(Rec.Address);
    end;

    local procedure CheckForPlusSign(TextToValidate: Text)
    begin
        if TextToValidate.Contains('+') then Message('A + sign has been found.');
    end;
}
