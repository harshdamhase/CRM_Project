page 50103 "Lead Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Lead;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Lead No."; Rec."Lead No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Lead Name"; Rec."Lead Name")
                {
                    ApplicationArea = All;
                }

                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                }

                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = All;
                }

                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }

                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }

                field("Contact No"; Rec."Contact No")
                {
                    ApplicationArea = All;

                }
            }

            group(Addresss)
            {
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }

                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }

                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }

                field("Country-Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                }

                field("Country Name"; Rec."Country Name")
                {
                    ApplicationArea = All;
                }
            }

            group("Lead Information")
            {
                field("Lead Status"; Rec."Lead Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Lead Source"; Rec."Lead Source")
                {
                    ApplicationArea = All;
                }

                field("Lead Priority"; Rec."Lead Priority")
                {
                    ApplicationArea = All;
                }

                field("Contact Date"; Rec."Contact Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            group(Assignment)
            {
                field("SalesPerson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }

                field("Assign Date"; Rec."Assign Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            group(Qualification)
            {
                field("Qualified Date"; Rec."Qualified Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Qualified By"; Rec."Qualified By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            group(FollowUp)
            {
                field("Last Followup Date"; Rec."Last Follow-Up Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Next FollowUp Date"; Rec."Next Follow-Up Date")
                {
                    ApplicationArea = All;
                }
            }

            group(Conversion)
            {
                field("Customer No"; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Conversion Date"; Rec."Conversion Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            group("Activity TimeLine")
            {
                part(ActivityTimeLine; "Activity TimeLine")
                {
                    ApplicationArea = All;
                    SubPageLink = "Lead No." = field("Lead No.");
                }
            }

            group(Notes)
            {
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
            }

            group(Audit)
            {
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Modified Date"; Rec."Modified Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Assign Lead")
            {
                Caption = 'Assign Lead';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = New;

                trigger OnAction()
                begin
                    Rec.TestField("Salesperson Code");

                    Rec."Assign Date" := Today;
                    Rec."Lead Status" := Rec."Lead Status"::Assigned;

                    Rec.Modify(true);

                    Message(
                        'Lead %1 has been assigned to %2.',
                        Rec."Lead No.",
                        Rec."Salesperson Code");
                end;
            }

            action("Contact Lead")
            {
                Caption = 'Contact Lead';
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                Image = Calls;

                trigger OnAction()
                begin
                    if Rec."Lead Status" <> Rec."Lead Status"::Assigned then
                        Error(
                            'Only Assigned Leads can be marked as Contacted.');

                    Rec."Lead Status" := Rec."Lead Status"::Contacted;
                    Rec."Contact Date" := Today;

                    Rec.Modify(true);

                    Message(
                        'Lead %1 has been contacted.',
                        Rec."Lead No.");
                end;
            }

            action("Qualify Lead")
            {
                Caption = 'Qualify Lead';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = Approve;

                trigger OnAction()
                begin
                    if Rec."Lead Status" <> Rec."Lead Status"::Contacted then
                        Error(
                            'Only Contacted Leads can be qualified.');

                    Rec."Qualified Date" := Today;
                    Rec."Qualified By" := UserId;
                    Rec."Lead Status" := Rec."Lead Status"::Qualified;

                    Rec.Modify(true);

                    Message(
                        'Lead %1 has been qualified successfully.',
                        Rec."Lead No.");
                end;
            }

            action("Schedule Follow-Up")
            {
                Caption = 'Schedule Follow-Up';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = Calendar;

                trigger OnAction()
                var
                    ActivityRec: Record "Activity Table";
                begin
                    if Rec."Lead Status" <> Rec."Lead Status"::Qualified then
                        Error(
                            'Only Qualified Leads can have a follow-up scheduled.');

                    Rec.TestField("Next Follow-Up Date");

                    if Rec."Next Follow-Up Date" <= Today then
                        Error(
                            'Next Follow-Up Date must be a future date.');

                    ActivityRec.Reset();

                    ActivityRec.SetRange(
                        "Lead No.",
                        Rec."Lead No.");

                    ActivityRec.SetRange(
                        "Activity Type",
                        ActivityRec."Activity Type"::"Follow-Up");

                    ActivityRec.SetRange(
                        Status,
                        ActivityRec.Status::Open);

                    if not ActivityRec.IsEmpty() then
                        Error(
                            'An open follow-up already exists for this Lead.');

                    ActivityRec.Init();

                    ActivityRec."Lead No." := Rec."Lead No.";

                    ActivityRec."Activity Type" := ActivityRec."Activity Type"::"Follow-Up";

                    ActivityRec."Activity Date" := Today;


                    ActivityRec.Subject := 'Lead Follow-Up';


                    ActivityRec."Assigned To" := Rec."Salesperson Code";


                    ActivityRec."Due Date" := Rec."Next Follow-Up Date";


                    ActivityRec.Status := ActivityRec.Status::Open;

                    ActivityRec.Insert(true);

                    Message('Follow-up has been scheduled for %1.',
                        Rec."Next Follow-Up Date");
                end;
            }

            action("Activities")
            {
                ApplicationArea = All;
                Caption = 'Activities';
                Image = EntriesList;

                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ActivityRec: Record "Activity Table";
                    ActivityList: Page "Activity List page";
                begin
                    ActivityRec.Reset();

                    ActivityRec.SetRange(
                        "Lead No.",
                        Rec."Lead No.");

                    ActivityList.RunModal();
                end;
            }


            action("Open Contact")
            {
                ApplicationArea = All;
                Caption = 'Open Contact';
                Image = ContactPerson;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    Contact: Record Contact;
                begin
                    if Rec."Contact No" = '' then
                        Error(
                            'No Contact is linked to Lead %1.',
                            Rec."Lead No.");

                    if not Contact.Get(Rec."Contact No") then
                        Error(
                            'Contact %1 does not exist.',
                            Rec."Contact No");

                    Page.Run(
                        Page::"Contact Card",
                        Contact);
                end;

            }


            action("Create Contact")
            {
                Caption = 'Create Contact';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = ContactPerson;

                ToolTip = 'Create a Contact from this Lead.';

                trigger OnAction()
                var
                    LeadContactMgt: Codeunit "Lead Contact Management";
                    Contact: Record Contact;
                    ContactNo: Code[20];
                begin
                    // Lead must be Qualified
                    if Rec."Lead Status" <> Rec."Lead Status"::Qualified then
                        Error(
                            'Only Qualified Leads can be converted to a Contact.');

                    // Prevent duplicate Contact creation
                    if Rec."Contact No" <> '' then
                        Error('Lead %1 is already linked to Contact %2.',
                            Rec."Lead No.",
                            Rec."Contact No");

                    // Ask confirmation
                    if not Confirm(
                        'Do you want to create a Contact from Lead %1?',
                        false,
                        Rec."Lead No.")
                    then
                        exit;

                    // Create Contact
                    ContactNo := LeadContactMgt.CreateContactFromLead(Rec);

                    // Get newly created Contact
                    Contact.Get(ContactNo);

                    Message(
                        'Contact %1 has been created successfully from Lead %2.',
                        Contact."No.",
                        Rec."Lead No.");

                    // Open Contact Card
                    Page.Run(
                        Page::"Contact Card",
                        Contact);
                end;
            }
        }
    }
}