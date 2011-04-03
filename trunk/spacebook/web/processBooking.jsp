<%-- 
    Document   : processBooking
    Created on : 2-Apr-2011, 4:48:43 PM
    Author     : Steve Westfall
--%>
<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
<jsp:useBean id="book_req" class="spaceBeans.Booking" scope="request" />
<%
    int bookingID = 0;
    int timeslotID = 0;
    int buildingID = 0;
    int roomID = 0;
    int groupID = 0;

    if(request.getParameter("bookingID").compareTo("") != 0){
        bookingID = Integer.parseInt(request.getParameter("bookingID").trim());
    }

    if(request.getParameter("timeslotID").compareTo("") != 0){
        timeslotID = Integer.parseInt(request.getParameter("timeslotID").trim());
    }

    if(request.getParameter("buildingID").compareTo("") != 0){
        buildingID = Integer.parseInt(request.getParameter("buildingID").trim());
    }

    if(request.getParameter("roomID").compareTo("") != 0){
        roomID = Integer.parseInt(request.getParameter("roomID").trim());
    }

    if(request.getParameter("groupID").compareTo("") != 0){
        groupID = Integer.parseInt(request.getParameter("groupID").trim());
    }
%>
<jsp:setProperty name="book_req" property="bookingID" value="<%=bookingID%>"/>
<jsp:setProperty name="book_req" property="timeSlotID" value="<%=timeslotID%>"/>
<jsp:setProperty name="book_req" property="buildingID" value="<%=buildingID%>"/>
<jsp:setProperty name="book_req" property="roomID" value="<%=roomID%>"/>
<jsp:setProperty name="book_req" property="groupID" value="<%=groupID%>"/>
<jsp:setProperty name="book_req" property="bookingDate" value="<%=request.getParameter("bookingDate")%>"/>

<c:if test="${book_req.bookingID > 0}">
    <%
        book_req.cancelBooking();
    %>
    <jsp:forward page="viewTimeslots.jsp"/>
</c:if>

<c:if test="${(book_req.timeSlotID > 0 && book_req.buildingID > 0 && book_req.roomID > 0 && book_req.groupID > 0)}">
    <%
        book_req.createBooking();
    %>
    <jsp:forward page="viewTimeslots.jsp"/>
</c:if>



