We developed this java based web application for our 60-334: WWW Info Systems Development class project at the <a href='http://www.uwindsor.ca'>University of Windsor</a>. The application will allow users to book a space in order to hold an event or meeting.<br />
This application allows users to:
<ul>
<li>Register/create an account</li>
<li>View, join, leave, create and delete Groups. (Users can only delete groups they created)</li>
<li>View a list of buildings on the University campus</li>
<li>View the schedule for each building by date</li>
<li>Book rooms (by building, time slot and date) and cancel bookings.<br />Users can only book rooms and cancel bookings for Groups that they created)</li>
</ul>
For testing purposes, we have provided the following instructions on setting up the database in Netbeans.
<ul>
<li>Open the project in Netbeans.</li>
<li>Click on the Services tab. Right Click on JavaDB and select 'Create Database'.</li>
<li>Fill in:<b>Database Name: </b>spaceDB <b> Username: </b>spaceUser <b> Password: </b>spacePass</li>
<li>Right Click on JavaDB and select 'Start Server'.</li>
<li>Click on the Projects tab. Expand the 'Source Packages' folder. Expand the 'spaceDB' folder.</li>
<li>Open the file 'spaceDB_createJDB.sql' by double-clicking on it.</li>
<li>At the top of the file you should see a drop-down labelled 'Connection'.</li>
<li>Select 'jdbc:derby://localhost:1527/spaceDB {spaceUser on SPACEUSER}'.</li>
<li>The first button to the right of the Connection drop down is the 'Run SQL' button. Click it.</li>
<li>Go back to the 'spaceDB' folder and open the file 'insertOne.sql' by double-clicking on it.</li>
<li>From the 'Connection' drop down, select: 'jdbc:derby://localhost:1527/spaceDB {spaceUser on SPACEUSER}'.</li>
<li>Click the 'Run SQL' button.</li>
<li>Go back to the 'spaceDB' folder, right-click on the file 'insertBuildings.sql' and select: Run File</li>
<li>Go back to the 'spaceDB' folder and open the file 'insertTwo.sql' by double-clicking on it.</li>
<li>From the 'Connection' drop down, select: 'jdbc:derby://localhost:1527/spaceDB {spaceUser on SPACEUSER}'.</li>
<li>Click the 'Run SQL' button.</li>
</ul>
If you followed the above instructions correctly, the spacebook database should be created, populated and ready to test. In some instances, you may also need to ensure that the following libraries/jar files are added to the project:
<ul>
<li>derbyclient.jar</li>
<li>JSTL 1.1 - standard.jar</li>
<li>JSTL 1.1 - jstl.jar</li>
</ul>
To check if the above libraries/jar files are added the the project, perform the following:
<ul>
<li>Click on the Projects tab. Expand the 'Libraries' folder.</li>
<li>Review the list. If you do not see the above libraries in the list, right-click on the folder and select 'Add Library'.</li>
<li>A window will open with a list of libraries. Select the required library from the list and click the 'Add Library' button.</li>
</ul>
Our scripts create 10 fake users that you can use to test out our application with the following login information:<br />
<b>Username: </b>fakeuser1 through fakeuser10<br />
<b>Password: </b>123456<br />
Of course, you can always register your own account with your own information in order to test our application.<br /><br />