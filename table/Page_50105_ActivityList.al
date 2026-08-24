page 50105 "Activity List page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Activity Table";
    CardPageId = "Activity Card Page";

    layout
    {
        area(Content)
        {
            repeater(Activities)
            {
                field("Activity No."; Rec."Activity No.")
                {
                    ApplicationArea = All;
                }

                field("Lead No."; Rec."Lead No.")
                {
                    ApplicationArea = All;
                }

                field("Opportunity No."; Rec."Oppurtunity No")
                {
                    ApplicationArea = All;
                }

                field("Activity Date"; Rec."Activity Date")
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

                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = All;
                }

                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field("Completed Date"; Rec."Completed Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}