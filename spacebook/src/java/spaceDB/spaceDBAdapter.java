/**
 * This class will provide beans access to the DB
 * @author Steve Westfall
 */

package spaceDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class spaceDBAdapter {
    private String tableName;
    private String url = "jdbc:derby://localhost:1527/spaceDB";
    private String driver = "org.apache.derby.jdbc.ClientDriver";
    private String user = "spaceUser";
    private String pwd = "spacePass";

    public spaceDBAdapter(String tableName) {
        this.tableName = tableName;
    }

    /**
     * How to load the JDBC driver and obtain a Connection object
     * @return
     */
    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, pwd);
        return con;
    }

    /**
     * This function will search the given column for the given value and return whether or not it is found
     * @param columnName
     * @param value
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public boolean valueExists(String tableName, String value) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        String query = "SELECT * FROM "+tableName;
        ResultSet rs = stmt.executeQuery(query); // executeQuery returns a ResultSet
        
        while (rs.next()) {                                                //Loop through the ResultSet
            String keyInTable = rs.getString(2);
            if (keyInTable.compareTo(value) == 0) {                        //Check the keyToCheck against keys in the table
               return true;                                                     //If a key is matched, return true
            }
        }
        return false;
    }

    /**
     * Inserts a User into the DB
     * @param uName
     * @param fName
     * @param lName
     * @param password
     */
    public void insertUser(String uName, String fName, String lName, String password) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        String userDataSQL = "INSERT INTO USERS(userName, firstName, lastName, password) VALUES('"+uName+"', '"+fName+"', '"+lName+"', '"+password+"')";
        stmt.executeUpdate(userDataSQL);
    }

    /**
     * Inserts a Group into the DB
     * @param name
     * @param adminID
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void insertGroup(String name, String adminID) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        String groupDataSQL = "INSERT INTO GROUPS(name, adminID) VALUES('"+name+"', '"+adminID+"')";
        stmt.executeUpdate(groupDataSQL);
    }

    /**
     * Inserts a record into the GroupUserXR cross reference table
     * @param groupID
     * @param userID
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void insertGroupUserXR(String groupID, String userID) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        String groupUserDataSQL = "INSERT INTO GROUPUSERXR(groupID, userID) VALUES('"+groupID+"', '"+userID+"')";
        stmt.executeUpdate(groupUserDataSQL);
    }

    /**
     * Inserts a record into the Bookings table
     * @param timeslotID
     * @param bookingDate
     * @param isBooked
     * @param roomID
     * @param groupID
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void insertBooking(String timeslotID, String bookingDate, boolean isBooked, String roomID, String groupID) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        String bookingDataSQL = "INSERT INTO BOOKINGS(timeslotID, bookingDate, isBooked, roomID, groupID) VALUES('"+timeslotID+"', '"+bookingDate+", "+isBooked+", "+roomID+", "+groupID+"')";
        stmt.executeUpdate(bookingDataSQL);
    }
}
