/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package spaceDB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author Benjamin
 */
public class insertBuildings {
    private String buildings = "http://localhost:8080/spacebook/buildings.xml";
    private String entityElementsName = "buildings";
    private Document dom;
    private spaceDB.spaceDBAdapter db = new spaceDB.spaceDBAdapter();

    public void init() throws IOException, ParserConfigurationException, SAXException {
        try {
            PreparedStatement pstmt = null;
            String insertQuery = "INSERT INTO BUILDINGS(buildingID, buildingName) VALUES(?, ?)";
            
            dom = getXMLDoc(buildings);
            NodeList records = dom.getElementsByTagName(entityElementsName);
            Connection con = db.getConnection();
            pstmt = con.prepareStatement(insertQuery);

            for (int i = 0; i < records.getLength(); i++) {
                int id = 0;
                String name = "";

                Element record = (Element) records.item(i);

                id = Integer.parseInt(record.getAttribute("id"));
                name = record.getFirstChild().getNodeValue();

                pstmt.setInt(1, id);
                pstmt.setString(2, name);
                pstmt.execute();
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(insertBuildings.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(insertBuildings.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * Retrieves a given XML document path
     * @param fileName
     * @return Document
     * @throws IOException
     * @throws ParserConfigurationException
     * @throws SAXException
     */
    public static Document getXMLDoc(String fileName) throws IOException, ParserConfigurationException,SAXException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();
        return  db.parse(fileName);
    }

    public static void main(String[] args) throws Exception {
        insertBuildings ib = new insertBuildings();
        ib.init();
    }
}
