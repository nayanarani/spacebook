/**
 * This class will create beans that will represent a Group
 * @author Steve Westfall
 */

package spaceBeans;

import java.sql.SQLException;
import spaceDB.spaceDBAdapter;

public class Group {

    private int groupID;
    private String groupName;
    private int adminID;

    /**
     * Constructor: Used to initialize a Group bean
     * @param groupID
     * @param name
     * @param adminID
     */
    public Group(int groupID, String groupName, int adminID) {
        this.groupID = groupID;
        this.groupName = groupName;
        this.adminID = adminID;
    }

    /**
     * Empty Constructor: Used to initialize a Group bean without setting any member variables
     */
    public Group() {
        this.groupName = "";
    }

    /**
     * Get the value of adminID
     * @return the value of adminID
     */
    public int getAdminID() {
        return adminID;
    }

    /**
     * Set the value of adminID
     * @param adminID new value of adminID
     */
    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    /**
     * Get the value of name
     * @return the value of name
     */
    public String getGroupName() {
        return groupName;
    }

    /**
     * Set the value of name
     * @param name new value of name
     */
    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    /**
     * Get the value of groupID
     * @return the value of groupID
     */
    public int getGroupID() {
        return groupID;
    }

    /**
     * Set the value of groupID
     * @param groupID new value of groupID
     */
    public void setGroupID(int groupID) {
        this.groupID = groupID;
    }

    /**
     * Adds a User to a Group
     * @param userID
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void joinGroup(int userID) throws ClassNotFoundException, SQLException{
        spaceDBAdapter dbAdapter = new spaceDBAdapter();
        dbAdapter.insertGroupUserXR(groupID, userID);
    }

    /**
     * Removes a User from a Group
     * @param userID
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void leaveGroup(int userID) throws ClassNotFoundException, SQLException{
        spaceDBAdapter dbAdapter = new spaceDBAdapter();
        dbAdapter.deleteGroupUserXR(groupID, userID);
    }

    /**
     * Let's an Admin of a Group delete the Group
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void deleteGroupByAdmin() throws ClassNotFoundException, SQLException{
        spaceDBAdapter dbAdapter = new spaceDBAdapter();
        dbAdapter.deleteGroup(groupID);
    }

    public void createGroup(int userID)throws ClassNotFoundException, SQLException{
        spaceDBAdapter dbAdapter = new spaceDBAdapter();
        dbAdapter.insertGroup(groupName, userID);
    }
}
