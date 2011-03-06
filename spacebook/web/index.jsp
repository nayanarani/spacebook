<%-- 
    Document   : spacebook home page
    Created on : 6-Mar-2011, 1:55:19 PM
    Author     : Steve Westfall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to spacebook!</title>
        <link rel="stylesheet" type="text/css" href="css/spacebook_style.css" />
    </head>
    <body>
        <div class="header">
            <img src="images/spacebook_logo.jpg" border="0" alt="spacebook" title="Welcome to spacebook!" />
        </div><!-- end:header -->
        
        <div class="main">
            <div class="navigation">
                <a href="index.jsp">Home</a>
                <a href="login.jsp">Login/Register</a>
                <a href="contact.jsp">Contact Us</a>
                <a href="browse_spaces.jsp">Browse Spaces</a>
            </div><!-- end:navigation -->
            <div class="padder">
                <div class="intro">Welcome to spacebook! <br /><br />
                    We are currently developing a java based web application for our 60-334: WWW Info Systems Development class project at the <a href="http://www.uwindsor.ca" target="_blank">University of Windsor</a>. The application will allow users to book a space for a certain date or time frame in order to hold an event or meeting.<br /><br />
                    Users will be able to register/create an account and join other users in forming groups.<br />
                    Users or groups will be able to view a list of spaces and their availability.<br /><br />
                    If a space is available during a desired meeting time, a user or a group will be allowed to book that space making it no-longer available to be booked by other users or groups.
                </div><!-- end:intro -->
            </div><!-- end:padder -->
        </div><!-- end:main -->
    </body>
</html>
