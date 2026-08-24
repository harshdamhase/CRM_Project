table 50103 "Competator Tracking"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Oppurtunty No"; Code[20])
        {
            Caption = 'Opportunity No.';
            DataClassification = CustomerContent;
            TableRelation = Opportunity."No.";
        }

        field(2; "Line No"; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }

        field(3; "Competitor Name"; Text[250])
        {
            Caption = 'Competitor Name';
            DataClassification = CustomerContent;
        }

        field(4; Strength; Text[250])
        {
            Caption = 'Strength';
            DataClassification = CustomerContent;
        }

        field(5; Weakness; Text[250])
        {
            Caption = 'Weakness';
            DataClassification = CustomerContent;
        }

        field(6; "Is Main Character"; Boolean)
        {
            Caption = 'Is Main Competitor';
            DataClassification = CustomerContent;
        }

        field(7; Remarks; Text[100])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Oppurtunty No", "Line No")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        CompetitorTracking: Record "Competator Tracking";
    begin
        if "Line No" = 0 then begin
            CompetitorTracking.SetRange(
                "Oppurtunty No",
                "Oppurtunty No");

            if CompetitorTracking.FindLast() then
                "Line No" := CompetitorTracking."Line No" + 10000
            else
                "Line No" := 10000;
        end;
    end;
}