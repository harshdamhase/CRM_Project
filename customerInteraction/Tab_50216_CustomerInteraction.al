table 50216 "Customer Interaction"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Customer No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                RecCustomer: Record Customer;
            begin
                if RecCustomer.Get("Customer No") then
                    "Customer Name" := RecCustomer.Name;

            end;
        }
        field(3; "Customer Name"; Text[150])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(4; "Contact No"; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Interaction Type"; Enum "Customer Interaction Type")
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Subject"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Interaction Date"; date)
        {
            DataClassification = CustomerContent;
        }
        field(8; "Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Description"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Assigned User Id"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."Full Name";

        }

        field(13; Location; Text[100])
        {
            Caption = 'Location';
        }

        field(14; "Related Document No."; Code[20])
        {
            Caption = 'Related Document No.';
        }

        field(15; "Follow-up Required"; Boolean)
        {
            Caption = 'Follow-up Required';
        }

        field(16; "Follow-up Date"; Date)
        {
            Caption = 'Follow-up Date';

            trigger OnValidate()
            begin
                if "Follow-up Date" = 0D then
                    Error('Follow Up date required');
            end;
        }

        field(17; "Follow-up Notes"; Text[2048])
        {
            Caption = 'Follow-up Notes';
        }

        field(18; "Created By"; Code[50])
        {
            Caption = 'Created By';
            Editable = false;
        }

        field(19; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            Editable = false;
        }
        field(20; "CRM Interaction Type"; Enum "CRM Interaction Status")
        {

        }

    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
        key(CustomerDate; "Customer No", "Interaction Date")
        {
        }

        key(TypeDate; "Interaction Type", "Interaction Date")
        {
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
        "Created By" := CopyStr(UserId(), 1, MaxStrLen("Created By"));
        "Created DateTime" := CurrentDateTime();

        if "Interaction Date" = 0D then
            "Interaction Date" := Today();

        if "Assigned User ID" = '' then
            "Assigned User ID" := CopyStr(UserId(), 1, MaxStrLen("Assigned User ID"));


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