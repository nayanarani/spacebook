/**
 * This class will create beans that will represent a Room
 * @author Steve Westfall
 */
package spaceBeans;


public class Room {

    private int roomID;
    private int buildingID;
    private String roomNumber;
    private int capacity;
    private boolean projector;

    /**
     * Constructor: Used to initialize a Room bean
     * @param roomID
     * @param buildingID
     * @param roomNumber
     * @param capacity
     * @param projector
     */
    public Room(int roomID, int buildingID, String roomNumber, int capacity, boolean projector) {
        this.roomID = roomID;
        this.buildingID = buildingID;
        this.roomNumber = roomNumber;
        this.capacity = capacity;
        this.projector = projector;
    }

    /**
     * Empty Constructor: Used to initialize a Room bean without setting member variables
     */
    public Room() {
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
     * Get the value of roomNumber
     * @return the value of roomNumber
     */
    public String getRoomNumber() {
        return roomNumber;
    }

    /**
     * Set the value of roomNumber
     * @param roomNumber new value of roomNumber
     */
    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    /**
     * Get the value of capacity
     * @return the value of capacity
     */
    public int getCapacity() {
        return capacity;
    }

    /**
     * Set the value of capacity
     * @param capacity new value of capacity
     */
    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    /**
     * Get the value of projector
     * @return the value of projector
     */
    public boolean hasProjector() {
        return projector;
    }

    /**
     * Set the value of projector
     * @param projector new value of projector
     */
    public void setProjector(boolean projector) {
        this.projector = projector;
    }

}
