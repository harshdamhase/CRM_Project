page 50108 "Competeatror Track Listpart"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Competator Tracking";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Competitor Name"; Rec."Competitor Name")
                {
                    ApplicationArea = All;
                }

                field(Strength; Rec.Strength)
                {
                    ApplicationArea = All;
                }

                field(Weakness; Rec.Weakness)
                {
                    ApplicationArea = All;
                }

                field("Is Main Character"; Rec."Is Main Character")
                {
                    ApplicationArea = All;
                }

                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}