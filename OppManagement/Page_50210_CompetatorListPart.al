page 50210 "Competator ListPart"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Competator Tracking";

    layout
    {
        area(Content)
        {
            repeater(Competitor)
            {
                field("Oppurtunty No"; Rec."Oppurtunty No")
                {

                }
                field("Line No"; Rec."Line No")
                {

                }
                field("Competitor Name"; Rec."Competitor Name")
                {

                }
                field(Strength; Rec.Strength)
                {

                }
                field(Weakness; Rec.Weakness)
                {

                }
                field("Is Main Character"; Rec."Is Main Character")
                {

                }
                field(Remarks; Rec.Remarks)
                {

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}