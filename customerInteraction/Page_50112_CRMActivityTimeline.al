page 50112 "CRM Activity Timeline"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Activity Timeline";
    SourceTableView = sorting("Activity Date" = descending);
    Caption = 'Activity Timeline';

    layout
    {
        area(Content)
        {
            repeater(Timeline)
            {
                field("Activity Date"; Rec."Activity Date")
                {
                    ApplicationArea = All;
                }

                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                }

                field("Activity Type"; Rec."Activity Type")
                {
                    ApplicationArea = All;
                }

                field(Subject; Rec.Subject)
                {
                    ApplicationArea = All;
                }

                field("Interaction Status"; Rec."Interaction Status")
                {
                    ApplicationArea = All;
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenInteraction)
            {
                Caption = 'Open Interaction';
                ApplicationArea = All;
                Image = Edit;

                trigger OnAction()
                var
                    Interaction: Record "Customer Interaction";
                begin
                    if Rec."Source Type" <> Rec."Source Type"::"Customer Interaction" then
                        Error('This timeline entry is not a customer interaction.');
                    if not Interaction.Get(Rec."Source Entry No.") then
                        Error('The source interaction no longer exists.');
                    Page.Run(Page::"Customer Interaction Card", Interaction);
                end;
            }
        }
    }
}
