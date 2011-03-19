<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- 
    Document   : spacebook home page
    Created on : 15-Mar-2011, 12:25:19 PM
    Authors     : James Hush, Steve Westfall
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In to spacebook!</title>
        <%@include file="header.jsp" %>
        <div class="content">
            <%
                if (request.getMethod().equals("GET")) {
            %>
            <jsp:include page="WEB-INF/jspf/signInForm.jspf" />
            <%
                }else{
            %>
            <jsp:forward page="myAccount.jsp"/>
            <%
                }
            %>
            
        </div><!-- end:content -->
        <%@include file="footer.jsp" %>

