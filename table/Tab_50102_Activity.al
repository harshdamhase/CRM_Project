table 50102 "Activity Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Activity No."; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Lead No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Lead."Lead No.";
        }

        field(3; "Activity Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(4; "Activity Type"; Enum "CRM Activity Type")
        {
            DataClassification = CustomerContent;
        }

        field(5; Subject; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(6; Description; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(7; "Assigned To"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(8; "Due Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(9; Status; Enum "Activity Status")
        {
            DataClassification = CustomerContent;
        }

        field(10; "Completed Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(11; "Created Date"; Date)
        {
            DataClassification = SystemMetadata;
        }

        field(12; "Created By"; Code[50])
        {
            DataClassification = SystemMetadata;
        }
        field(13; "Oppurtunity No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Opportunity."No.";

        }
        field(18; "Start Time"; Time)
        {

        }
        field(19; "End time"; Time)
        {

        }
    }

    keys
    {
        key(PK; "Activity No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        RecCRMSet: Record "CRM Setup Table";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if "Activity Date" = 0D then
            "Activity Date" := Today;

        "Created By" := UserId;
        "Created Date" := Today;


        If "Activity No." = '' then
            RecCRMSet.Get('CRM');

        if RecCRMSet."Activity No" = '' then
            Error('Activity No series Generated');

        "Activity No." := NoSeriesMgt.GetNextNo(RecCRMSet."Activity No", Today, true);



    end;
}