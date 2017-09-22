/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Models.LoginModel;
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
@WebServlet(name = "ViewUsers", urlPatterns = {"/ViewUsers",})
public class ViewUsers extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        LoginModel loginModel = new LoginModel(); 
        AllUsersModel usersModel = new AllUsersModel(); 
        HttpSession session = request.getSession();
        
        boolean matched = false;
        
            try{
                session.setAttribute("users", usersModel.viewUsers());
                
                matched=true;
            }catch(NullPointerException e) {
                matched=false;
            }
     
            
            RequestDispatcher rd = request.getRequestDispatcher("/viewusers.jsp");
            rd.forward(request, response);
         
    }
    
    /** 
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {    
        RequestDispatcher rd = request.getRequestDispatcher("/viewusers.jsp");
        rd.forward(request,response);
    }
    
}
