controladdin "Sales Calendar Control"
{
    RequestedHeight = 700;
    RequestedWidth = 1200;
    MinimumHeight = 500;
    MinimumWidth = 800;

    Scripts =
        'salesCalender.js';

    StartupScript =
        'salesCalender.js';

    event ControlReady();

    event ActivitySelected(ActivityNo: Code[20]);

    procedure LoadActivities(ActivityData: Text);
}