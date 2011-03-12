/**
 * This class will create beans that will represent a Booking
 * @author Steve Westfall
 */

package spaceBeans;

public class Booking {

    private int bookingID;
    private int timeSlotID;
    private int roomID;
    private int groupID;
    private boolean booked;

    /**
     * Constructor: Used to initialize a Booking bean
     * @param bookingID
     * @param timeSlotID
     * @param roomID
     * @param groupID
     * @param booked
     */
    public Booking(int bookingID, int timeSlotID, int roomID, int groupID, boolean booked) {
        this.bookingID = bookingID;
        this.timeSlotID = timeSlotID;
        this.roomID = roomID;
        this.groupID = groupID;
        this.booked = booked;
    }

    /**
     * Empty Constructor: Used to Initialize a Booking bean without setting any member variables
     */
    public Booking() {
    }

    /**
     * Get the value of booked
     * @return the value of booked
     */
    public boolean isBooked() {
        return booked;
    }

    /**
     * Set the value of booked
     * @param booked new value of booked
     */
    public void setBooked(boolean booked) {
        this.booked = booked;
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

}
