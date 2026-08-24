page 50104 "Lead Registration"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Lead;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Lead No."; Rec."Lead No.")
                {

                }
                field("Lead Name"; Rec."Lead Name")
                {
                    ShowMandatory = true;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ShowMandatory = true;
                }
                field("Contact Person"; Rec."Contact Person")
                {

                }
                field(Email; Rec.Email)
                {

                }
                field("Phone No."; Rec."Phone No.")
                {

                }
            }
            group(Adddress)
            {
                field(Address; Rec.Address)
                {

                }
                field(City; Rec.City)
                {

                }

                field("Country/Region Code"; Rec."Country/Region Code")
                {

                }
            }
            group("Lead Information")
            {
                field("LeadSource"; Rec."Lead Source")
                {

                }
                field("Lead Priority"; Rec."Lead Priority")
                {

                }
            }
            group(Notes)
            {
                field(Remarks; Rec.Remarks)
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Register")
            {
                Caption = 'Lead Register';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.TestField("Lead Name");
                    Rec.TestField("Company Name");

                    if Rec."Lead Source" = Rec."Lead Source"::"Not Specified" then
                        Error('Please select Lead source');


                    if Rec."Lead Priority" = Rec."Lead Priority"::"Not Specified" then
                        Error('Please select Lead Priority.');

                    CurrPage.Close();


                end;
            }
        }
    }

    var
        myInt: Integer;
}