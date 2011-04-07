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
                <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
                <title>View Buildings: spacebook</title>
            </head>
    <body>
           <div id="header">
               <h1>Spacebook</h1>
                <nav>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="register.jsp">Register</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                        <li><a href='myAccount.jsp'>View Profile</a></li>
                        <li><a href="groups.jsp">View Groups</a></li>
                        <li><a href="buildings.xml">View Buildings</a></li>
                        <li><a href="book.jsp">Book a Space</a></li>
                    </ul>
                </nav>
            </div><!-- end:navigation -->
            <div class="colmask threecol">
                <div class="colmid">
                        <div class="colleft">
                                <div class="col1">

                    <div class="padder">
                        <table class="buildingTable" cell-spacing="1">
                            <thead>
                                <tr>
                                    <th colspan="2">LIST OF BUILDINGS ON CAMPUS</th>
                                </tr>
                                <tr>
                                    <th>Building Name</th>
                                    <th>Building Code</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="/buildings/building">
                                    <tr>
                                        <td><xsl:value-of select="name" /></td>
                                        <td><xsl:value-of select="buildingCode" /></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div><!-- end:padder -->
		</div> <!-- col1 end -->
            </div> <!-- colleft end -->
	</div> <!-- colmid end -->
</div> <!-- colmask threecol -->

  <footer>
      <nav>
      <div align="center">
          <a href="index.jsp"> Spacebook </a>
      </div>
      </nav>
  </footer>
  
  </body>
</html>
    </xsl:template>

</xsl:stylesheet>
