pageextension 50210 "Opportunity CRM Page Ext" extends "Opportunity Card"
{
    layout
    {
        addlast(General)
        {
            group("CRM Opportunity Information")
            {
                Caption = 'CRM Opportunity Information';

                field("Probability %"; Rec."Probability %")
                {
                    ApplicationArea = All;
                }

                field("Next Follow-up Date"; Rec."Next Follow-up Date")
                {
                    ApplicationArea = All;
                }

                field("Next Follow-up Activity"; Rec."Next Follow-up Activity")
                {
                    ApplicationArea = All;
                }

                field("CRM Oppurtunity Stage"; Rec."CRM Oppurtunity Stage")
                {
                    ApplicationArea = All;
                }

                field("Loss Reason"; Rec."Loss Reason")
                {
                    ApplicationArea = All;
                }

                field("Lost To Competitor"; Rec."Lost To Competitor")
                {
                    ApplicationArea = All;
                }

                field("Loss Remarks"; Rec."Loss Remarks")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
        }

        addlast(Content)
        {
            group(Competetor)
            {
                Caption = 'Competitor';

                part("Competetor Tracking"; "Competeatror Track Listpart")
                {
                    ApplicationArea = All;

                    SubPageLink =
                        "Oppurtunty No" = field("No.");
                }
            }
        }
    }

    actions
    {
        addlast(Processing)
        {
            action("Create Follow-Up")
            {
                Caption = 'Create Follow-Up';
                ApplicationArea = All;
                Image = Create;

                ToolTip = 'Creates a follow-up activity for this opportunity.';

                trigger OnAction()
                var
                    RecActivity: Record "Activity Table";
                begin
                    // 1. Check follow-up date
                    Rec.TestField("Next Follow-up Date");

                    // 2. Check follow-up date is not in the past
                    if Rec."Next Follow-up Date" < Today then
                        Error(
                            'Next Follow-up Date cannot be in the past.');

                    // 3. Check follow-up activity
                    if Rec."Next Follow-up Activity" = '' then
                        Error(
                            'Please enter Next Follow-up Activity.');

                    // 4. Create new Activity
                    RecActivity.Init();

                    // 5. Link Activity to current Opportunity
                    RecActivity."Oppurtunity No" := Rec."No.";

                    // 6. Activity Date
                    RecActivity."Activity Date" := Today;

                    // 7. Activity Subject
                    RecActivity.Subject :=
                        Rec."Next Follow-up Activity";

                    // 8. Assign to Opportunity salesperson
                    RecActivity."Assigned To" :=
                        Rec."Salesperson Code";

                    // 9. Set Due Date
                    RecActivity."Due Date" :=
                        Rec."Next Follow-up Date";

                    // 10. Set Activity Status
                    RecActivity.Status :=
                        RecActivity.Status::Open;

                    // 11. Insert Activity
                    RecActivity.Insert(true);

                    Message(
                        'Follow-up activity %1 has been created.',
                        RecActivity."Activity No.");
                end;
            }
        }
    }
}