var Microsoft = Microsoft || {};
Microsoft.Dynamics = Microsoft.Dynamics || {};
Microsoft.Dynamics.NAV = Microsoft.Dynamics.NAV || {};

Microsoft.Dynamics.NAV.SalesCalendar = {

    controlReady: function () {
        Microsoft.Dynamics.NAV.SalesCalendarControl.ControlReady();
    },

    loadActivities: function (activityData) {
        // Read activity data
        // Create calendar
        // Display activities
    },

    selectActivity: function (activityNo) {
        Microsoft.Dynamics.NAV.SalesCalendarControl.ActivitySelected(activityNo);
    }
};