page 50100 "CRM Setup Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CRM Setup Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Lead Nos."; Rec."Lead Nos.")
                {
                    ApplicationArea = All;
                }
                field("Activity No"; Rec."Activity No")
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
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get('CRM') then begin
            Rec.Init();
            Rec."Primary Key" := 'CRM';
            Rec.Insert();
        end;
    end;
}