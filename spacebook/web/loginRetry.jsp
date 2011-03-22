<%-- 
    Document   : loginRetry
    Created on : 20-Mar-2011, 4:09:27 PM
    Author     : Steve Westfall
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><c:out value="spacebook Login Failed! Please Retry" /></title>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <jsp:useBean id="user_req" class="spaceBeans.User" scope="request"/>
    <div class="content">
        <h2><c:out value="spacebook Login Failed!" /></h2>
        <h3><c:out value="Check your credentials and try again." /></h3>

        <div class="formbox">
            <form name="login" action="processLogin.jsp" method="post">
                <table>
                    <tbody>
                        <tr>
                            <td>
                                <c:out value="Username:" /><br />
                                <input id="userName" name="userName" size="30" type="text" maxlength="30" value="<c:out value='user_req.getUserName' />" />
                                <span style='color:#FF0000;'><c:out value="${user_req.getErrorMsg.userName}" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <c:out value="Password:<br />" />
                                <input id="password" name="password" size="30" type="password" maxlength="10" value="<%=user_req.getPassword()%>" />
                                <span style='color:#FF0000;'><c:out value="${user_req.getErrorMsg.password}" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span style='color:#FF0000;'><c:out value="${user_req.getErrorMsg.combo}" /></span>
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
