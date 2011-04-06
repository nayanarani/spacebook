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
            SELECT * FROM Groups WHERE Groups.groupID IN (SELECT groupID FROM GroupUserXR WHERE GroupUserXR.userID = ${user.userID}) ORDER BY groupName
        </sql:query>

        <sql:query var="groupAdminData" dataSource="${dataSource}">
            SELECT * FROM Groups WHERE adminID = ${user.userID} ORDER BY groupName
        </sql:query>
            
        <title><c:out value="${user.userName} myAccount - spacebook" /></title>
        <script type="text/javascript" language="javascript">
            function setGroupID(groupID){
                document.getElementById('groupID').setAttribute("value", groupID);
            }

            function setGroupIDAdmin(groupID){
                document.getElementById('groupIDAdmin').setAttribute("value", groupID);
            }
        </script>
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
                <form name="groupMemberForm" action="leaveGroup" method="POST">
                    <table class="groupTable">
                        <thead>
                            <th>
                                <c:out value="Group Name" />
                            </th>
                            <th style="width:50px;">
                                <c:out value="Leave" />
                            </th>
                        </thead>
                        <tbody>
                            <c:forEach var="groupRow" items="${groupData.rows}">
                                <tr>
                                    <td>
                                        <c:out value="${groupRow.groupName}" />
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${groupRow.adminID == user.userID}">
                                                <div align="center"><c:out value="Admin" /></div>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="submit" onclick="setGroupID(${groupRow.groupID})" value="Leave Group" />
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <input type="hidden" id="groupID" name="groupID" value="" />
                    <input type="hidden" id="userID" name="userID" value="${user.userID}" />
                </form>
            </c:otherwise>
        </c:choose>
        <h3><c:out value="You are currently the Administrator of the following Groups:" /></h3>
        <c:choose>
            <c:when test="${groupAdminData.rowCount == 0}">
                <c:out value="None." />
            </c:when>
            <c:otherwise>
                <form name="groupAdminForm" action="deleteGroup" method="POST">
                    <table class="groupTable">
                        <thead>
                            <th>
                                <c:out value="Group Name" />
                            </th>
                            <th style="width:50px;">
                                <c:out value="Delete" />
                            </th>
                        </thead>
                        <tbody>
                            <c:forEach var="groupAdminRow" items="${groupAdminData.rows}">
                                <tr>
                                    <td>
                                        <c:out value="${groupAdminRow.groupName}" />
                                    </td>
                                    <td>
                                        <input type="submit" value="Delete Group" onclick="setGroupIDAdmin(${groupAdminRow.groupID})" />
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <input type="hidden" id="groupIDAdmin" name="groupID" value="" />
                </form>
            </c:otherwise>
        </c:choose>
        
    </div><!-- end:content -->
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>


