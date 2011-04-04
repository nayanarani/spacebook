<%-- 
    Document   : processLogin
    Created on : 20-Mar-2011, 4:07:31 PM
    Author     : WestfallHome
--%>

<jsp:useBean id="user_req" class="spaceBeans.User" scope="request">
    <jsp:setProperty name="user_req" property="*"/>
</jsp:useBean>

<%
   if (user_req.processLogin()) {
%>
    <jsp:forward page="loginSuccess.jsp"/>
<%
   }  else {
%>
    <jsp:forward page="loginRetry.jsp"/>
<%
   }
%>
