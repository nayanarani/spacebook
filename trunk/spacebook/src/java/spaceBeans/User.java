/**
 * This class will create beans that will represent a User
 * @author Steve Westfall
 */

package spaceBeans;

import java.sql.SQLException;
import java.util.*;
import spaceDB.spaceDBAdapter;

public class User {

    private int userID;
    private String userName;
    private String firstName;
    private String lastName;
    private String password;
    private String confirm_pw;
    private Map errors;


    /**
     * Constructor: Used to initialize a User bean
     * @param userID
     * @param firstName
     * @param lastName
     * @param password
     */
    public User(int userID, String userName, String firstName, String lastName, String password, String confirm_pw) {
        this.userID = userID;
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.confirm_pw = confirm_pw;
        this.errors = new HashMap();
    }

    /**
     * Empty Constructor: Used to initialize a User bean without setting any member variables
     */
    public User() {
        this.userName = "";
        this.firstName = "";
        this.lastName = "";
        this.password = "";
        this.confirm_pw = "";
        this.errors = new HashMap();
    }

    /**
     * Start Setters and Getters
     */
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm_pw() {
        return confirm_pw;
    }

    public void setConfirm_pw(String confirm_pw) {
        this.confirm_pw = confirm_pw;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
    /**
     * End Setters and Getters
     */

    public boolean checkUser(String userName) throws ClassNotFoundException, SQLException{
        spaceDBAdapter dbAdapter = new spaceDBAdapter("Users");

        return dbAdapter.valueExists("Users", userName);
    }

    public boolean processSignUp() throws ClassNotFoundException, SQLException{
        if(isValidSignUp()){
            spaceDBAdapter dbAdapter = new spaceDBAdapter("Users");
            dbAdapter.insertUser(userName, firstName, lastName, password);
            return true;
        }
        else{
            return false;
        }
    }

    /**
     * Validates the registration form
     * @return allOK=true or false 
     */
    public boolean isValidSignUp() throws ClassNotFoundException, SQLException {
        boolean allOk=true;
        String[] REGEX = new String[3];
        REGEX[0] = ".*[0-9].*"; //any digit
        REGEX[1] = ".*[\\p{Punct}].*"; //any punctuation
        REGEX[2] = ".*[\\p{Space}].*"; //any whitespace

        int found = 0;
        int i = 0;

        //check that userName is not empty
        if (userName.compareTo("") == 0) {
          errors.put("userName","Please enter a username");
          userName="";
          allOk=false;
        }

        //check that username does not already exist
        if (checkUser(userName)){
            errors.put("userName", "Username already exists");
            userName="";
            allOk=false;
        }

        //check userName for spaces or punctuation. start at 1 to allow digits
        for(i=1; i<3; i++){
            if(userName.matches(REGEX[i])){
                found++;
            }

            if(found>0){
                errors.put("userName", "Username must not contain spaces or punctuation");
                userName="";
                allOk=false;
                break;
            }
        }

        //check that firstName is not empty
        if (firstName.compareTo("") == 0) {
          errors.put("firstName","Please enter your first name");
          firstName="";
          allOk=false;
        }

        found = 0; //reset found
        //check firstName for numbers or punctuation. stop at 2 to allow spaces
        for(i=0; i<2; i++){
            if(firstName.matches(REGEX[i])){
                found++;
            }

            if(found>0){
                errors.put("firstName", "First Name must not contain numbers or punctuation");
                firstName="";
                allOk=false;
                break;
            }
        }

        //check that lastName is not empty
        if (lastName.compareTo("") == 0) {
          errors.put("lastName","Please enter your last name");
          lastName="";
          allOk=false;
        }

        found = 0; //reset found
        //check lastName for numbers or punctuation. stop at 2 to allow spaces
        for(i=0; i<2; i++){
            if(lastName.matches(REGEX[i])){
                found++;
            }

            if(found>0){
                errors.put("lastName", "Last Name must not contain numbers or punctuation");
                lastName="";
                allOk=false;
                break;
            }
        }

        //check that password is not empty
        if (password.compareTo("") == 0) {
          errors.put("password","Please enter a password");
          password="";
          allOk=false;
        }

        //check that password is between 6-10 characters
        if (password.length() < 6 || password.length() > 10) {
          errors.put("password","Password must be between 6-10 characters long");
          password="";
          allOk=false;
        }

        found = 0; //reset found
        //check password for spaces or punctuation. start at 1 to allow numbers
        for(i=1; i<3; i++){
            if(password.matches(REGEX[i])){
                found++;
            }

            if(found>0){
                errors.put("password", "Password must not contain spaces or punctuation");
                password="";
                allOk=false;
                break;
            }
        }

        //check that comfirm_pw is not empty
        if (confirm_pw.compareTo("") == 0) {
          errors.put("confirm_pw", "Please confirm your password");
          confirm_pw="";
          allOk=false;
        }

        //check that passwords match
        if (confirm_pw.compareTo(password) != 0){
            errors.put("confirm_pw", "Passwords do not match");
          confirm_pw="";
          allOk=false;
        }

        return allOk;
      }
      public String getErrorMsg(String s) {
        String errorMsg =(String)errors.get(s.trim());
        return (errorMsg == null) ? "":errorMsg;
      }

}
