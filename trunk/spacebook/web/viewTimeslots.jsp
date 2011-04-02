<%-- 
    Document   : viewTimeslots
    Created on : 1-Apr-2011, 5:22:55 PM
    Author     : Steve Westfall
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>

<jsp:useBean id="book_req" class="spaceBeans.Booking" scope="request" />
    <jsp:setProperty name="book_req" property="buildingID" value="<%=Integer.parseInt(request.getParameter("buildingID").trim())%>" />
    <%
        int groupID = 0;
        if(request.getParameter("groupID").compareTo("") != 0){
            groupID = Integer.parseInt(request.getParameter("groupID").trim());
        }
    %>
    <jsp:setProperty name="book_req" property="groupID" value="<%=groupID%>" />
    <jsp:setProperty name="book_req" property="bookingDate" value="<%=request.getParameter("bookingDate")%>" />

<jsp:useBean id="user" class="spaceBeans.User" scope="session"/>
    <c:if test="${user.userName == null || user.userName ==''}">
        <jsp:forward page="login.jsp" />
    </c:if>

    <sql:query var="buildingData" dataSource="${dataSource}">
        SELECT * FROM Buildings where buildingID = ${book_req.buildingID}
    </sql:query>
    <c:forEach var="building" items="${buildingData.rows}">
        <c:set var="buildingName" value="${building.buildingName}" />
    </c:forEach>

    <sql:query var="roomData" dataSource="${dataSource}">
        SELECT * FROM Rooms where buildingID = ${book_req.buildingID}
    </sql:query>

    <sql:query var="timeslotData" dataSource="${dataSource}">
        SELECT * FROM Timeslots
    </sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><c:out value="spacebook - Schedule for ${buildingName} on ${book_req.bookingDate}" /></title>
        <script type="text/javascript" language="javascript">
            function setIDs(roomID, timeslotID, groupID){
                document.getElementById('roomID').setAttribute("value", roomID);
                document.getElementById('timeslotID').setAttribute("value", timeslotID);
                document.getElementById('groupID').setAttribute("value", groupID);
            }

            function setBookingID(bookingID){
                document.getElementById('bookingID').setAttribute("value", bookingID);
            }
        </script>
    <%@include file="WEB-INF/jspf/header.jspf" %>

    <div class="content">
        <h2><c:out value="Schedule for ${buildingName} on ${book_req.bookingDate}" /></h2>

        <form name="timeslotDetails" action="processBooking.jsp" method="POST">
            <c:forEach var="room" items="${roomData.rows}">
                <h3><c:out value="Availability for Room ${room.roomNumber}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="Capacity: ${room.capacity}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="Projector: ${room.projector}" /></h3>
                <table class="timeslotTable">
                    <thead>
                        <th>
                            <c:out value="Timeslot" />
                        </th>
                        <th>
                            <c:out value="Status" />
                        </th>
                        <c:if test="${book_req.groupID > 0}">
                            <th>
                                <c:out value="Book" />
                            </th>
                        </c:if>
                    </thead>
                    <tbody>
                        <c:forEach var="timeslot" items="${timeslotData.rows}">
                            <tr>
                                <td>
                                    <c:out value="${timeslot.startTime} - ${timeslot.endTime}" />
                                </td>
                                <td>
                                    <sql:query var="bookingInfo" dataSource="${dataSource}">
                                        SELECT * FROM Bookings WHERE buildingID = ${book_req.buildingID} AND roomID = ${room.roomID} AND timeslotID = ${timeslot.timeslotID} AND bookingDate = '${book_req.bookingDate}'
                                    </sql:query>
                                    <c:choose>
                                        <c:when test="${bookingInfo.rowCount > 0}">
                                            <c:forEach var="bookingRow" items="${bookingInfo.rows}">
                                                <sql:query var="groupInfo" dataSource="${dataSource}">
                                                    SELECT * FROM Groups WHERE groupID = ${bookingRow.groupID}
                                                </sql:query>
                                                <c:forEach var="groupRow" items="${groupInfo.rows}">
                                                    <c:out value="Booked by ${groupRow.groupName}" />
                                                </c:forEach>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="OPEN" />
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <c:if test="${book_req.groupID > 0}">
                                    <td align="center">
                                        <c:choose>
                                            <c:when test="${bookingInfo.rowCount > 0}">
                                                <c:forEach var="bookingRow" items="${bookingInfo.rows}">
                                                    <sql:query var="groupInfo" dataSource="${dataSource}">
                                                        SELECT * FROM Groups WHERE groupID = ${book_req.groupID}
                                                    </sql:query>
                                                    <c:forEach var="groupRow" items="${groupInfo.rows}">
                                                        <c:if test="${(bookingRow.groupID == groupRow.groupID && groupRow.adminID == user.userID)}">
                                                            <input type="submit" id="cancelBooking" name="cancelBooking" value="Cancel Booking" onClick="setBookingID(${bookingRow.bookingID})" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <sql:query var="groupInfo" dataSource="${dataSource}">
                                                        SELECT * FROM Groups WHERE groupID = ${book_req.groupID}
                                                    </sql:query>
                                                    <c:forEach var="groupRow" items="${groupInfo.rows}">
                                                        <input type="submit" id="${groupRow.groupID}" name="${groupRow.groupID}" value="Book for ${groupRow.groupName}" onclick="setIDs(${room.roomID},${timeslot.timeslotID},${groupRow.groupID})" />
                                                    </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach><!-- end:timeslot forEach -->
                    </tbody>
                 </table>
            </c:forEach><!-- end:room forEach -->
                <input type="hidden" id="bookingID" name="bookingID" value="" />
                <input type="hidden" id="groupID" name="groupID" value="" />
                <input type="hidden" id="timeslotID" name="timeslotID" value="" />
                <input type="hidden" id="roomID" name="roomID" value="" />
                <input type="hidden" id="bookingDate" name="bookingDate" value="${book_req.bookingDate}"
         </form>
    </div><!-- end:content -->
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
