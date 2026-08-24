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
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        ActivityCard: Page "Activity Card Page";
                    begin
                        ActivityCard.SetRecord(Rec);
                        ActivityCard.RunModal();
                    end;
                }
                field("Lead No."; Rec."Lead No.")
                {
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Activity Type"; Rec."Activity Type")
                {
                    Editable = false;

                }
                field("Activity Date"; Rec."Activity Date")
                {
                    Editable = false;
                }
                field(Subject; Rec.Subject)
                {
                    Editable = false;

                }

                field("Assigned To"; Rec."Assigned To")
                {
                    Editable = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    Editable = false;
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
                begin
                    if Rec.Status = Rec.Status::Completed then
                        Error('This activity is already completed.');

                    if Rec.Status = Rec.Status::Cancelled then
                        Error('Cancelled activities cannot be completed.');

                    Rec.Status := Rec.Status::Completed;
                    Rec."Completed Date" := Today;

                    Rec.Modify(true);

                    if Rec."Activity Type" =
                       Rec."Activity Type"::"Follow-Up"
                    then begin
                        if LeadRec.Get(Rec."Lead No.") then begin
                            LeadRec."Last Follow-Up Date" := Today;
                            LeadRec."Next Follow-Up Date" := 0D;

                            LeadRec.Modify(true);
                        end;
                    end;

                    Message(
                        'Activity %1 has been completed.',
                        Rec."Activity No.");
                end;
            }



        }
    }


    var
        myInt: Integer;
}