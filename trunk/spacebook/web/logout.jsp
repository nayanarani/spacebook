<%-- 
    Document   : logout
    Created on : 21-Mar-2011, 3:31:01 PM
    Author     : WestfallHome
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:scriptlet>
            request.removeAttribute("userName");
            session.invalidate();
        </jsp:scriptlet>
        <title>Logged Out - spacebook</title>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <div class="content">
        <h2>You are now logged out of spacebook!</h2>
        <h2>Please come back soon.</h2>
    </div><!-- end:content -->
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
