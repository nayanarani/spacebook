/**
 * This class will create beans that will represent a TimeSlot
 * @author Steve Westfall
 */

package spaceBeans;

import java.sql.Time;

public class TimeSlot {

    private int timeSlotID;
    private Time startTime;
    private Time endTime;

    /**
     * Constructor: Used to initialize a TimeSlot bean
     * @param timeSlotID
     * @param startTime
     * @param endTime
     */
    public TimeSlot(int timeSlotID, Time startTime, Time endTime) {
        this.timeSlotID = timeSlotID;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    /**
     * Empty Constructor: Used to initialize a TimeSlot bean without setting any member variables
     */
    public TimeSlot() {
    }

    /**
     * Get the value of endTime
     * @return the value of endTime
     */
    public Time getEndTime() {
        return endTime;
    }

    /**
     * Set the value of endTime
     * @param endTime new value of endTime
     */
    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    /**
     * Get the value of startTime
     * @return the value of startTime
     */
    public Time getStartTime() {
        return startTime;
    }

    /**
     * Set the value of startTime
     * @param startTime new value of startTime
     */
    public void setStartTime(Time startTime) {
        this.startTime = startTime;
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

}
