pageextension 50201 "Contact Page Ext" extends "Contact Card"
{
    layout
    {
        addafter("Salesperson Code")
        {
            field("Contact Category"; Rec."Contact Category")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the category of contact';
            }

        }

        addlast(General)
        {
            group("Communication Preferences")
            {
                Caption = 'Communication Preferences';

                field("Preferred Communication"; Rec."Preferred Communication")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the preferred communication method for the contact.';
                }

                field("Email Allowed"; Rec."Email Allowed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the contact can be contacted by email.';
                }

                field("Phone Allowed"; Rec."Phone Allowed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the contact can be contacted by phone.';
                }

                field("SMS Allowed"; Rec."SMS Allowed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the contact can be contacted by SMS.';
                }

                field("Marketing Allowed"; Rec."Marketing Allowed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether marketing communication is allowed.';
                }
                field("Reports to contact No"; Rec."Reports to contact No")
                {
                    ApplicationArea = All;
                }
            }
        }
        // Add changes to page layout here
    }


    actions
    {
        addlast(Processing)
        {
            action("Contact Relationships")
            {
                ApplicationArea = All;
                Caption = 'Relationships';
                Image = Relationship;

                trigger OnAction()
                var
                    ContactRelationship: Record "Contact Relationship Tab";
                begin
                    ContactRelationship.SetRange("Contact No", Rec."No.");
                    Page.Run(Page::"Contact Relationship", ContactRelationship);
                end;
            }
        }


    }

    var
        myInt: Integer;
}