<%-- 
    Document   : myAccount
    Created on : 18-Mar-2011, 5:56:35 PM
    Author     : WestfallHome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
    <jsp:useBean id="user" class="spaceBeans.User" scope="session"/>
    <jsp:setProperty name="user" property="errorMessages" value="<%= errorMap %>" />

    <sql:query var="userData" dataSource="${applicationScope.dataSource}">
        select * from Users where userName = '${user.userName}'
    </sql:query>

        <title>${user.userName} - myAccount - spacebook</title>
    <%@include file="header.jsp" %>
    
        <head>
    <div class="content">
        <h2>Hello </h2>
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
    <%@include file="footer.jsp" %>
</html>


