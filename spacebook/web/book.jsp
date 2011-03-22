<%--
    Document   : groups
    Created on : 14-Mar-2011, 6:08:20 PM
    Author     : Jamie Hush

    Still a work in progress. Its not super duper amazing pretty yet but I'm getting there.
    Final goal will be having only rooms that haven't been booked clickable, and only displaying
    10 buildings at a time. Clicking on a room number will allow you to book it.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="WEB-INF/jspf/tagsAndData.jspf"%>
<html>
<head>
    <script src='jquery-1.5.1.min.js' type='text/javascript'></script>
    <script src='bookAJAX.js' type='text/javascript'></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><c:out value="Book a space on spacebook!" /></title>
<%@include file="WEB-INF/jspf/header.jspf" %>

<div class="content">
        

    <div id="subheader" class="span-24 last">
      <h2 class="loud">Book a Space</h2>

      <div id ="showSpaces"></div>

      <div id="getSpaces">
        <button onclick="loadXMLDoc('buildings.xml')">View spaces</button>
      </div>

    </div>
</div>
      
 <!-- end:content -->
  <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
