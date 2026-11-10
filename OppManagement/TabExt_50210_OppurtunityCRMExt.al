tableextension 50210 "Oppurtunity CRM EXT" extends Opportunity
{
    fields
    {


        field(50211; "Next Follow-up Date"; Date)
        {
            Caption = 'Next Follow-up Date';
            DataClassification = CustomerContent;
        }

        field(50212; "Next Follow-up Activity"; Text[100])
        {
            Caption = 'Next Follow-up Activity';
            DataClassification = CustomerContent;
        }

        field(50213; "Loss Reason"; Code[20])
        {
            Caption = 'Loss Reason';
            DataClassification = CustomerContent;
        }

        field(50124; "Lost To Competitor"; Text[100])
        {
            Caption = 'Lost To Competitor';
            DataClassification = CustomerContent;
        }

        field(50125; "Loss Remarks"; Text[250])
        {
            Caption = 'Loss Remarks';
            DataClassification = CustomerContent;
        }

        field(50126; "Won Date"; Date)
        {
            Caption = 'Won Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50127; "Lost Date"; Date)
        {
            Caption = 'Lost Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50128; "CRM Oppurtunity Stage"; Enum "Oppurtunity Stage")
        {
            Caption = 'CRM Opportunity Stage';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                case "CRM Oppurtunity Stage" of
                    "CRM Oppurtunity Stage"::Won:
                        begin
                            "Won Date" := WorkDate();
                            "Lost Date" := 0D;
                        end;
                    "CRM Oppurtunity Stage"::Lost:
                        begin
                            "Lost Date" := WorkDate();
                            "Won Date" := 0D;
                        end;
                    else begin
                        "Won Date" := 0D;
                        "Lost Date" := 0D;
                    end;
                end;
            end;
        }

        field(50129; "CRM Probability %"; Decimal)
        {
            Caption = 'CRM Probability %';
            MinValue = 0;
            MaxValue = 100;
            DataClassification = CustomerContent;
        }
    }

}
