<%--
    Document   : spacebook home page
    Created on : 15-Mar-2011, 11:52:19 AM
    Author     : James Hush, Steve Westfall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
<jsp:useBean id="user" class="spaceBeans.User" scope="request"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up. Create an account on spacebook!</title>

        <%@include file="header.jsp" %>

        <div class="content">
<%--            <%
                if (request.getMethod().equals("GET")) {
            %>
            <jsp:include page="WEB-INF/jspf/signUpForm.jspf" />
            <%
                }else{
            %>
            <jsp:forward page="myAccount.jsp"/>
            <%
                }
            %> --%>

            <%
                // If process is true, attempt to validate and process the form
                if ("true".equals(request.getParameter("process"))) {
            %>
                    <jsp:setProperty name="user" property="*" />
            <%
                    // Attempt to process the form
                    if (user.processSignUp()) {
                        // Go to success page
            %>
                        <jsp:forward page="myAccount.jsp"/>
            <%
                    }
                }
                else{
            %>
                    <jsp:include page="WEB-INF/jspf/signUpForm.jspf" />
            <%
                }
            %>


        </div><!-- end:content -->
        <%@include file="footer.jsp" %>
