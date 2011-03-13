/**
 * This class will provide beans access to the DB
 * @author Steve Westfall
 */

package spaceDB;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;


public class spaceDBAdapter {
    private String tableName;
    private String url;
    private String driver;
    private String user;
    private String pwd;

    public spaceDBAdapter(String tableName, String url, String driver, String user, String pwd) {
        this.tableName = tableName;
        this.url = url;
        this.driver = driver;
        this.user = user;
        this.pwd = pwd;
    }

    /**
     * How to load the JDBC driver and obtain a Connection object
     * @return
     */
    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, pwd);
        return con;
    }

    /**
     * How to make simple SQL query against the DB using the Statement interface.
     * @param querySqlString
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void makeSimpleQueries(String querySqlString) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(querySqlString); // executeQuery returns a ResultSet
        ResultSetMetaData rsmData = rs.getMetaData();
        int colCount = rsmData.getColumnCount();
        while (rs.next()) { // each row at atime
            StringBuilder buf = new StringBuilder();
            for (int i = 1; i <= colCount; i++) { // each column of current row at a time
                buf.append(rs.getObject(i).toString()).append("\t");
            }
            System.out.println(buf.toString());
        }
        con.close();
    }


    /**
     * How to execute any SQL query against the DB; select, insert, update, delete anything
     * @param insertIntoSql
     */
    public void executeSqlCommand(String sqlString) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        boolean whatIsReturned = stmt.execute(sqlString); // executeQuery returns a ResultSet
        if (whatIsReturned == true) { // The sql command returned a ResultSet, it was most likey a query.
            // Lets obtain the ResultSet and print data
            ResultSet rs = stmt.getResultSet() ;
            ResultSetMetaData rsmData = rs.getMetaData();
            int colCount = rsmData.getColumnCount();
            while (rs.next()) { // each row at atime
                StringBuilder buf = new StringBuilder();
                for (int i = 1; i <= colCount; i++) { // each column of current row at a time
                    buf.append(rs.getObject(i).toString()).append("\t");
                }
                System.out.println(buf.toString());
            }
        } else { // The sql command returned updated the table and the return value should be the number of rows affected/updated
            int updateCount = stmt.getUpdateCount() ;
            //System.out.printf("%d Rows were updated\n", updateCount);
        }
        con.close();
    }
}
