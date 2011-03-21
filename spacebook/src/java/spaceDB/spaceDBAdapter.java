/**
 * This class will provide beans access to the DB
 * @author Steve Westfall
 */

package spaceDB;

import java.math.BigInteger;
import java.security.*;
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
        try{
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, pwd);
            return con;
        }catch(Exception e){}
        return null;
    }

    /**
     * This function will search the given column for the given value and return whether or not it is found
     * @param columnName
     * @param value
     * @return true or false depending on value match
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public boolean valueExists(String value) throws ClassNotFoundException, SQLException {
        try{
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM "+tableName;
            ResultSet rs = stmt.executeQuery(query); // executeQuery returns a ResultSet

            while (rs.next()) {                                                //Loop through the ResultSet
                String keyInTable = rs.getString(2);
                if (keyInTable.compareTo(value) == 0) {                        //Check the value against keys in the table
                   return true;                                                //If a key is matched, return true
                }
            }
        }catch(Exception e){}
        return false;
    }

    /**
     * This function will search the Users table for the given userName and then compare the given password
     * against the stored password for that userName. A match returns true, no match returns false.
     * @param uName
     * @param passwd
     * @return true or false depending on password match
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public boolean checkUsernamePasswordCombo(String uName, String passwd) throws ClassNotFoundException, SQLException{
        String hashedPW = hashPassword(passwd);
        try{
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM USERS";
            ResultSet rs = stmt.executeQuery(query); // executeQuery returns a ResultSet

            while (rs.next()) {                                                //Loop through the ResultSet
                String keyInTable = rs.getString(2);
                if (keyInTable.compareTo(uName) == 0) {                        //Check the uName against userNames in the table
                    String passInTable = rs.getString(5);
                    if(hashedPW.compareTo(passInTable) == 0){
                        return true;                                            //check the password given against the password in the DB
                    }
                    else{
                        return false;                                           //password doesn't match value in table
                    }
                }
            }
        }catch(Exception e){}

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
        try{
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            String userDataSQL = "INSERT INTO USERS(userName, firstName, lastName, password) VALUES('"+uName+"', '"+fName+"', '"+lName+"', '"+hashPassword(password)+"')";
            stmt.executeUpdate(userDataSQL);
        }catch(Exception e){}
    }

    /**
     * Inserts a Group into the DB
     * @param name
     * @param adminID
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void insertGroup(String name, String adminID) throws ClassNotFoundException, SQLException {
        try{
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            String groupDataSQL = "INSERT INTO GROUPS(name, adminID) VALUES('"+name+"', '"+adminID+"')";
            stmt.executeUpdate(groupDataSQL);
        }catch(Exception e){}
    }

    /**
     * Inserts a record into the GroupUserXR cross reference table
     * @param groupID
     * @param userID
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void insertGroupUserXR(String groupID, String userID) throws ClassNotFoundException, SQLException {
        try{
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            String groupUserDataSQL = "INSERT INTO GROUPUSERXR(groupID, userID) VALUES('"+groupID+"', '"+userID+"')";
            stmt.executeUpdate(groupUserDataSQL);
        }catch(Exception e){}
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
        try{
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            String bookingDataSQL = "INSERT INTO BOOKINGS(timeslotID, bookingDate, isBooked, roomID, groupID) VALUES('"+timeslotID+"', '"+bookingDate+", "+isBooked+", "+roomID+", "+groupID+"')";
            stmt.executeUpdate(bookingDataSQL);
        }catch(Exception e){}
    }

    private String hashPassword(String password) {
        String hashword = null;
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(password.getBytes());
            BigInteger hash = new BigInteger(1, md5.digest());
            hashword = hash.toString(16);
        }
        catch (NoSuchAlgorithmException nsae) {

        }
        return pad(hashword, 32, '0');
    }

    /**
     *
     * @param padString
     * @param length
     * @param padChar
     * @return
     */
    private String pad(String padString, int length, char padChar) {
        StringBuilder buffer = new StringBuilder(padString);

        while (buffer.length() < length) {
            buffer.insert(0, padChar);
        }
        return buffer.toString();}
}
