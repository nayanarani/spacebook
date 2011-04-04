
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
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author Benjamin, Steve
 */
public class insertBuildings {
    private String buildings = "/home/jamsea/programming/334/spacebook/web/buildings.xml"; //this must be the path on your machine to buildings.xml
    private String entityElementsName = "buildings";
    private Document dom;
    private spaceDBAdapter db = new spaceDBAdapter();

    public void init() throws IOException, ParserConfigurationException, SAXException {
        try {
            PreparedStatement pstmt = null;
            String insertQuery = "INSERT INTO BUILDINGS(buildingName) VALUES(?)";
            dom = getXMLDoc(buildings);
            NodeList records = dom.getElementsByTagName(entityElementsName);
            Connection con = db.getConnection();
            pstmt = con.prepareStatement(insertQuery);

            for (int i = 0; i < records.getLength(); i++) {
                String name = "";

                Element root = (Element) records.item(i); //this gets the root node: buildings
                NodeList building = root.getChildNodes(); //this creates the list of building nodes

               for (int j = 0; j < building.getLength(); j++) {
                    if (building.item(j).getNodeType() == Node.ELEMENT_NODE) { //checks to make sure we only deal with ELEMENT NODES

                        NodeList buildingInfo = building.item(j).getChildNodes(); //this creates the list of building properties: name, buildingCode

                        for( int k=0; k < buildingInfo.getLength(); k++){

                            if (buildingInfo.item(k).getNodeType() == Node.ELEMENT_NODE) { //checks to make sure we only deal with ELEMENT NODES
                                if(buildingInfo.item(k).getNodeName().compareTo("name") == 0){ //when we find name elements, get their text value and add it to pstmt
                                    name = buildingInfo.item(k).getTextContent();
                                    pstmt.setString(1, name);
                                    pstmt.execute();
                                }
                            }
                        }
                    }
                }

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
