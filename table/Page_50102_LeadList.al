page 50102 "Lead List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Lead;
    CardPageId = "Lead Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Lead No."; Rec."Lead No.")
                {
                    ApplicationArea = All;
                }
                field("Lead Name"; Rec."Lead Name")
                {
                    ApplicationArea = All;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                }

                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = All;
                }

                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }

                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }

                field("Lead Status"; Rec."Lead Status")
                {
                    ApplicationArea = All;
                }

                field("Lead Source"; Rec."Lead Source")
                {
                    ApplicationArea = All;
                }
                field("Contact Date"; Rec."Contact Date")
                {

                }

                field("Lead Priority"; Rec."Lead Priority")
                {
                    ApplicationArea = All;
                }

                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }

                field("Next Follow-Up Date"; Rec."Next Follow-Up Date")
                {
                    ApplicationArea = All;
                }

                field("Expected Value"; Rec."Expected Value")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}