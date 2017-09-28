/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Models.AllDataModel;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "GoogleMapTest", urlPatterns = {"/GoogleMapTest",})
public class GoogleMapTest extends HttpServlet{
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get search details
        HttpSession session = request.getSession();
        
        String userid = null;
        String startdate = null;
        String enddate = null;
        
        if (request.getParameter("useridmap")!=null){
                userid = request.getParameter("useridmap");
                if (checkInput(userid)==false){
                   userid="!";
                }
        }
        if (request.getParameter("startdatepickermap")!=null){
                startdate = request.getParameter("startdatepickermap");
        }
        else{
            startdate="!";
        }
        if (request.getParameter("enddatepickermap")!=null){
                enddate = request.getParameter("enddatepickermap");
        }
        else{
            enddate="!";
        }
        
        AllDataModel data = new AllDataModel(); // This class contains methods for user queries
        boolean matched = false;
        try{
            request.setAttribute("userJourneyPoints", data.getUserJourney(userid, startdate, enddate) ); 
            matched = true;
        }catch(Exception e){
            System.out.println("Error getting user journey data.");
            matched = false;
        }
        
        System.out.println("json objects for user made " + matched);
        
        if (matched) 
        {  
            RequestDispatcher rd = request.getRequestDispatcher("/googlemapTest.jsp");
            rd.forward(request, response);
        } 
        else{
            RequestDispatcher rd = request.getRequestDispatcher("/googlemapTest.jsp");
            rd.forward(request, response);
        }             
        
    }
    public boolean checkInput(String input){   
        if (input.matches("[0-9]+") && input.length() > 2) {
            return true;
        }
        else{
            return false;
        }
    }
    
        /**
     * 
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        RequestDispatcher rd = request.getRequestDispatcher("/googlemapTest.jsp");
        rd.forward(request, response);
    }
    
}
