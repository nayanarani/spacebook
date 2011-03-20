<%-- 
    Document   : processLogin
    Created on : 20-Mar-2011, 4:07:31 PM
    Author     : WestfallHome
--%>

<jsp:useBean id="user" class="spaceBeans.User" scope="request">
    <jsp:setProperty name="user" property="*"/>
</jsp:useBean>
<%
   if (user.processLogin()) {
%>
    <jsp:forward page="loginSuccess.jsp"/>
<%
   }  else {
%>
    <jsp:forward page="loginRetry.jsp"/>
<%
   }
%>
