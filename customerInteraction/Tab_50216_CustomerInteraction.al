table 50216 "Customer Interaction"
{
    DataClassification = CustomerContent;

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
                if "Customer No" = '' then
                    "Customer Name" := ''
                else
                    if RecCustomer.Get("Customer No") then
                        "Customer Name" := RecCustomer.Name;
            end;
        }
        field(3; "Customer Name"; Text[150])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(4; "Contact No"; Code[20])
        {
            TableRelation = Contact."No.";
            DataClassification = CustomerContent;
        }
        field(5; "Interaction Type"; Enum "Customer Interaction Type")
        {
            DataClassification = CustomerContent;
        }
        field(6; "Subject"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(7; "Interaction Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(8; "Start Time"; Time)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ("Start Time" <> 0T) and ("End Time" <> 0T) and ("End Time" <= "Start Time") then
                    Error('End Time must be later than Start Time.');
            end;
        }
        field(9; "End Time"; Time)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ("Start Time" <> 0T) and ("End Time" <> 0T) and ("End Time" <= "Start Time") then
                    Error('End Time must be later than Start Time.');
            end;
        }
        field(10; "Description"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(11; "Assigned User ID"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
        }

        field(13; Location; Text[100])
        {
            Caption = 'Location';
            DataClassification = CustomerContent;
        }

        field(14; "Related Document No."; Code[20])
        {
            Caption = 'Related Document No.';
            DataClassification = CustomerContent;
        }

        field(15; "Follow-up Required"; Boolean)
        {
            Caption = 'Follow-up Required';
            DataClassification = CustomerContent;
        }

        field(16; "Follow-up Date"; Date)
        {
            Caption = 'Follow-up Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Follow-up Required" and ("Follow-up Date" = 0D) then
                    Error('Enter a follow-up date when follow-up is required.');
                if ("Follow-up Date" <> 0D) and ("Interaction Date" <> 0D) and
                   ("Follow-up Date" < "Interaction Date")
                then
                    Error('Follow-up Date cannot be earlier than Interaction Date.');
            end;
        }

        field(17; "Follow-up Notes"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Follow-up Notes';
        }

        field(18; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(19; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(20; "CRM Interaction Type"; Enum "CRM Interaction Status")
        {
            Caption = 'Interaction Status';
            DataClassification = CustomerContent;
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

    trigger OnInsert()
    var
        CustomerRec: Record Customer;
    begin
        TestField("Customer No");
        if not CustomerRec.Get("Customer No") then
            Error('Customer %1 does not exist.', "Customer No");
        "Customer Name" := CustomerRec.Name;
        "Created By" := CopyStr(UserId(), 1, MaxStrLen("Created By"));
        "Created DateTime" := CurrentDateTime();
        if "Interaction Date" = 0D then
            "Interaction Date" := WorkDate();
        if "Assigned User ID" = '' then
            "Assigned User ID" := CopyStr(UserId(), 1, MaxStrLen("Assigned User ID"));
        ValidateInteractionData();
    end;

    trigger OnModify()
    begin
        ValidateInteractionData();
    end;

    local procedure ValidateInteractionData()
    begin
        TestField("Customer No");
        TestField(Subject);
        if "Follow-up Required" then
            TestField("Follow-up Date");
        if ("Follow-up Date" <> 0D) and ("Follow-up Date" < "Interaction Date") then
            Error('Follow-up Date cannot be earlier than Interaction Date.');
        if ("Start Time" <> 0T) and ("End Time" <> 0T) and ("End Time" <= "Start Time") then
            Error('End Time must be later than Start Time.');
    end;
}
