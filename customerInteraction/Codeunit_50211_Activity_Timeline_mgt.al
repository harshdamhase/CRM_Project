
codeunit 50211 "Activity Timeline Mgt"
{
    [EventSubscriber(ObjectType::Table, Database::"Customer Interaction", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnInteractionInserted(var Interaction: Record "Customer Interaction"; RunTrigger: Boolean)
    begin
        SyncInteraction(Interaction);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Customer Interaction", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnInteractionModified(var Interaction: Record "Customer Interaction"; var xInteraction: Record "Customer Interaction"; RunTrigger: Boolean)
    begin
        SyncInteraction(Interaction);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Customer Interaction", 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnInteractionDeleted(var Interaction: Record "Customer Interaction"; RunTrigger: Boolean)
    var
        Timeline: Record "Activity Timeline";
    begin
        Timeline.SetCurrentKey("Source Type", "Source Entry No.");
        Timeline.SetRange("Source Type", Timeline."Source Type"::"Customer Interaction");
        Timeline.SetRange("Source Entry No.", Interaction."Entry No");
        if Timeline.FindFirst() then
            Timeline.Delete(true);
    end;

    local procedure SyncInteraction(Interaction: Record "Customer Interaction")
    var
        Timeline: Record "Activity Timeline";
        IsNew: Boolean;
    begin
        Timeline.SetCurrentKey("Source Type", "Source Entry No.");
        Timeline.SetRange("Source Type", Timeline."Source Type"::"Customer Interaction");
        Timeline.SetRange("Source Entry No.", Interaction."Entry No");
        IsNew := not Timeline.FindFirst();

        if IsNew then begin
            Timeline.Init();
            Timeline."Created By" := UserId;
            Timeline."Created DateTime" := CurrentDateTime();
            Timeline."Source Entry No." := Interaction."Entry No";
            Timeline."Source Type" := Timeline."Source Type"::"Customer Interaction";
        end;
        Timeline."Customer No" := Interaction."Customer No";
        Timeline."Customer Name" := Interaction."Customer Name";
        Timeline."Activity Type" := Interaction."Interaction Type";
        Timeline."Activity Date" := Interaction."Interaction Date";
        Timeline."Start Time" := Interaction."Start Time";
        Timeline.Subject := Interaction.Subject;
        Timeline.Description := Interaction.Description;
        Timeline."Interaction Status" := Interaction."CRM Interaction Type";
        if IsNew then
            Timeline.Insert(true)
        else
            Timeline.Modify(true);
    end;
}
