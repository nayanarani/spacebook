<%-- 
    Document   : deleteGroup
    Created on : 31-Mar-2011, 2:59:10 PM
    Author     : Steve Westfall
--%>

<jsp:useBean id="del_req" class="spaceBeans.Group" scope="request">
    <jsp:setProperty name="del_req" property="*"/>
</jsp:useBean>
<jsp:useBean id="user" class="spaceBeans.User" scope="session" />
<%
    del_req.deleteGroupByAdmin();

%>
     <jsp:forward page="myAccount.jsp"/> 
