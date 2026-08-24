table 50211 "Opportunity Competitor"
{
    Caption = 'Opportunity Competitor';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Opportunity No."; Code[20])
        {
            Caption = 'Opportunity No.';
            TableRelation = Opportunity."No.";
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }

        field(3; "Competitor Name"; Text[100])
        {
            Caption = 'Competitor Name';
        }

        field(4; Strength; Text[250])
        {
            Caption = 'Strength';
        }

        field(5; Weakness; Text[250])
        {
            Caption = 'Weakness';
        }

        field(6; "Is Main Competitor"; Boolean)
        {
            Caption = 'Main Competitor';
        }

        field(7; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
    }

    keys
    {
        key(PK; "Opportunity No.", "Line No.")
        {
            Clustered = true;
        }
    }
}