table 50201 "Contact Relationship Tab"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; "Contact No"; Code[20])
        {
            TableRelation = Contact."No.";
            Caption = 'COntact No';
        }
        field(3; "Related Contact No"; Code[20])
        {
            TableRelation = Contact."No.";
            Caption = 'Related Contact No';

            trigger OnValidate()
            var
            begin
                if "Related Contact No" = "Contact No" then
                    Error('Contact can not have any reltionship with itself');

            end;
        }
        field(50207; "Relationship Type"; Enum "Contact Relation Type")
        {
            Caption = 'RelationShip type';

        }
        field(50208; Description; text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
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