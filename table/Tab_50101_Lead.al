table 50101 Lead
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Lead No."; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Lead Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(3; "Company Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(4; "Contact Person"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(5; Email; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(6; "Phone No."; Text[20])
        {
            DataClassification = CustomerContent;
        }

        field(7; Website; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(8; Address; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(9; City; Text[50])
        {
            DataClassification = CustomerContent;
        }

        field(10; "Post Code"; Code[20])
        {
            TableRelation = "Post Code".Code;
            DataClassification = CustomerContent;
        }

        field(11; "Country/Region Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";

            trigger OnValidate()
            var
                RecCountry: Record "Country/Region";
            begin
                if RecCountry.get("Country/Region Code") then
                    "Country Name" := RecCountry.Name;
            end;
        }

        field(34; "Country Name"; text[60])
        {
            DataClassification = CustomerContent;

        }
        field(12; "Lead Status"; Enum "Lead Status")
        {
            DataClassification = CustomerContent;
        }

        field(13; "Lead Source"; Enum "Lead Source")
        {
            DataClassification = CustomerContent;
        }

        field(14; "Lead Priority"; Enum "Lead Priority")
        {
            DataClassification = CustomerContent;
        }

        field(15; "Salesperson Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".code;
        }

        field(16; "Assign Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(17; "Qualified Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(18; "Qualified By"; Code[50])
        {
            DataClassification = CustomerContent;
        }

        field(19; "Next Follow-Up Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(20; "Last Follow-Up Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(21; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }

        field(22; "Conversion Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(23; "Expected Value"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(24; "Expected Closing Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(25; "Industry"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(26; "Lost Reason"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(27; Remarks; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(28; "Created By"; Code[50])
        {
            DataClassification = SystemMetadata;
        }

        field(29; "Created Date"; Date)
        {
            DataClassification = SystemMetadata;
        }

        field(30; "Modified By"; Code[50])
        {
            DataClassification = SystemMetadata;
        }

        field(31; "Modified Date"; Date)
        {
            DataClassification = SystemMetadata;
        }
        field(32; "Contact Date"; date)
        {
            DataClassification = SystemMetadata;
        }
        field(35; "Complete Date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Contact No"; Code[20])
        {
            TableRelation = Contact."No.";
            DataClassification = CustomerContent;

        }

    }

    keys
    {
        key(PK; "Lead No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NoSeriesmgt: Codeunit "No. Series";
        RecCRMSetup: Record "CRM Setup Table";
        RecLead: Record Lead;
    begin
        //duplidate 

        if ("Company Name" <> '') and (Email <> ' ') then begin
            RecLead.Reset();
            RecLead.SetRange("Company Name", "Company Name");
            RecLead.SetRange(Email, Email);

            if RecLead.FindFirst() then
                Error('Duplicate Lead found. Lead %1 already exists for Company %2 with Email %3.',
                RecLead."Lead No.", RecLead."Company Name", RecLead.Email);
        end;


        "Created By" := UserId;
        "Created Date" := Today;
        "Modified By" := UserId;
        "Modified Date" := Today;
        "Last Follow-Up Date" := Today;


        //generate no series
        if "Lead No." = '' then
            RecCRMSetup.Get('CRM');

        if RecCRMSetup."Lead Nos." = '' then
            Error('Noseries not genereted.');

        "Lead No." := NoSeriesmgt.GetNextNo(RecCRMSetup."Lead Nos.", Today, true);

        //default values
        "Lead Priority" := "Lead Priority"::Medium;
        "Lead Status" := "Lead Status"::New;

    end;

    trigger OnModify()
    begin
        "Modified By" := UserId;
        "Modified Date" := Today;
    end;
}