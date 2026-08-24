page 50110 "Customer Interactions List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Interaction";
    Caption = 'Customer Interactions';
    CardPageId = "Customer Interaction Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No")
                {
                    ApplicationArea = All;
                }

                field("Customer No."; Rec."Customer No")
                {
                    ApplicationArea = All;
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }



                field("Interaction Type"; Rec."Interaction Type")
                {
                    ApplicationArea = All;
                }

                field("Interaction Date"; Rec."Interaction Date")
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

                field("Follow-up Required"; Rec."Follow-up Required")
                {
                    ApplicationArea = All;
                }

                field("Follow-up Date"; Rec."Follow-up Date")
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
            action(NewInteraction)
            {
                Caption = 'New Interaction';
                ApplicationArea = All;
                Image = New;

                RunObject = page "Customer Interaction Card";

            }
        }
    }
}