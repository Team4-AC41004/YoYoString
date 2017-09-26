/*
 * Don't change this. It's a template, so copy paste and adjust for your needs.
 */
package Servlets;

import Beans.LoggedIn;

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
 * Updated 25/09/2017 13:30
 */
@WebServlet(name = "CustomerInfo", urlPatterns = {"/CustomerInfo"})
public class CustomerInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        RequestDispatcher rd = request.getRequestDispatcher("/customerinfo.jsp");
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
        // Runs when POST method is used to direct to page. Not used in the test*.* templates, here it's GET that's running.
        
        RequestDispatcher rd = request.getRequestDispatcher("/customerinfo.jsp");
        rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "I like Servlets. - Sufea2k17";
    }// </editor-fold>

}
