page 50201 "Contact Relationship"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Contact Relationship Tab";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No"; Rec."Entry No")
                {

                }
                field("Contact No"; Rec."Contact No")
                {

                }
                field("Related Contact No"; Rec."Related Contact No")
                {

                }
                field("Relationship Type"; Rec."Relationship Type")
                {

                }
                field(Description; Rec.Description)
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







        }
    }
}