<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : viewBuildings.xsl
    Created on : March 13, 2011, 2:51 PM
    Author     : Benjamin
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Buidlings</title>
            </head>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th colspan="2">Buildings</th>
                        </tr>
                        <tr>
                            <th>Name</th>
                            <th>Building Code</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="buildings/building" />
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template>
        <tr>
            <td><xsl:value-of select="name" /></td>
            <td><xsl:value-of select="buildingCode" /></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
