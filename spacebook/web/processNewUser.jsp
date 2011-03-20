<%-- 
    Document   : processNewUser
    Created on : 19-Mar-2011, 6:00:09 PM
    Author     : Steve Westfall
--%>


<jsp:useBean id="user" class="spaceBeans.User" scope="request">
    <jsp:setProperty name="user" property="*"/>
</jsp:useBean>
<%
   if (user.processSignUp()) {
%>
    <jsp:forward page="signUpSuccess.jsp"/>
<%
   }  else {
%>
    <jsp:forward page="signUpRetry.jsp"/>
<%
   }
%>


