var Microsoft = Microsoft || {};
Microsoft.Dynamics = Microsoft.Dynamics || {};
Microsoft.Dynamics.NAV = Microsoft.Dynamics.NAV || {};

var activities = [];
var displayedMonth = new Date();
displayedMonth.setDate(1);
var rangeStart = null;
var rangeEnd = null;

function selectActivity(activityNo) {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ActivitySelected', [activityNo]);
}

function LoadActivities(activityData) {
    try {
        var payload = JSON.parse(activityData || '{}');
        activities = payload.activities || [];
        rangeStart = parseDate(payload.rangeStart);
        rangeEnd = parseDate(payload.rangeEnd);
        if (rangeStart && displayedMonth < new Date(rangeStart.getFullYear(), rangeStart.getMonth(), 1))
            displayedMonth = new Date(rangeStart.getFullYear(), rangeStart.getMonth(), 1);
        if (rangeEnd && displayedMonth > new Date(rangeEnd.getFullYear(), rangeEnd.getMonth(), 1))
            displayedMonth = new Date(rangeEnd.getFullYear(), rangeEnd.getMonth(), 1);
    } catch (error) {
        activities = [];
        document.body.textContent = 'Could not load calendar activities.';
        return;
    }
    renderCalendar();
}

function parseDate(value) {
    if (!value) return null;
    var parts = value.split('-');
    return new Date(Number(parts[0]), Number(parts[1]) - 1, Number(parts[2]));
}

function renderCalendar() {
    var root = document.body;
    root.replaceChildren();

    var style = document.createElement('style');
    style.textContent = 'body{font:14px Arial,sans-serif;color:#202124;margin:0;padding:16px}.toolbar{display:flex;align-items:center;gap:12px;margin-bottom:12px}.toolbar h2{flex:1;margin:0;font-size:20px}.toolbar button,.event{font:inherit;cursor:pointer}.toolbar button{min-width:40px;min-height:40px;background:#fff;border:1px solid #9aa0a6;border-radius:6px}.grid{display:grid;grid-template-columns:repeat(7,minmax(0,1fr));border-top:1px solid #dadce0;border-left:1px solid #dadce0}.weekday,.day{min-width:0;padding:6px;border-right:1px solid #dadce0;border-bottom:1px solid #dadce0}.weekday{text-align:center;font-weight:700;background:#f8f9fa}.day{min-height:84px}.day.outside{background:#f8f9fa;color:#70757a}.daynum{font-weight:700;margin-bottom:4px}.event{display:block;width:100%;margin:3px 0;padding:4px 6px;border:0;border-radius:4px;background:#e8f0fe;color:#174ea6;text-align:left;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.empty{padding:10px 0;color:#5f6368}';
    root.appendChild(style);

    var toolbar = document.createElement('div');
    toolbar.className = 'toolbar';
    var previous = document.createElement('button');
    previous.type = 'button';
    previous.textContent = '‹';
    previous.setAttribute('aria-label', 'Previous month');
    previous.disabled = !!rangeStart &&
        displayedMonth <= new Date(rangeStart.getFullYear(), rangeStart.getMonth(), 1);
    previous.addEventListener('click', function () {
        displayedMonth.setMonth(displayedMonth.getMonth() - 1);
        renderCalendar();
    });
    var title = document.createElement('h2');
    title.textContent = displayedMonth.toLocaleDateString(undefined, { month: 'long', year: 'numeric' });
    var next = document.createElement('button');
    next.type = 'button';
    next.textContent = '›';
    next.setAttribute('aria-label', 'Next month');
    next.disabled = !!rangeEnd &&
        displayedMonth >= new Date(rangeEnd.getFullYear(), rangeEnd.getMonth(), 1);
    next.addEventListener('click', function () {
        displayedMonth.setMonth(displayedMonth.getMonth() + 1);
        renderCalendar();
    });
    toolbar.append(previous, title, next);
    root.appendChild(toolbar);

    var monthStart = new Date(displayedMonth.getFullYear(), displayedMonth.getMonth(), 1);
    var firstDayOffset = (monthStart.getDay() + 6) % 7;
    var daysInMonth = new Date(displayedMonth.getFullYear(), displayedMonth.getMonth() + 1, 0).getDate();
    var grid = document.createElement('div');
    grid.className = 'grid';
    ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].forEach(function (weekday) {
        var cell = document.createElement('div');
        cell.className = 'weekday';
        cell.textContent = weekday;
        grid.appendChild(cell);
    });

    var activityMap = {};
    activities.forEach(function (activity) {
        if (!activity.activityDate) return;
        (activityMap[activity.activityDate] || (activityMap[activity.activityDate] = [])).push(activity);
    });

    var cells = Math.ceil((firstDayOffset + daysInMonth) / 7) * 7;
    var visibleActivities = 0;
    for (var index = 0; index < cells; index++) {
        var dayNumber = index - firstDayOffset + 1;
        var isCurrentMonth = dayNumber >= 1 && dayNumber <= daysInMonth;
        var cellDate = new Date(displayedMonth.getFullYear(), displayedMonth.getMonth(), dayNumber);
        var cell = document.createElement('div');
        cell.className = 'day' + (isCurrentMonth ? '' : ' outside');
        var dayLabel = document.createElement('div');
        dayLabel.className = 'daynum';
        dayLabel.textContent = String(cellDate.getDate());
        cell.appendChild(dayLabel);

        var dateKey = cellDate.getFullYear() + '-' +
            String(cellDate.getMonth() + 1).padStart(2, '0') + '-' +
            String(cellDate.getDate()).padStart(2, '0');
        var dayActivities = activityMap[dateKey] || [];
        if (isCurrentMonth) visibleActivities += dayActivities.length;
        dayActivities.forEach(function (activity) {
            var eventButton = document.createElement('button');
            eventButton.type = 'button';
            eventButton.className = 'event';
            eventButton.textContent = (activity.startTime ? activity.startTime + ' ' : '') +
                (activity.subject || activity.activityType || activity.activityNo);
            eventButton.title = activity.activityType + ' · ' + activity.status;
            eventButton.addEventListener('click', function () {
                selectActivity(activity.activityNo);
            });
            cell.appendChild(eventButton);
        });
        grid.appendChild(cell);
    }
    root.appendChild(grid);

    if (!visibleActivities) {
        var empty = document.createElement('p');
        empty.className = 'empty';
        empty.textContent = 'No activities are scheduled for this month.';
        root.appendChild(empty);
    }
}

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlReady', []);
