/*
 * Don't change this. It's a template, so copy paste and adjust for your needs.
 */
package Servlets;

import Beans.LoggedIn;
import Models.TribeModel;
import Beans.TribeBean;


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
@WebServlet(name = "TribeServlet", urlPatterns = {"/Tribes"})
public class TribeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TribeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TribeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        System.out.println("doGet in TribeServlet.java.");
        
        TribeModel TribeModelObj = new TribeModel();
        try 
        {
            // Retrieve the attribute that holds all data which was retrieved by the Model from the Database.
            request.setAttribute("JSONListAttribute", TribeModelObj.getJSONObjectList() ); 
        } 
        catch (SQLException ex) { Logger.getLogger(TribeServlet.class.getName()).log(Level.SEVERE, null, ex); }
        
        System.out.println("after try in doPost in TribeServlet.java");
        RequestDispatcher rd = request.getRequestDispatcher("/tribes.jsp");
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
        //processRequest(request, response);
        System.out.println("doPost in TribeServlet.java.");
        // None of this is done.
        HttpSession session = request.getSession();
        LoggedIn loggedin = (LoggedIn) session.getAttribute("loggedin");
        TribeModel TribeModelObj = new TribeModel();
        

        //if (request.getParameter("type").equals("To Philipp's Test Page")) // This is weird. "type"?? why not "value" ?
        //{
            //request.setAttribute("type", "pos");
            try 
            { 
                System.out.println("try in doPost in TribeServlet.java");
                //request. ?
                //session.setAttribute("TribeAttribute", TribeModelObj.getBeanList() );
                
                // JSONObject
                request.setAttribute("JSONListAttribute", TribeModelObj.getJSONObjectList() ); 
            } catch (SQLException ex) {
                Logger.getLogger(TribeServlet.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("catch in doPost in TribeServlet.java");
            }
            System.out.println("after try in doPost in TribeServlet.java");
            RequestDispatcher rd = request.getRequestDispatcher("/tribes.jsp");
            rd.forward(request, response);
            
        //}
        
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
