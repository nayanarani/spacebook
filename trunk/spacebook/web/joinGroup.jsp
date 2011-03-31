<%-- 
    Document   : joinGroup
    Created on : 31-Mar-2011, 1:44:48 PM
    Author     : Steve Westfall
--%>

<jsp:useBean id="join_req" class="spaceBeans.Group" scope="request">
    <jsp:setProperty name="join_req" property="*"/>
</jsp:useBean>
<jsp:useBean id="user" class="spaceBeans.User" scope="session" />
<%
    join_req.joinGroup(user.getUserID());
%>
    <jsp:forward page="groups.jsp"/>
