tableextension 50201 "Contact Ext" extends "Contact"
{
    fields
    {
        field(50201; "Contact Category"; Enum "Contact Category")
        {
            DataClassification = CustomerContent;
            Caption = 'Contact Category';
        }
        field(50202; "preferred Communication"; Enum "Communication Preference")
        {
            DataClassification = CustomerContent;

        }
        field(50203; "Email allowed"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50204; "Phone Allowed"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50205; "SMS Allowed"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50206; "Marketing Allowed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50208; "Reports to contact No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Contact."No.";
            Caption = 'Reports to Contact NO';

            trigger OnValidate()
            var
            begin
                if "Reports to contact No" = "No." then
                    Error('Contact cannot report itself');

            end;

        }

    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}