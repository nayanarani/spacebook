/**
 * This class will create beans that will represent a User
 * @author Steve Westfall
 */

package spaceBeans;

import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.*;
import spaceDB.spaceDBAdapter;

public class User {

    private int userID;
    private String userName;
    private String firstName;
    private String lastName;
    private String password;
    private String confirm_pw;
    private String errorMessages;

    /**
     * Constructor: Used to initialize a User bean
     * @param userID
     * @param firstName
     * @param lastName
     * @param password
     */
    public User(int userID, String userName, String firstName, String lastName, String password, String confirm_pw, String errorMessages) {
        this.userID = userID;
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.confirm_pw = confirm_pw;
        this.errorMessages = errorMessages;
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
     * Get the value of userName
     * @return the value of userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Set the value of userName
     * @param userName new value of userName
     */
    public void setUserName(String userName) {
        this.userName = userName;
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

    /* Error Handling */
    public static final Integer ERR_UNAME_ENTER = new Integer(1);
    public static final Integer ERR_UNAME_INVALID = new Integer(2);
    public static final Integer ERR_UNAME_EXISTS = new Integer(3);
    public static final Integer ERR_FNAME_ENTER = new Integer(4);
    public static final Integer ERR_FNAME_INVALID = new Integer(5);
    public static final Integer ERR_LNAME_ENTER = new Integer(6);
    public static final Integer ERR_LNAME_INVALID = new Integer(7);
    public static final Integer ERR_PASSWD_ENTER = new Integer(8);
    public static final Integer ERR_CONFIRM_ENTER = new Integer(9);
    public static final Integer ERR_PASSWD_INVALID = new Integer(10);
    public static final Integer ERR_CONFIRM_INVALID = new Integer(11);

    // Holds error messages for the properties
    private static Map errorCodes = new HashMap();

    // Maps error codes to textual messages.
    // This map must be supplied by the object that instantiated this bean.
    private static Map msgMap;
    public void setErrorMessages(Map msgMap) {
        User.msgMap = msgMap;
    }

    public static String getErrorMessage(String propName) {
        Integer code = (Integer)(errorCodes.get(propName));
        if (code == null) {
            return "";
        } else if (msgMap != null) {
            String msg = (String)msgMap.get(code);
            if (msg != null) {
                return msg;
            }
        }
        return "Error";
    }

    /* SignUp Form validation and processing */
    public boolean isValidSignUp() {
        // Clear all errors
        errorCodes.clear();
        String spaceOrQuotesPattern = "[\\Q\\E\\s]";

        // Create a Pattern object
        Pattern s_or_q_pat = Pattern.compile(spaceOrQuotesPattern);

        // Now create matcher objects.
        Matcher uName = s_or_q_pat.matcher(userName);
        Matcher fName = s_or_q_pat.matcher(firstName);
        Matcher lName = s_or_q_pat.matcher(lastName);
        Matcher passwd = s_or_q_pat.matcher(password);

        // Validate userName
        if (userName.length() == 0) {
            errorCodes.put("userName", ERR_UNAME_ENTER);
        }
        else if (uName.find() || userName.length() > 30) {
            errorCodes.put("userName", ERR_UNAME_INVALID);
        }
        else{
            try{
                if(checkUser(userName)){
                    errorCodes.put("userName", ERR_UNAME_EXISTS);
                }
            }
            catch(Exception e){
            }
        }

        //Validate firstName
        if (firstName.length() == 0) {
            errorCodes.put("firstName", ERR_FNAME_ENTER);
        }
        else if (fName.find() || firstName.length() > 30) {
            errorCodes.put("firstName", ERR_FNAME_INVALID);
        }

        //Validate lastName
        if (lastName.length() == 0) {
            errorCodes.put("lastName", ERR_LNAME_ENTER);
        }
        else if (lName.find() || lastName.length() > 30) {
            errorCodes.put("lastName", ERR_LNAME_INVALID);
        }

        //Validate password
        if (password.length() == 0) {
            errorCodes.put("password", ERR_PASSWD_ENTER);
        }
        else if (passwd.find() || (password.length() < 6 || password.length() > 10)) {
            errorCodes.put("password", ERR_PASSWD_INVALID);
        }

        //Validate confirm password
        if (confirm_pw.length() == 0){
            errorCodes.put("confirm_pw", ERR_CONFIRM_ENTER);
        }
        else if(confirm_pw.compareTo(password) != 0){
            errorCodes.put("confirm_pw", ERR_CONFIRM_INVALID);
        }

        // If no errors, form is valid
        if(errorCodes.isEmpty()){
            return true;
        }
        else{
            return false;
        }
    }

    /* SignIn Form validation and processing */
    public boolean isValidSignIn() {
        // Clear all errors
        errorCodes.clear();
        String spaceOrQuotesPattern = "[\\Q\\E\\s]";

        // Create a Pattern object
        Pattern s_or_q_pat = Pattern.compile(spaceOrQuotesPattern);

        // Now create matcher objects.
        Matcher uName = s_or_q_pat.matcher(userName);
        Matcher passwd = s_or_q_pat.matcher(password);

        // Validate userName
        if (userName.length() == 0) {
            errorCodes.put("userName", ERR_UNAME_ENTER);
        }
        else if (uName.find() || userName.length() > 30) {
            errorCodes.put("userName", ERR_UNAME_INVALID);
        }
        else{
            try{
                if(checkUser(userName)){
                    errorCodes.put("userName", ERR_UNAME_EXISTS);
                }
            }
            catch(Exception e){
            }
        }

        //Validate password
        if (password.length() == 0) {
            errorCodes.put("lastName", ERR_PASSWD_ENTER);
        }
        else if (passwd.find() || (password.length() < 6 || password.length() > 10)) {
            errorCodes.put("firstName", ERR_PASSWD_INVALID);
        }

        // If no errors, form is valid
        if(errorCodes.isEmpty()){
            return true;
        }
        else{
            return false;
        }
    }

    public boolean checkUser(String userName) throws ClassNotFoundException, SQLException{
        spaceDBAdapter dbAdapter = new spaceDBAdapter("Users");
        return dbAdapter.valueExists("userName", userName);
    }

    public boolean processSignUp() {
        if (!isValidSignUp()) {
            return false;
        }

        // Process form...
        spaceDBAdapter dbAdapter = new spaceDBAdapter("Users");
        try {
            dbAdapter.insertUser(userName, firstName, lastName, password);
        }
        catch (Exception e) {
        }

        errorCodes.clear();
        return true;
    }

    public boolean processSignIn(){
        if (!isValidSignIn()) {
            return false;
        }

        errorCodes.clear();
        return true;
    }
}
