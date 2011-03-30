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

        <sql:query var="userData" dataSource="${dataSource}">
            SELECT userID FROM Users where userName = '${user.userName}'
        </sql:query>

        <c:forEach var="userRow" items="${userData.rows}">
            <jsp:setProperty name="user" property="userID" value="${userRow.userID}" />
        </c:forEach>

        <sql:query var="groupData" dataSource="${dataSource}">
            SELECT groupName FROM Groups WHERE Groups.groupID IN (SELECT groupID FROM GroupUserXR WHERE GroupUserXR.userID = ${user.userID})
        </sql:query>

        <sql:query var="groupAdminData" dataSource="${dataSource}">
            SELECT groupName FROM Groups WHERE adminID = ${user.userID}
        </sql:query>
            
        <title><c:out value="${user.userName} myAccount - spacebook" /></title>
    <%@include file="WEB-INF/jspf/header.jspf" %>

    <div class="content">
        <h2><c:out value="Hello ${user.firstName}" /></h2>
        <h3><c:out value="You are logged in as: ${user.userName}" /></h3>
        <c:out value="First Name: ${user.firstName}" /><br />
        <c:out value="Last Name: ${user.lastName}" /><br /><br />
        <h3><c:out value="You currently belong to the following Groups:" /></h3>
        <c:choose>
            <c:when test="${groupData.rowCount == 0}">
                <c:out value="None." />
            </c:when>
            <c:otherwise>
                <c:forEach var="groupRow" items="${groupData.rows}">
                    <c:out value="${groupRow.groupName}" /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <h3><c:out value="You currently the Administrator of the following Groups:" /></h3>
        <c:choose>
            <c:when test="${groupAdminData.rowCount == 0}">
                <c:out value="None." />
            </c:when>
            <c:otherwise>
                <c:forEach var="groupAdminRow" items="${groupAdminData.rows}">
                    <c:out value="${groupAdminRow.groupName}" /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div><!-- end:content -->
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>


