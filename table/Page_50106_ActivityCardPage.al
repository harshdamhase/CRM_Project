page 50106 "Activity Card Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Activity Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Activity No."; Rec."Activity No.")
                {

                    ApplicationArea = All;
                    Editable = false;
                }
                field("Lead No."; Rec."Lead No.")
                {
                    ShowMandatory = true;
                }
                field("Activity Type"; Rec."Activity Type")
                {
                }
                field("Activity Date"; Rec."Activity Date")
                {
                }
                field(Subject; Rec.Subject)
                {
                }

                field(Description; Rec.Description)
                {
                    MultiLine = true;
                }

                field("Assigned To"; Rec."Assigned To")
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Completed Date"; Rec."Completed Date")
                {
                    Editable = false;
                }
                field("Created Date"; Rec."Created Date")
                {
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Complete Activity")
            {
                ApplicationArea = All;
                Caption = 'Complete Activity';
                Image = Completed;

                trigger OnAction()
                var
                    LeadRec: Record Lead;
                    OpportunityRec: Record Opportunity;
                begin
                    if Rec.Status = Rec.Status::Completed then
                        Error('This activity is already completed.');

                    if Rec.Status = Rec.Status::Cancelled then
                        Error('Cancelled activities cannot be completed.');

                    Rec.Status := Rec.Status::Completed;
                    Rec."Completed Date" := Today;

                    Rec.Modify(true);

                    if (Rec."Activity Type" = Rec."Activity Type"::"Follow-Up") and (Rec."Lead No." <> '') then
                        if LeadRec.Get(Rec."Lead No.") then
                            UpdateLeadFollowUp(LeadRec, true);

                    if (Rec."Activity Type" = Rec."Activity Type"::"Follow-Up") and (Rec."Oppurtunity No" <> '') then
                        if OpportunityRec.Get(Rec."Oppurtunity No") then
                            UpdateOpportunityFollowUp(OpportunityRec);

                    Message(
                        'Activity %1 has been completed.',
                        Rec."Activity No.");
                end;
            }

            action("Cancel Activity")
            {
                ApplicationArea = All;
                Caption = 'Cancel Activity';
                Image = Cancel;

                trigger OnAction()
                var
                    LeadRec: Record Lead;
                    OpportunityRec: Record Opportunity;
                begin
                    if Rec.Status = Rec.Status::Completed then
                        Error('Completed activities cannot be cancelled.');
                    if Rec.Status = Rec.Status::Cancelled then
                        Error('This activity is already cancelled.');

                    Rec.Status := Rec.Status::Cancelled;
                    Rec.Modify(true);

                    if (Rec."Activity Type" = Rec."Activity Type"::"Follow-Up") and (Rec."Lead No." <> '') then
                        if LeadRec.Get(Rec."Lead No.") then
                            UpdateLeadFollowUp(LeadRec, false);

                    if (Rec."Activity Type" = Rec."Activity Type"::"Follow-Up") and (Rec."Oppurtunity No" <> '') then
                        if OpportunityRec.Get(Rec."Oppurtunity No") then
                            UpdateOpportunityFollowUp(OpportunityRec);

                    Message('Activity %1 has been cancelled.', Rec."Activity No.");
                end;
            }



        }
    }

    local procedure UpdateLeadFollowUp(var LeadRec: Record Lead; UpdateLastFollowUp: Boolean)
    var
        ActivityRec: Record "Activity Table";
    begin
        if UpdateLastFollowUp then
            LeadRec."Last Follow-Up Date" := Today;
        ActivityRec.SetCurrentKey("Lead No.", "Due Date");
        ActivityRec.SetRange("Lead No.", LeadRec."Lead No.");
        ActivityRec.SetRange("Activity Type", ActivityRec."Activity Type"::"Follow-Up");
        ActivityRec.SetRange(Status, ActivityRec.Status::Open);
        ActivityRec.SetFilter("Due Date", '>%1', 0D);
        if ActivityRec.FindFirst() then
            LeadRec."Next Follow-Up Date" := ActivityRec."Due Date"
        else
            LeadRec."Next Follow-Up Date" := 0D;
        LeadRec.Modify(true);
    end;

    local procedure UpdateOpportunityFollowUp(var OpportunityRec: Record Opportunity)
    var
        ActivityRec: Record "Activity Table";
    begin
        ActivityRec.SetCurrentKey("Oppurtunity No", "Due Date");
        ActivityRec.SetRange("Oppurtunity No", OpportunityRec."No.");
        ActivityRec.SetRange("Activity Type", ActivityRec."Activity Type"::"Follow-Up");
        ActivityRec.SetRange(Status, ActivityRec.Status::Open);
        ActivityRec.SetFilter("Due Date", '>%1', 0D);
        if ActivityRec.FindFirst() then begin
            OpportunityRec."Next Follow-up Date" := ActivityRec."Due Date";
            OpportunityRec."Next Follow-up Activity" := ActivityRec.Subject;
        end else begin
            OpportunityRec."Next Follow-up Date" := 0D;
            OpportunityRec."Next Follow-up Activity" := '';
        end;
        OpportunityRec.Modify(true);
    end;
}
