page 50111 "Customer Interaction Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Customer Interaction";
    Caption = 'Customer Interaction Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Customer No."; Rec."Customer No")
                {
                    ApplicationArea = All;

                    ToolTip = 'Select the customer for this interaction.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(false);
                    end;
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Contact No."; Rec."Contact No")
                {
                    ApplicationArea = All;
                }

                field("Interaction Status"; Rec."CRM Interaction Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Interaction Type"; Rec."Interaction Type")
                {
                    ApplicationArea = All;
                }

                field(Subject; Rec.Subject)
                {
                    ApplicationArea = All;
                }

                // field(Status; Rec.Status)
                // {
                //     ApplicationArea = All;
                // }
            }

            group(Schedule)
            {
                Caption = 'Schedule';

                field("Interaction Date"; Rec."Interaction Date")
                {
                    ApplicationArea = All;
                }

                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                }

                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = All;
                }

                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }

                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                }
            }

            group(Details)
            {
                Caption = 'Details';

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }

                field("Related Document No."; Rec."Related Document No.")
                {
                    ApplicationArea = All;
                }
            }

            group("Follow-up")
            {
                Caption = 'Follow-up';

                field("Follow-up Required"; Rec."Follow-up Required")
                {
                    ApplicationArea = All;
                }

                field("Follow-up Date"; Rec."Follow-up Date")
                {
                    ApplicationArea = All;
                }

                field("Follow-up Notes"; Rec."Follow-up Notes")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MarkCompleted)
            {
                Caption = 'Mark Completed';
                ApplicationArea = All;
                Image = Approve;

                trigger OnAction()
                begin
                    if Rec."CRM Interaction Type" = Rec."CRM Interaction Type"::Cancelled then
                        Error('Cancelled interactions cannot be completed.');
                    if Rec."CRM Interaction Type" = Rec."CRM Interaction Type"::Completed then
                        Error('This interaction is already completed.');

                    Rec."CRM Interaction Type" := Rec."CRM Interaction Type"::Completed;
                    Rec.Modify(true);
                end;
            }

            action(CancelInteraction)
            {
                Caption = 'Cancel Interaction';
                ApplicationArea = All;
                Image = Cancel;

                trigger OnAction()
                begin
                    if Rec."CRM Interaction Type" = Rec."CRM Interaction Type"::Completed then
                        Error('Completed interactions cannot be cancelled.');
                    if Rec."CRM Interaction Type" = Rec."CRM Interaction Type"::Cancelled then
                        Error('This interaction is already cancelled.');

                    Rec."CRM Interaction Type" := Rec."CRM Interaction Type"::Cancelled;
                    Rec.Modify(true);
                end;
            }

            action("New Interaction")
            {
                ApplicationArea = All;
                Image = New;

                trigger OnAction()
                begin
                    Page.Run(Page::"Customer Interaction Card");
                end;
            }
            action(ActivityTimeline)
            {
                Caption = 'Activity Timeline';
                ApplicationArea = All;
                Image = History;

                RunObject = page "CRM Activity Timeline";
                RunPageLink = "Customer No" = field("Customer No");
            }
        }
    }
}
