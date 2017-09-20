/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.User;
import Models.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author petersallai
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    private static String ADD_OR_UPDATE = "/users.jsp";
    private static String LIST_USERS = "/listusers.jsp";
    private UserDAO dao;
    
    public UserController()
    {
        dao = new UserDAO();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String forward = "";
        String action = request.getParameter("action");
        System.out.println("action============" + action);
        
        if (action.equalsIgnoreCase("delete"))
        {
            int userid = Integer.parseInt(request.getParameter("Userid"));
            dao.deleteUser(userid);
            forward = LIST_USERS;
            request.setAttribute("users", dao.selectAllUsers());
        }
        else if (action.equalsIgnoreCase("edit"))
        {
            int userid = Integer.parseInt(request.getParameter("Userid"));
            forward = ADD_OR_UPDATE;
            User user = dao.getUserByID(userid);
            request.setAttribute("user", user);
        }
        else if (action.equalsIgnoreCase("listUsers"))
        {
            forward = LIST_USERS;
            request.setAttribute("users", dao.selectAllUsers());
        }
        else
        {
            forward = ADD_OR_UPDATE;
        }
        
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        User user = new User();
        
        user.setPassword(request.getParameter("password"));
        user.setIsadmin(Integer.parseInt(request.getParameter("isadmin")));
        
        String userid = request.getParameter("userid");
        
        if (userid != null || userid.isEmpty())
        {
            dao.addUser(user);
        }
        else
        {
            user.setUserid(userid);
            dao.updateUser(user);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_USERS);
        request.setAttribute("users", dao.selectAllUsers());
        view.forward(request, response);
    }

}
