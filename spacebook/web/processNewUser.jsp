<%-- 
    Document   : processNewUser
    Created on : 19-Mar-2011, 6:00:09 PM
    Author     : Steve Westfall
--%>


<jsp:useBean id="user_req" class="spaceBeans.User" scope="request">
    <jsp:setProperty name="user_req" property="*"/>
</jsp:useBean>
<%
   if (user_req.processSignUp()) {
%>
    <jsp:forward page="signUpSuccess.jsp"/>
<%
   }  else {
%>
    <jsp:forward page="signUpRetry.jsp"/>
<%
   }
%>


