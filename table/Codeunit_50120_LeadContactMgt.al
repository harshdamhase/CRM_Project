codeunit 50120 "Lead Contact Management"
{
    procedure CreateContactFromLead(var Lead: Record Lead): Code[20]
    var
        Contact: Record Contact;
        MarketingSetup: Record "Marketing Setup";
        NoSeries: Codeunit "No. Series";
        ContactNo: Code[20];
    begin
        // Lead must be Qualified
        if Lead."Lead Status" <> Lead."Lead Status"::Qualified then
            Error(
                'Only Qualified Leads can be converted to a Contact.');

        // Check whether Contact is already created
        if Lead."Contact No" <> '' then
            Error(
                'Lead %1 is already linked to Contact %2.',
                Lead."Lead No.",
                Lead."Contact No");

        // Get Marketing Setup
        MarketingSetup.Get();

        // Check Contact Number Series
        if MarketingSetup."Contact Nos." = '' then
            Error('Contact No. Series is not configured in Marketing Setup.');

        // Generate Contact No.
        ContactNo := NoSeries.GetNextNo(MarketingSetup."Contact Nos.", WorkDate(), true);

        // Initialize Contact
        Contact.Init();

        Contact."No." := ContactNo;

        // Copy Lead information to Contact
        Contact.Validate(Name, Lead."Contact Person");


        Contact.Validate("Phone No.", Lead."Phone No.");


        Contact.Validate("E-Mail", Lead.Email);

        Contact.Validate(Address, Lead.Address);

        Contact.Validate(City, Lead.City);

        Contact.Validate("Post Code", Lead."Post Code");

        Contact.Validate("Country/Region Code", Lead."Country/Region Code");

        Contact.Validate("Salesperson Code", Lead."Salesperson Code");

        // Insert Contact
        Contact.Insert(true);

        // Link Contact with Lead
        Lead."Contact No" := Contact."No.";

        Lead.Modify(true);

        exit(Contact."No.");
    end;
}