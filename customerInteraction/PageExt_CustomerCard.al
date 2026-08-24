pageextension 50212 "Customer card Ext" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(factboxes)
        {
            part(ActivityTimeLine; "CRM Activity TimeLine")
            {
                ApplicationArea = all;
                SubPageLink = "Customer No" = field("No.");
            }
        }
    }

    actions
    {

        // Add changes to page actions here
        addlast(processing)
        {
            action(CustomerInteraction)
            {
                Caption = 'Customer Interaction';
                Image = History;
                ApplicationArea = all;

                RunObject = page "Customer Interactions List";
            }
            action(NewCustomerInteraction)
            {
                Caption = 'New Interaction';
                ApplicationArea = All;
                Image = New;

                trigger OnAction()
                var
                    Interaction: Record "Customer Interaction";
                    InteractionPage: Page "Customer Interaction Card";
                begin
                    Interaction.Init();
                    Interaction.Validate("Customer No", Rec."No.");
                    Interaction.Validate("Interaction Date", Today());

                    InteractionPage.SetRecord(Interaction);
                    InteractionPage.RunModal();
                end;
            }
        }
    }

    var
        myInt: Integer;
}