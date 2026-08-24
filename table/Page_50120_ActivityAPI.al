page 50120 "Activity APIPAge"
{
    PageType = API;
    Caption = 'Activity API Page';
    APIPublisher = 'CRMCompany';
    APIGroup = 'CRM';
    APIVersion = 'v1.0';
    EntityName = 'activity';
    EntitySetName = 'activities';
    SourceTable = "Activity Table";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(activityno; Rec."Activity No.")
                {
                    Caption = 'fieldCaption';

                }
                field(leadno; Rec."Lead No.")
                {

                }
                field(activitydate; Rec."Activity Date")
                {

                }
                field(activitytype; Rec."Activity Type")
                {

                }
                field(subject; Rec.Subject)
                {

                }
                field(Description; Rec.Description)
                {

                }
                field("assignedto"; Rec."Assigned To")
                {

                }
                field(duedate; Rec."Due Date")
                {

                }
                field(status; Rec.Status)
                {

                }
                field("CompletedDate"; Rec."Completed Date")
                {

                }
                field("CreatedDate"; Rec."Created Date")
                {

                }
                field("CreatedBy"; Rec."Created By")
                {

                }
                field("OppurtunityNo"; Rec."Oppurtunity No")
                {

                }
                field("StartTime"; Rec."Start Time")
                {

                }
                field("Endtime"; Rec."End time")
                {

                }
            }
        }
    }
}