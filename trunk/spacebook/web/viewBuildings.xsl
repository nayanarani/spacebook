<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="viewBuildings.xsl"?>

<!--
    Document   : viewBuildings.xsl
    Created on : March 13, 2011, 2:51 PM
    Author     : Benjamin
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>View Buildings: spacebook</title>
                <link rel="stylesheet" type="text/css" href="css/spacebook_style.css" />
            </head>
            <body>
                <div class="header_image">
                    <img src="images/spacebook_logo.jpg" border="0" alt="spacebook" title="Welcome to spacebook!" />
                </div><!-- end:header_image -->

                <div class="main">
                    <div class="navigation">
                        <a href="index.jsp">Home</a>
                        <a href="logout.jsp">Logout</a>
                        <a href="myAccount.jsp">View Profile</a>
                        <a href="groups.jsp">View Groups</a>
                        <a href="buildings.xml">View Buildings</a>
                        <a href="book.jsp">Book a Space</a>
                    </div><!-- end:navigation -->
                    <div class="padder">
                        <table class="buildingTable" cell-spacing="1">
                            <thead>
                                <tr>
                                    <th colspan="3">LIST OF BUILDINGS ON CAMPUS</th>
                                </tr>
                                <tr>
                                    <th>Building Name</th>
                                    <th>Building Code</th>
                                    <th>Rooms</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="/buildings/building">
                                    <tr>
                                        <td><xsl:value-of select="name" /></td>
                                        <td><xsl:value-of select="buildingCode" /></td>
                                        <td><xsl:value-of select="rooms" /></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div><!-- end:padder -->
                </div><!-- end:main -->
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
