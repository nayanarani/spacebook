<%-- 
    Document   : leaveGroup
    Created on : 31-Mar-2011, 2:10:12 PM
    Author     : Steve Westfall
--%>

<jsp:useBean id="leave_req" class="spaceBeans.Group" scope="request">
    <jsp:setProperty name="leave_req" property="*"/>
</jsp:useBean>
<jsp:useBean id="user" class="spaceBeans.User" scope="session" />
<%
    leave_req.leaveGroup(user.getUserID());
%>
    <jsp:forward page="myAccount.jsp"/>
