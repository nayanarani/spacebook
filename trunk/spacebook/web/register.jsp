<%-- 
    Document   : register
    Created on : 19-Mar-2011, 7:04:13 PM
    Author     : WestfallHome
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page. Create an account on spacebook!</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>

        <div class="content">
            <h2>Need a space booked?</h2>
            <h3 class="loud">Sign Up to create an account on spacebook.</h3>

            <div class="formbox">
                <form name="signUp" action="processNewUser.jsp" method="post">
                    <table>
                        <tr>
                            <td>Username:<br /><input id="userName" name="userName" size="30" type="text" maxlength="30" value="" /></td>
                        </tr>
                        <tr>
                            <td>First Name:<br /><input id="firstName" name="firstName" size="30" type="text" maxlength="30" value="" /></td>
                        </tr>
                        <tr>
                            <td>Last Name:<br /><input id="lastName" name="lastName" size="30" type="text" maxlength="30" value="" /></td>
                        </tr>
                        <tr>
                            <td>Password:<br /><input id="password" name="password" size="30" type="password" maxlength="10" value="" /></td>
                        <tr>
                            <td>Confirm Password:<br /><input id="confirm_pw" name="confirm_pw" size="30" type="password" maxlength="10" value="" /></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Sign up!" /></td>
                        </tr>
                    </table>
                </form>
            </div><!-- end:formbox -->
        </div><!-- end:content -->
        <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>