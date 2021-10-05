## C85-MyHealthCalendar

## Blood pressure management calendar
Enter your daily blood pressure into the calendar to help your health.

Extend the feature of Simple calendar. Enter daily blood pressure record, create a monthly blood pressure list based on the entered records and display it. And records are displayed as bar graphs.

<img src="http://mikomokaru.sakura.ne.jp/data/02/calendarMain.png" alt="calendar" title="calendar" width="300">

## How to enter blood pressure data
When you select a date, it will be surrounded by a blue border, so press Input Button. Then, Blood pressure Input Sheet for the day opens. Alternatively, you can double-click a date to do the same.

Enter blood pressure data by keyboard input or by clicking Number Button on Blood pressure Input Sheet. Turn on the confirmation flag, and execute Registration Button, so the entered data is registered in the database. The date on the calendar when the blood pressure has been entered is circled in red. If the confirmation flag is off and registered, the data is registered in the database, however it is treated as incomplete input.

<img src="http://mikomokaru.sakura.ne.jp/data/02/calendarEntry.png" alt="calendar" title="Entry" width="300">

## Display Monthly Blood pressure List
Click List Display Button to display a list of blood pressure for the month. Since blood pressure is graphed as a bar, your status can be grasped at a glance. If you have high blood pressure (above normal value), you will be warned by changing the color of the value and the graph.

<img src="http://mikomokaru.sakura.ne.jp/data/02/calendarResult.png" alt="calendar" title="Result" width="300">

## Application design
It is a client / server method. The application sends an HTTP request to the server, and the server returns JSON-formatted response data. The database is implemented in MySQL, and data is referenced and updated with PHP scripts.
Server configuration

Web server 　Apache2.4 & PHP5.6

Database　MySQL5.7


