/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Models.AllUsersModel;

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
@WebServlet(name = "DeleteUser", urlPatterns = {"/DeleteUser",})
public class DeleteUser extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        //get new user details
        int buttonpressed = Integer.parseInt(request.getParameter("submitbutt"));
        int userid = buttonpressed;
        
        HttpSession session = request.getSession();
        AllUsersModel user = new AllUsersModel(); // This class contains methods for user queries
        boolean matched = false;
        matched = user.deleteUser(userid);
        
        
        if (matched) 
        {  
            RequestDispatcher rd = request.getRequestDispatcher("/adminoptions.jsp");
            rd.forward(request, response);
        } 
        else{
            RequestDispatcher rd = request.getRequestDispatcher("/viewusers.jsp");
            rd.forward(request, response);
        }
    
    }
}
