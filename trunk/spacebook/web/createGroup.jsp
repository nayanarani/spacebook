<%-- 
    Document   : createGroup
    Created on : 31-Mar-2011, 4:19:05 PM
    Author     : Steve Westfall
--%>

<jsp:useBean id="create_req" class="spaceBeans.Group" scope="request">
    <jsp:setProperty name="create_req" property="*"/>
</jsp:useBean>
<jsp:useBean id="user" class="spaceBeans.User" scope="session" />
<%
    create_req.createGroup(user.getUserID());
%>
 <jsp:forward page="groups.jsp"/> 