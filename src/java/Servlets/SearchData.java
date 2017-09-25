/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Models.AllDataModel;
import Models.AllUsersModel;
import Models.testModel;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchData", urlPatterns = {"/SearchData",})
public class SearchData extends HttpServlet{
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        //get search details
        HttpSession session = request.getSession();
        
        String startdateStr = null;
        String enddateStr = null;
        String userid = null;
        String location= null;
        Date startdate = new Date();
        Date enddate = new Date();
        
        if (request.getParameter("startdatepicker")!=null){
            startdateStr = request.getParameter("startdatepicker");
        }
        else{
           startdateStr="!" ;
        }
        if (request.getParameter("enddatepicker")!=null){
            enddateStr = request.getParameter("enddatepicker");
        }
        else{
            enddateStr="!";
        }
        
        if (request.getParameter("useridinput")!=null){
                userid = request.getParameter("useridinput");
                //if (checkInput(userid)==false){
                //    userid="!";
                //}
        }
        else{
            userid="!";
        }
        if (request.getParameter("select")!=null){
            location = request.getParameter("select");
        }   
        else{
            location="!";
        }
        System.out.println("startdate in servlet: " +startdate);
        System.out.println("location in servlet: " +location);
        System.out.println("userid in servlet: " +userid);
        
        AllDataModel data = new AllDataModel(); // This class contains methods for user queries
        boolean matched = false;
        try{
            //data.getJSONObjectList(startdate, enddate, userid, location);
            request.setAttribute("JSONListAttribute", data.getJSONObjectList(startdateStr, enddateStr, userid, location) ); 
            matched = true;
        }catch(Exception e){
            System.out.println("Error getting search data.");
            matched = false;
        }
        
        System.out.println("json objects made " + matched);
        
        if (matched) 
        {  
            //RequestDispatcher rd = request.getRequestDispatcher("/viewsearchdata.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("/viewalldata.jsp");
            rd.forward(request, response);
        } 
        else{
            RequestDispatcher rd = request.getRequestDispatcher("/viewalldata.jsp");
            rd.forward(request, response);
        }         
    }
    
    public boolean checkInput(String input){
        for (int i=0; i<input.length(); i++)
        {
            if(input.charAt(i)!='0' || input.charAt(i)!='1' || input.charAt(i)!='2' || input.charAt(i)!='3' || input.charAt(i)!='4' || input.charAt(i)!='5' || input.charAt(i)!='6' || input.charAt(i)!='7' || input.charAt(i)!='8' || input.charAt(i)!='9'){
                return false;
            }
        }
        return true;
    }

}
