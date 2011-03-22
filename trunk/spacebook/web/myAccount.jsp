<%-- 
    Document   : myAccount
    Created on : 18-Mar-2011, 5:56:35 PM
    Author     : Steve Westfall
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="user" class="spaceBeans.User" scope="session"/>
        <c:if test="${user.userName == null || user.userName ==''}">
            <jsp:forward page="login.jsp" />
        </c:if>
        <title><c:out value="${user.userName} myAccount - spacebook" /></title>
    <%@include file="WEB-INF/jspf/header.jspf" %>

    <div class="content">
        <h2><c:out value="Hello ${user.firstName}" /></h2>
        <h3><c:out value="You are logged in as: ${user.userName}" /></h3>
        <table>
            <tbody>
                <tr>
                    <td>
                        <c:out value="First Name: ${user.firstName}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <c:out value="Last Name: ${user.lastName}" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div><!-- end:content -->
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>


