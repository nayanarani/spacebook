/**
 *   Document   : createGroup
 *   Created on : 06-Apr-2011, 4:07:31 PM
 *   Author     : Steve Westfall
 */

package spaceServlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import spaceBeans.Group;

/**
 *
 * @author WestfallHome
 */
public class createGroup extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //Obtain the session object
        HttpSession session = request.getSession(false);
        if(session == null){
            response.sendRedirect("login.jsp");
        }
        else{
            String groupName = (String) request.getParameter("groupName").toString();
            int userID = 0;
            userID = Integer.parseInt(request.getParameter("userID"));

            if( (groupName != null || groupName.compareTo("") != 0) && userID > 0){
                Group group = new Group();
                group.setGroupName(groupName);

                try {
                    group.createGroup(userID);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(createGroup.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(createGroup.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //on redirect back to the groups page
            response.sendRedirect("groups.jsp");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
