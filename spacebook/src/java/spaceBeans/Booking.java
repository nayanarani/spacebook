/**
 * This class will create beans that will represent a Booking
 * @author Steve Westfall
 */
package spaceBeans;

import java.sql.SQLException;
import java.util.Date;
import spaceDB.spaceDBAdapter;

public class Booking {

    private int bookingID;
    private int timeSlotID;
    private String bookingDate;
    private int buildingID;
    private int roomID;
    private int groupID;

    /**
     * Constructor: Used to initialize a Booking bean
     * @param bookingID
     * @param timeSlotID
     * @param roomID
     * @param groupID
     * @param booked
     */
    public Booking(int bookingID, int timeSlotID,  String bookingDate, int buildingID, int roomID, int groupID) {
        this.bookingID = bookingID;
        this.timeSlotID = timeSlotID;
        this.bookingDate = bookingDate;
        this.buildingID = buildingID;
        this.roomID = roomID;
        this.groupID = groupID;
    }

    /**
     * Empty Constructor: Used to Initialize a Booking bean without setting any member variables
     */
    public Booking() {
        this.bookingDate = "";
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
     * Get the value of buildingID
     * @return the value of buildingID
     */
    public int getBuildingID() {
        return buildingID;
    }

    /**
     * Set the value of buildingID
     * @param buildingID new value of buildingID
     */
    public void setBuildingID(int buildingID) {
        this.buildingID = buildingID;
    }

    /**
     * Get the value of roomID
     * @return the value of roomID
     */
    public int getRoomID() {
        return roomID;
    }

    /**
     * Set the value of roomID
     * @param roomID new value of roomID
     */
    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    /**
     * Get the value of bookingDate
     * @return the value of bookingDate
     */
    public String getBookingDate() {
        return bookingDate;
    }

    /**
     * Set the value of bookingDate
     * @param bookingDate new value of bookingDate
     */
    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }


    /**
     * Get the value of timeSlotID
     * @return the value of timeSlotID
     */
    public int getTimeSlotID() {
        return timeSlotID;
    }

    /**
     * Set the value of timeSlotID
     * @param timeSlotID new value of timeSlotID
     */
    public void setTimeSlotID(int timeSlotID) {
        this.timeSlotID = timeSlotID;
    }

    /**
     * Get the value of bookingID
     * @return the value of bookingID
     */
    public int getBookingID() {
        return bookingID;
    }

    /**
     * Set the value of bookingID
     * @param bookingID new value of bookingID
     */
    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    /**
     * Creates a booking in the DB
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void createBooking() throws ClassNotFoundException, SQLException{
        spaceDBAdapter dbAdapter = new spaceDBAdapter();
        dbAdapter.insertBooking(timeSlotID, bookingDate, buildingID, roomID, groupID);
    }

    /**
     * Cancels a booking by deleting it from the DB
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void cancelBooking() throws ClassNotFoundException, SQLException{
        spaceDBAdapter dbAdapter = new spaceDBAdapter();
        dbAdapter.deleteBooking(bookingID);
    }
}
