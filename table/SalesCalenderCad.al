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
        ActivityJson: JsonObject;
        ActivitiesJson: JsonArray;
        CalendarPayload: JsonObject;
        ActivityData: Text;
        RangeStart: Date;
        RangeEnd: Date;
    begin
        Activity.Reset();
        Activity.SetCurrentKey("Activity Date");
        RangeStart := CalcDate('<-1Y>', WorkDate());
        RangeEnd := CalcDate('<1Y>', WorkDate());
        Activity.SetRange("Activity Date", RangeStart, RangeEnd);
        if Activity.FindSet(false) then
            repeat
                Clear(ActivityJson);
                ActivityJson.Add('activityNo', Activity."Activity No.");
                ActivityJson.Add('activityDate', Format(Activity."Activity Date", 0, '<Year4>-<Month,2>-<Day,2>'));
                ActivityJson.Add('subject', Activity.Subject);
                ActivityJson.Add('activityType', Format(Activity."Activity Type"));
                ActivityJson.Add('status', Format(Activity.Status));
                ActivityJson.Add('startTime', Format(Activity."Start Time"));
                ActivityJson.Add('endTime', Format(Activity."End time"));
                ActivityJson.Add('leadNo', Activity."Lead No.");
                ActivityJson.Add('opportunityNo', Activity."Oppurtunity No");
                ActivitiesJson.Add(ActivityJson);
            until Activity.Next() = 0;

        CalendarPayload.Add('rangeStart', Format(RangeStart, 0, '<Year4>-<Month,2>-<Day,2>'));
        CalendarPayload.Add('rangeEnd', Format(RangeEnd, 0, '<Year4>-<Month,2>-<Day,2>'));
        CalendarPayload.Add('activities', ActivitiesJson);
        CalendarPayload.WriteTo(ActivityData);
        CurrPage.Calendar.LoadActivities(ActivityData);
    end;

    local procedure OpenActivity(ActivityNo: Code[20])
    var
        Activity: Record "Activity Table";
    begin
        if Activity.Get(ActivityNo) then
            Page.Run(Page::"Activity Card Page", Activity);
    end;
}
