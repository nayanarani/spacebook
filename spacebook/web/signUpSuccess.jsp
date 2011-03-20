<%-- 
    Document   : signUpSuccess
    Created on : 19-Mar-2011, 7:52:58 PM
    Author     : WestfallHome
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
    <jsp:useBean id="user" class="spaceBeans.User" scope="request"/>

    <sql:query var="userData" dataSource="${dataSource}">
        select * from Users where userName = '${user.userName}'
    </sql:query>

        <title>Success! New user ${user.userName} Signed Up on spacebook!</title>
    <%@include file="WEB-INF/jspf/header.jspf" %>

        <head>
    <div class="content">
        <h2>Hello ${user.userName}</h2>
        <table>
            <c:forEach var="row" items="${userData.rows}">
            <tr>
                <td>First Name:</td>
                <td>${row.firstName}</td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td>${row.lastName}</td>
            </tr>
            </c:forEach>
        </table>
    </div><!-- end:content -->
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>

