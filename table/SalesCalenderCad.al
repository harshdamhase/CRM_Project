page 50310 "Sales Calendar card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Sales Calendar';

    layout
    {
        area(Content)
        {
            usercontrol(Calendar; "Sales Calendar Control")
            {
                ApplicationArea = All;

                trigger ControlReady()
                begin
                    LoadCalendarActivities();
                end;

                trigger ActivitySelected(ActivityNo: Code[20])
                begin
                    OpenActivity(ActivityNo);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
    end;

    local procedure LoadCalendarActivities()
    var
        Activity: Record "Activity Table";
        ActivityData: Text;
    begin
        Activity.Reset();

        if Activity.FindSet() then
            repeat
            // Activity data will be passed to JavaScript here.
            until Activity.Next() = 0;
    end;

    local procedure OpenActivity(ActivityNo: Code[20])
    var
        Activity: Record "Activity Table";
    begin
        if Activity.Get(ActivityNo) then
            Page.Run(Page::"Activity Card page", Activity);
    end;
}