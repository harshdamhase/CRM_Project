page 50312 "Lead API"
{
    PageType = API;
    Caption = 'LeadAPIPage';
    APIPublisher = 'CRMCompany';
    APIGroup = 'lead';
    APIVersion = 'v1.1';
    EntityName = 'crmlead';
    EntitySetName = 'lead';
    SourceTable = Lead;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Leadno"; Rec."Lead No.")
                {

                }
                field("LeadName"; Rec."Lead Name")
                {

                }
                field("LeadPriority"; Rec."Lead Priority")
                {

                }
                field("LastFollowUpDate"; Rec."Last Follow-Up Date")
                {

                }
                field("CompanyName"; Rec."Company Name")
                {

                }
                field("AssignDate"; Rec."Assign Date")
                {

                }
                field("ContactDate"; Rec."Contact Date")
                {

                }
                field("CompleteDate"; Rec."Complete Date")
                {

                }
                field("CreatedBy"; Rec."Created By")
                {

                }
                field("LeadSource"; Rec."Lead Source")
                {

                }
                field("LeadStatus"; Rec."Lead Status")
                {

                }
                field("SalespersonCode"; Rec."Salesperson Code")
                {

                }
                field("ContactPerson"; Rec."Contact Person")
                {

                }
                field("NextFollowUpDate"; Rec."Next Follow-Up Date")
                {

                }
            }
        }
    }
}