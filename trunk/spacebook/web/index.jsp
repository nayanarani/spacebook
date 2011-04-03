<%-- 
    Document   : spacebook home page
    Created on : 6-Mar-2011, 1:55:19 PM
    Author     : Steve Westfall
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to spacebook!</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
            <div class="content">Welcome to spacebook! <br /><br />
                <c:out value="We developed this java based web application for our 60-334: WWW Info Systems Development class project at the" />&nbsp;<a href="http://www.uwindsor.ca" target="_blank"><c:out value="University of Windsor" /></a><c:out value=". The application will allow users to book a space in order to hold an event or meeting." /><br /><br />
                <c:out value="This application allows users to: "/>
                <ul>
                    <li><c:out value="Register/create an account" /></li>
                    <li><c:out value="View, join, leave, create and delete Groups. (Users can only delete groups they created)" /></li>
                    <li><c:out value="View a list of buildings on the University campus" /></li>
                    <li><c:out value="View the schedule for each building by date" /></li>
                    <li><c:out value="Book rooms (by building, time slot and date) and cancel bookings." /><br /><c:out value="(Users can only book rooms and cancel bookings for Groups that they created)" /></li>
                </ul>
                <c:out value="For testing purposes, we have provided the following instructions on setting up the database in Netbeans." /><br />
                <ul>
                    <li><c:out value="Open the project in Netbeans." /></li>
                    <li><c:out value="Click on the Services tab. Right Click on JavaDB and select 'Create Database'." /></li>
                    <li><c:out value="Fill in:" /><b>&nbsp;<c:out value="Database Name:"/>&nbsp;</b><c:out value="spaceDB" /><b>&nbsp;<c:out value="Username:" />&nbsp;</b><c:out value="spaceUser" /><b>&nbsp;<c:out value="Password:" />&nbsp;</b><c:out value="spacePass" /></li>
                    <li><c:out value="Right Click on JavaDB and select 'Start Server'." /></li>
                    <li><c:out value="Click on the Projects tab. Expand the 'Source Packages' folder. Expand the 'spaceDB' folder." /></li>
                    <li><c:out value="Open the file 'spaceDB_createJDB.sql' by double-clicking on it." /></li>
                    <li><c:out value="At the top of the file you should see a drop-down labelled 'Connection'." /></li>
                    <li><c:out value="Select 'jdbc:derby://localhost:1527/spaceDB[spaceUser on SPACEUSER]'." /></li>
                    <li><c:out value="The first button to the right of the Connection drop down is the 'Run SQL' button. Click it." /></li>
                    <li><c:out value="Go back to the 'spaceDB' folder and open the file 'insertOne.sql' by double-clicking on it." /></li>
                    <li><c:out value="From the 'Connection' drop down, select:" /><br /><c:out value="'jdbc:derby://localhost:1527/spaceDB[spaceUser on SPACEUSER]'." /></li>
                    <li><c:out value="Click the 'Run SQL' button." /></li>
                    <li><c:out value="Go back to the 'spaceDB' folder, right-click on the file 'insertBuildings.sql' and select 'Run File'." /></li>
                    <li><c:out value="Go back to the 'spaceDB' folder and open the file 'insertTwo.sql' by double-clicking on it." /></li>
                    <li><c:out value="From the 'Connection' drop down, select:" /><br /><c:out value="'jdbc:derby://localhost:1527/spaceDB[spaceUser on SPACEUSER]'." /></li>
                    <li><c:out value="Click the 'Run SQL' button." /></li>
                </ul>
                <c:out value="If you followed the above instructions correctly, the spacebook database should be created, populated and ready to test. In some instances, you may also need to ensure that the following libraries/jar files are added to the project:" /><br />
                <ul>
                    <li><c:out value="derbyclient.jar" /></li>
                    <li><c:out value="JSTL 1.1 - standard.jar" /></li>
                    <li><c:out value="JSTL 1.1 - jstl.jar" /></li>
                </ul>
                <c:out value="To check if the above libraries/jar files are added the the project, perform the following:" />
                <ul>
                    <li><c:out value="Click on the Projects tab. Expand the 'Libraries' folder." /></li>
                    <li><c:out value="Review the list. If you do not see the above libraries in the list, right-click on the folder and select 'Add Library'." /></li>
                    <li><c:out value="A window will open with a list of libraries. Select the required library from the list and click the 'Add Library' button." /></li>
                </ul>
                <c:out value="Our scripts create 10 fake users that you can use to test out our application with the following login information:" /><br /><br />
                <b><c:out value="Username:" /></b>&nbsp;<c:out value="fakeuser1 through fakeuser10" /><br />
                <b><c:out value="Password:" /></b>&nbsp;<c:out value="123456" /><br /><br />
                <c:out value="Of course, you can always register your own account with your own information in order to test our application." /><br /><br />
            </div><!-- end:content -->
        <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
