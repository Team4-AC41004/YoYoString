/*
 * Don't change this. It's a template, so copy paste and adjust for your needs.
 */
package Servlets;

import Beans.LoggedIn;
import Models.NightOwlModel;
import Beans.NightOwlBean;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Philipp
 */
@WebServlet(name = "NightOwlServlet", urlPatterns = {"/NightOwls"})
public class NightOwlServlet extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        NightOwlModel NightOwlModelObj = new NightOwlModel();
        try 
        {
            // Retrieve the attribute that holds all data which was retrieved by the Model from the Database.
            request.setAttribute("JSONListAttribute", NightOwlModelObj.getJSONObjectList() ); 
        } 
        catch (SQLException ex) { Logger.getLogger(NightOwlServlet.class.getName()).log(Level.SEVERE, null, ex); }
        
        RequestDispatcher rd = request.getRequestDispatcher("/nightowls.jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Post not used
            RequestDispatcher rd = request.getRequestDispatcher("/tribes.jsp");
            rd.forward(request, response);  
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "This Servlet retrieves the data about the tribe of 'Nightowls'.";
    }// </editor-fold>

}
