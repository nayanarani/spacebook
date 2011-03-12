/**
 * This class will create beans that will represent a Building
 * @author Steve Westfall
 */

package spaceBeans;


public class Building {

    private int buildingID;
    private String name;

    /**
     * Constructor: Used to initialize a Building Bean
     * @param buildingID
     * @param name
     */
    public Building(int buildingID, String name) {
        this.buildingID = buildingID;
        this.name = name;
    }

    /**
     * Empty Constructor: Used to initialize a Building bean without setting member variables
     */
    public Building() {
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

}
