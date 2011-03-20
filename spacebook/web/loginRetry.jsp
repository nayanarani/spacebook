<%-- 
    Document   : loginRetry
    Created on : 20-Mar-2011, 4:09:27 PM
    Author     : WestfallHome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>spacebook Login Failed! Please Retry</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <jsp:useBean id="user" class="spaceBeans.User" scope="request"/>
        <div class="content">
            <h2>spacebook Login Failed!</h2>
            <h3 class="loud">Check your credentials and try again.</h3>

            <div class="formbox">
                <form name="login" action="processLogin.jsp" method="post">
                    <table>
                        <tr>
                            <td>
                                Username:<br />
                                <input id="userName" name="userName" size="30" type="text" maxlength="30" value="<%=user.getUserName()%>" />
                                <span style="color:#FF0000;"><%=user.getErrorMsg("userName")%></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Password:<br />
                                <input id="password" name="password" size="30" type="password" maxlength="10" value="<%=user.getPassword()%>" />
                                <span style="color:#FF0000;"><%=user.getErrorMsg("password")%></span>
                            </td>
                        <tr>
                            <td><input type="submit" value="Sign up!" /></td>
                        </tr>
                    </table>
                </form>
            </div><!-- end:formbox -->
        </div><!-- end:content -->
        <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
