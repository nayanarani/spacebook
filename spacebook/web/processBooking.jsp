<%-- 
    Document   : processBooking
    Created on : 2-Apr-2011, 4:48:43 PM
    Author     : WestfallHome
--%>

<jsp:useBean id="book_req" class="spaceBeans.Booking" scope="request" />
<%
    int bookingID = 0;
    int timeslotID = 0;
    int roomID = 0;
    int groupID = 0;

    if(request.getParameter("bookingID").compareTo("") != 0){
        bookingID = Integer.parseInt(request.getParameter("bookingID").trim());
    }

    if(request.getParameter("timeslotID").compareTo("") != 0){
        timeslotID = Integer.parseInt(request.getParameter("timeslotID").trim());
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
<jsp:setProperty name="book_req" property="roomID" value="<%=roomID%>"/>
<jsp:setProperty name="book_req" property="groupID" value="<%=groupID%>"/>
<jsp:setProperty name="book_req" property="bookingDate" value="<%=request.getParameter("bookingDate")%>"/>
<%
out.println("bookingID="+book_req.getBookingID());
out.println("timeslotID="+book_req.getTimeSlotID());
out.println("roomID="+book_req.getRoomID());
out.println("groupID="+book_req.getGroupID());
out.println("bookingDate="+book_req.getBookingDate());
%>
<%--
<jsp:forward page="bookingSuccess.jsp"/>
--%>

