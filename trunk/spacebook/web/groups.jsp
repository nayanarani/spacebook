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
        <script type="text/javascript" language="javascript">
            function setGroupID(groupID){
                document.getElementById('groupID').setAttribute("value", groupID);
            }

            function checkForm(){
                var name = document.getElementById('groupName').getAttribute('value');
                if(name == '' || name == null){
                    alert('Please enter a group name.');
                    return false;
                }
                else{
                    return true;
                }
            }
        </script>
    <%@include file="WEB-INF/jspf/header.jspf" %>

    <div class="content">
        <h2><c:out value="Groups on spacebook" /></h2>
        <h3><c:out value="You are logged in as: ${user.userName}" /></h3>
        <form name="groupDetails" action="joinGroup.jsp" method="POST">
            <table class="groupTable">
                <thead>
                    <th><c:out value="Group Name" /></th>
                    <th><c:out value="Members" /></th>
                    <th><c:out value="Join" /></th>
                </thead>
                <tbody>
                    <c:forEach var="group" items="${groupData.rows}">
                        <tr>
                            <td>
                                <c:out value="${group.groupName}" />
                            </td>
                            <td>
                                <sql:query var="userData" dataSource="${dataSource}">
                                    SELECT userName FROM Users, GroupUserXR WHERE Users.userID = GroupUserXR.userID AND GroupUserXR.groupID = ${group.groupID}
                                </sql:query>
                                <c:set var="found" value="0" />
                                <c:set var="members" value="0" />
                                <c:forEach var="groupUser" items="${userData.rows}">
                                    <c:set var="members" value="${members + 1}" />
                                    <c:out value="${groupUser.userName}" />
                                    <c:if test="${((userData.rowCount - members) > 0)}">
                                        <c:out value=", " />
                                    </c:if>
                                    <c:if test="${user.userName == groupUser.username}" >
                                        <c:set var="found" value="1" />
                                    </c:if>
                                </c:forEach><br />
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${found == 0}">
                                        <input type="submit" value="Join Group" onClick="setGroupID(${group.groupID})" />
                                    </c:when>
                                    <c:otherwise>
                                        <div align="center"><c:out value="Member" /></div>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    <input type="hidden" id="groupID" name="groupID" value="" />
                </tbody>
             </table>
         </form>
         <h2><c:out value="Create a new group on spacebook" /></h2>
         <form name="createGroup" action="createGroup.jsp" method="POST">
             <table>
                 <tr>
                     <td>
                         <c:out value="Group Name:" />&nbsp;<input type="text" id="groupName" name="groupName" maxlength="30" />
                     </td>
                     <td>
                         <input type="submit" onclick="return checkForm()" value="Create Group" />
                     </td>
                 </tr>
             </table>
         </form>
    </div><!-- end:content -->
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>