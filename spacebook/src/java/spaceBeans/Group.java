/**
 * This class will create beans that will represent a Group
 * @author Steve Westfall
 */

package spaceBeans;

public class Group {

    private int groupID;
    private String name;
    private int adminID;

    /**
     * Constructor: Used to initialize a Group bean
     * @param groupID
     * @param name
     * @param adminID
     */
    public Group(int groupID, String name, int adminID) {
        this.groupID = groupID;
        this.name = name;
        this.adminID = adminID;
    }

    /**
     * Empty Constructor: Used to initialize a Group bean without setting any member variables
     */
    public Group() {
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
    public String getName() {
        return name;
    }

    /**
     * Set the value of name
     * @param name new value of name
     */
    public void setName(String name) {
        this.name = name;
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

}
