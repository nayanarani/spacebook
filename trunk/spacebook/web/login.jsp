<%-- 
    Document   : login
    Created on : 20-Mar-2011, 4:03:14 PM
    Author     : WestfallHome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login to spacebook!</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>

        <div class="content">
            <h2>Sign In</h2>
            <div class="formbox">
                <form name="login" action="processLogin.jsp" method="post">
                    <table>
                        <tr>
                            <td>Username:<br /><input id="userName" name="userName" size="30" type="text" maxlength="30" value="" /></td>
                        </tr>
                        <tr>
                            <td>Password:<br /><input id="password" name="password" size="30" type="password" maxlength="10" value="" /></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Login" /></td>
                        </tr>
                    </table>
                </form>
            </div><!-- end:formbox -->
        </div><!-- end:content -->
        <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
