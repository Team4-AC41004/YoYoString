/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Models.LoginModel;
import Beans.LoggedIn;

import java.util.Arrays;
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
@WebServlet(name = "Login", urlPatterns = {"/Login",})
public class Login extends HttpServlet {
    
    //Redirected to 'main' if login is successful.
    //Redirected to 'login' if login is not successful.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        int userid = Integer.parseInt(request.getParameter("userid"));
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        LoginModel loginModel = new LoginModel(); // This class contains main logic of the feature.
        
        boolean sanetizeCheck = checkInput(password);
        boolean matched = false;
        Object[] userdata = new Object[2];
        
        if (sanetizeCheck){
            try{
                //userdata = (loginModel.authenticateLogin(userid, password)).clone();  
                userdata = Arrays.copyOf(loginModel.authenticateLogin(userid, password), 2);
                
                matched=true;
            }catch(NullPointerException e) {
                matched=false;
            }
            
            //userdata = (loginModel.authenticateLogin(userid, password)).clone();    
        }
        
        if (matched != false) 
        {
            LoggedIn login = new LoggedIn();
            login.setLoggedin();
            login.setUserid(userid);
            
            //not admin
            if ((int) userdata[1] == 0){
                login.setOutletRef((int)userdata[0]);
            }
            //admin
            else{
                login.setIsAdmin(1);
            }
            
            session.setAttribute("loggedin", login);
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        } 
        else 
        {
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }
    }
    
     /** Check is password has suspicious characters.
     * @param string password
     * @return boolean
     */
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
        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
        rd.forward(request,response);
    }
    
}
