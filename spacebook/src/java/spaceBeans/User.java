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
    private Hashtable errors;


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
        this.errors = new Hashtable();
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
        this.errors = new Hashtable();
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

        try{
            return dbAdapter.valueExists("userName", userName);
        }catch(Exception e){}

        return false;
    }

    public boolean processSignUp() throws ClassNotFoundException, SQLException{
        if(isValidSignUp()){
            spaceDBAdapter dbAdapter = new spaceDBAdapter("Users");
            dbAdapter.insertUser(userName, userName, lastName, password);
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
        if (userName.equals("")) {
          errors.put("userName","Please enter a username");
          userName="";
          allOk=false;
        }
        if (checkUser(userName)){
            errors.put("userName", "Username already exists");
            userName="";
            allOk=false;
        }
        if (firstName.equals("")) {
          errors.put("firstName","Please enter your first name");
          firstName="";
          allOk=false;
        }
        if (lastName.equals("")) {
          errors.put("lastName","Please enter your last name");
          lastName="";
          allOk=false;
        }
        if (password.equals("") ) {
          errors.put("password","Please enter a valid password");
          password="";
          allOk=false;
        }
        if (!password.equals("") && (confirm_pw.equals("") || !password.equals(confirm_pw))) {
          errors.put("confirm_pw","Please confirm your password");
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
