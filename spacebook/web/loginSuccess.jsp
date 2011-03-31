<%-- 
    Document   : loginSuccess
    Created on : 20-Mar-2011, 4:09:11 PM
    Author     : Steve Westfall
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="user_req" class="spaceBeans.User" scope="request" />

        <c:if test="${user_req.userName == null || user_req.userName ==''}">
            <jsp:forward page="login.jsp" />
        </c:if>

        <sql:query var="userData" dataSource="${dataSource}">
            select * from Users where userName = '${user_req.userName}'
        </sql:query>
        <jsp:useBean id="user" class="spaceBeans.User" scope="session" />
        <c:forEach var="row" items="${userData.rows}">
            <jsp:setProperty name="user" property="userID" value="${row.userID}" />
            <jsp:setProperty name="user" property="userName" value="${row.userName}" />
            <jsp:setProperty name="user" property="firstName" value="${row.firstName}" />
            <jsp:setProperty name="user" property="lastName" value="${row.lastName}" />
        </c:forEach>
        
        <title><c:out value="Success! Logged in to spacebook as ${user.userName}" /></title>
    <%@include file="WEB-INF/jspf/header.jspf" %>

    <div class="content">
        <h2><c:out value="Success! Logged in to spacebook as ${user.userName}" /></h2>
        <table>
            <thead>
                <th>
                    <h3><u><c:out value="User Information" /></u></h3>
                </th>
            </thead>
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

