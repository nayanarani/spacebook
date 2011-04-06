/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package spaceServlets;

import java.io.IOException;
import java.io.PrintWriter;
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
public class joinGroup extends HttpServlet {
   
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
            int groupID = 0;
            groupID = Integer.parseInt(request.getParameter("groupID"));
            int userID = 0;
            userID = Integer.parseInt(request.getParameter("userID"));

            if(groupID > 0 && userID > 0){
                Group group = new Group();
                group.setGroupID(groupID);
                
                try {
                    group.joinGroup(userID);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(joinGroup.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(joinGroup.class.getName()).log(Level.SEVERE, null, ex);
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
