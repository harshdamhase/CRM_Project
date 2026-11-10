table 50217 "Activity Timeline"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }
        field(2; "Customer No"; Code[20])
        {
            TableRelation = Customer."No.";
            DataClassification = ToBeClassified;
        }
        field(3; "Activity Type"; Enum "Customer Interaction Type")
        {
            DataClassification = CustomerContent;
        }

        field(4; "Activity Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(5; Subject; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(6; Description; Text[2048])
        {
            DataClassification = CustomerContent;
        }

        field(7; "Source Type"; Enum "Activity Source Type")
        {
            DataClassification = SystemMetadata;
        }

        field(8; "Source Entry No."; Integer)
        {
            DataClassification = SystemMetadata;
        }

        field(9; "Created By"; Code[50])
        {
            DataClassification = SystemMetadata;
        }

        field(10; "Created DateTime"; DateTime)
        {
            DataClassification = SystemMetadata;
        }
        field(11; "Customer Name"; Text[150])
        {
            DataClassification = CustomerContent;
        }
        field(12; "Interaction Status"; Enum "CRM Interaction Status")
        {
            DataClassification = CustomerContent;
        }
        field(13; "Start Time"; Time)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; EntryNo)
        {
            Clustered = true;
        }
        key(CustomerDate; "Customer No", "Activity Date")
        {

        }
        key(ActivityDate; "Activity Date")
        {
        }
        key(SourceEntry; "Source Type", "Source Entry No.")
        {
            Unique = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
