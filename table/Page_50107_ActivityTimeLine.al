page 50107 "Activity TimeLine"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Activity Table";

    layout
    {
        area(Content)
        {
            repeater(Activities)
            {
                field("Activity No."; Rec."Activity No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Activity Date"; Rec."Activity Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Activity Type"; Rec."Activity Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Subject; Rec.Subject)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Completed Date"; Rec."Completed Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Open Activity")
            {
                ApplicationArea = All;
                Caption = 'Open Activity';
                Image = View;

                trigger OnAction()
                var
                    ActivityCard: Page "Activity Card Page";
                begin
                    ActivityCard.SetRecord(Rec);
                    ActivityCard.RunModal();
                end;
            }
        }
    }
}