<%-- 
    Document   : signUpRetry
    Created on : 19-Mar-2011, 7:35:59 PM
    Author     : Steve Westfall
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><c:out value="spacebook Registration Failed! Please Retry" /></title>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <jsp:useBean id="user_req" class="spaceBeans.User" scope="request"/>
    <div class="content">
        <h2><c:out value="spacebook Registration Failed!" /></h2>
        <h3><c:out value="Please Retry to create an account on spacebook." /></h3>

        <div class="formbox">
            <form name="signUp" action="processNewUser.jsp" method="post">
                <table>
                    <tbody>
                        <tr>
                            <td>
                                <c:out value="Username:" /><br />
                                <input id="userName" name="userName" size="30" type="text" maxlength="30" value="<c:out value='user_req.getUserName' />" />
                                <span style="color:#FF0000;"><c:out value="user_req.getErrorMsg.userName" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <c:out value="First Name:" /><br />
                                <input id="firstName" name="firstName" size="30" type="text" maxlength="30" value="<c:out value='user_req.getFirstName' />" />
                                <span style="color:#FF0000;"><c:out value="user_req.getErrorMsg.firstName" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <c:out value="Last Name:" /><br />
                                <input id="lastName" name="lastName" size="30" type="text" maxlength="30" value="<c:out value='user_req.getLastName' />" />
                                <span style="color:#FF0000;"><c:out value="user_req.getErrorMsg.lastName" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <c:out value="Password:" /><br />
                                <input id="password" name="password" size="30" type="password" maxlength="10" value="<c:out value='user_req.getPassword' />" />
                                <span style="color:#FF0000;"><c:out value="user_req.getErrorMsg.password" /></span>
                            </td>
                        <tr>
                            <td>
                                <c:out value="Confirm Password:" /><br />
                                <input id="confirm_pw" name="confirm_pw" size="30" type="password" maxlength="10" value="<c:out value='user_req.getConfirm_pw' />" />
                                <span style="color:#FF0000;"><c:out value="user_req.getErrorMsg.confirm_pw" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value="Sign up!" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div><!-- end:formbox -->
    </div><!-- end:content -->
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>