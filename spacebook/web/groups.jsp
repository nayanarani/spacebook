<%-- 
    Document   : groups
    Created on : 21-Mar-2011, 8:08:20 PM
    Author     : Steve Westfall
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
<jsp:useBean id="user" class="spaceBeans.User" scope="session"/>
        <c:if test="${user.userName == null || user.userName ==''}">
            <jsp:forward page="login.jsp" />
        </c:if>
        <sql:query var="groupData" dataSource="${dataSource}">
            SELECT * FROM Groups
        </sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><c:out value="View Groups on spacebook!" /></title>
    <%@include file="WEB-INF/jspf/header.jspf" %>

    <div class="content">
        <h2><c:out value="View Groups on spacebook" /></h2>
        <c:forEach var="group" items="${groupData.rows}">
            <div class="groupContent">
            <b><u><c:out value="${group.groupName}" /></u></b><br />
            <sql:query var="userData" dataSource="${dataSource}">
                SELECT userName FROM Users, GroupUserXR WHERE Users.userID = GroupUserXR.userID AND GroupUserXR.groupID = ${group.groupID}
            </sql:query>
            <c:set var="found" value="0" />
            <c:forEach var="groupUser" items="${userData.rows}">
                <c:out value="${groupUser.userName}" /><br />
                <c:if test="${user.userName == groupUser.username}" >
                    <c:set var="found" value="1" />
                </c:if>
            </c:forEach><br />
            <c:if test="${found == 0}">
                <input type="submit" value="Join Group" />
            </c:if>
            </div><!-- end:content -->
        </c:forEach>
    </div><!-- end:content -->
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>