<%--
    Document   : groups
    Created on : 14-Mar-2011, 6:08:20 PM
    Author     : Jamie Hush
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
<jsp:useBean id="user" class="spaceBeans.User" scope="session"/>
<c:if test="${user.userName == null || user.userName ==''}">
    <jsp:forward page="login.jsp" />
</c:if>
<sql:query var="buildingData" dataSource="${dataSource}">
    SELECT * FROM Buildings
</sql:query>
<sql:query var="groupAdminData" dataSource="${dataSource}">
    SELECT * FROM Groups WHERE adminID = ${user.userID} ORDER BY groupName
</sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><c:out value="Book a space on spacebook!" /></title>
        <script type="text/javascript" language="javascript">
            function setBuildingName(){
                var sel = document.getElementById("buildingSelect");
                var buildingID = sel.options[sel.selectedIndex].value;
                document.getElementById('buildingID').setAttribute("value", buildingID);
            }

            function setGroupID(){
                var sel = document.getElementById("groupSelect");
                var groupID = sel.options[sel.selectedIndex].value;
                document.getElementById('groupID').setAttribute("value", groupID);
            }

            function checkBookForm(){
                
                var buildingSel = document.getElementById("buildingSelect");
                var building = buildingSel.options[buildingSel.selectedIndex].value;

                var groupSel = document.getElementById("groupSelect");
                var groupID = groupSel.options[groupSel.selectedIndex].value;

                if(!building){
                    alert('Please choose a building.');
                    return false;
                }
                else if(!groupID){
                    var answer = confirm('You did not enter a Group Name.\n You will only be able to view the Booking Schedule.\n\n Do you still want to proceed?\n\nSelect \'Cancel\' to enter a Group Name.');

                    if(answer){
                        return true;
                    }
                    else{
                        return false;
                    }
                }
                else{
                    return true;
                }
                
            }
        </script>
        <script type="text/javascript" language="javascript" src="js/calendarDateInput.js">
            /***********************************************
            * Jason's Date Input Calendar- By Jason Moon http://calendar.moonscript.com/dateinput.cfm
            * Script featured on and available at http://www.dynamicdrive.com
            * Keep this notice intact for use.
            ***********************************************/
        </script>
    <%@include file="WEB-INF/jspf/header.jspf" %>

    <div class="content">
        <h2><c:out value="Book a Space" /></h2>
        <h3><c:out value="You are logged in as: ${user.userName}" /></h3>
        <h3><c:out value="Make selections below to see available time slots." /></h3>
        <form name="bookingInfoForm" action="viewTimeslots.jsp" onSubmit="return checkBookForm()" method="POST">
            <table>
                <tr>
                    <td>
                        <c:out value="Date:" />
                    </td>
                    <td>
                        <script type="text/javascript" language="javascript">DateInput('bookingDate', true, 'MON-DD-YYYY');</script>
                    </td>
                </tr>
                <tr>
                    <td>
                        <c:out value="Building Name:" />
                    </td>
                    <td>
                        <select id="buildingSelect" onChange="setBuildingName()">
                            <option value=""></option>
                            <c:forEach var="row" items="${buildingData.rows}">
                                <option id="${row.buildingID}" value="${row.buildingID}"><c:out value="${row.buildingName}" /></option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <c:out value="Group Name*:" />
                    </td>
                    <td>
                        <select id="groupSelect" onChange="setGroupID()">
                            <option value=""></option>
                            <c:forEach var="row" items="${groupAdminData.rows}">
                                <option id="${row.groupID}" value="${row.groupID}"><c:out value="${row.groupName}" /></option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br /><input type="submit" value="Submit" />
                    </td>
                    <td>
                        <input id="buildingID" name="buildingID" type="hidden" value="" />
                        <input id="groupID" name="groupID" type="hidden" value="" />
                    </td>
                </tr>
            </table>
        </form>
        <br /><br />
        <c:out value="*You must be the admin of a group in order to book a space. Leaving the Group Name field blank will allow you to view the schedule for a building on the chosen date, but you will not be able to book a room." />
    </div><!-- end:content -->
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>