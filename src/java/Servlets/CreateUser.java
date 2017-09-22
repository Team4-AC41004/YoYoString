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
@WebServlet(name = "CreateUser", urlPatterns = {"/CreateUser",})
public class CreateUser extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        //get new user details
        int userid = Integer.parseInt(request.getParameter("userid"));
        String password = request.getParameter("password");
        int isadmin = Integer.parseInt(request.getParameter("isadmin"));
        int outletref = Integer.parseInt(request.getParameter("outletref"));  
        
        HttpSession session = request.getSession();
        AllUsersModel user = new AllUsersModel(); // This class contains methods for user queries
        
        boolean sanetizeCheck = checkInput(password);
        boolean matched = false;
        
        matched = user.createUser(userid, password, isadmin, outletref);
        
        if (matched) 
        {  
            session.setAttribute("created", true);
            RequestDispatcher rd = request.getRequestDispatcher("/adminoptions.jsp");
            rd.forward(request, response);
        } 
        else{
            session.setAttribute("created", false);
            RequestDispatcher rd = request.getRequestDispatcher("/createuser.jsp");
            rd.forward(request, response);
        }
        
        
    }
    
        private boolean  checkInput (String password){
        char c;
        for (int i=1; i<password.length(); i++){
            c=password.charAt(i);
            
            if (c=='"'|| c==')'){
                return false;
            }
        }
        return true;
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
        RequestDispatcher rd = request.getRequestDispatcher("/createuser.jsp");
        rd.forward(request,response);
    }
    
}
