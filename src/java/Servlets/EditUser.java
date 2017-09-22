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
@WebServlet(name = "EditUser", urlPatterns = {"/EditUser",})
public class EditUser extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        //get new user details
        int buttonpressed = Integer.parseInt(request.getParameter("submitbutt"));
        System.out.println("NOTICE ME: " + buttonpressed);
        
        String password=null;
        
        int userid = buttonpressed;    
        int isadmin = Integer.parseInt(request.getParameter("isadmin"+buttonpressed));
        int outletref = Integer.parseInt(request.getParameter("outletref"+buttonpressed)); 
        
        if (request.getParameter("password"+buttonpressed)!=null){
            password = request.getParameter("password"+buttonpressed);
            boolean sanetizeCheck = checkInput(password);
        }
        
        HttpSession session = request.getSession();
        AllUsersModel user = new AllUsersModel(); // This class contains methods for user queries
        boolean matched = false;
        matched = user.editUser(userid, password, isadmin, outletref);
        
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
    
    
}
