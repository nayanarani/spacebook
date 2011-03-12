/**
 * This class will create beans that will represent a User
 * @author Steve Westfall
 */

package spaceBeans;


public class User {

    private int userID;
    private String firstName;
    private String lastName;
    private String password;

    /**
     * Constructor: Used to initialize a User bean
     * @param userID
     * @param firstName
     * @param lastName
     * @param password
     */
    public User(int userID, String firstName, String lastName, String password) {
        this.userID = userID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
    }

    /**
     * Empty Constructor: Used to initialize a User bean without setting any member variables
     */
    public User() {
    }

    /**
     * Get the value of password
     * @return the value of password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Set the value of password
     * @param password new value of password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Get the value of lastName
     * @return the value of lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Set the value of lastName
     * @param lastName new value of lastName
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * Get the value of firstName
     * @return the value of firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Set the value of firstName
     * @param firstName new value of firstName
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Get the value of userID
     * @return the value of userID
     */
    public int getUserID() {
        return userID;
    }

    /**
     * Set the value of userID
     * @param userID new value of userID
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }

}
