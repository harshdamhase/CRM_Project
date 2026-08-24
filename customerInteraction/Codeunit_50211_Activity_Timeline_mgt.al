
codeunit 50211 "Activity Timeline Mgt"
{

    procedure CreateFromInteraction(Interaction: Record "Customer Interaction")
    var
        Timeline: Record "Activity Timeline";
    begin
        Timeline.Init();

        Timeline."Customer No" := Interaction."Customer No";
        Timeline."Activity Type" := Interaction."Interaction Type";
        Timeline."Activity Date" := Interaction."Interaction Date";
        Timeline.Subject := Interaction.Subject;
        Timeline.Description := Interaction.Description;
        Timeline."Source Entry No." := Interaction."Entry No";
        Timeline."Created By" := UserId;
        Timeline."Created DateTime" := CurrentDateTime();

        Timeline.Insert(true);
    end;
}