page 50112 "CRM Activity Timeline"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Customer Interaction";
    Caption = 'Activity Timeline';

    layout
    {
        area(Content)
        {
            repeater(Timeline)
            {
                field("Interaction Date"; Rec."Interaction Date")
                {
                    ApplicationArea = All;
                }

                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                }

                field("Interaction Type"; Rec."Interaction Type")
                {
                    ApplicationArea = All;
                }

                field(Subject; Rec.Subject)
                {
                    ApplicationArea = All;
                }

                field("Interaction Status"; Rec."CRM Interaction Type")
                {
                    ApplicationArea = All;
                }

                field("Contact Name"; Rec."Customer Name")
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
                    // Interaction := Rec;
                    Page.Run(Page::"Customer Interaction Card", Interaction);
                end;
            }
        }
    }
}