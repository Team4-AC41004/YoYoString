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
        String location = null;
        String[] locationArray = null;
        Date startdate = new Date();
        Date enddate = new Date();
        
        ///////////////////////////////GET CUSTOM SEARCH INPUTS///////////////////////////
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
                if (checkInput(userid)==false){
                   userid="!";
                }
        }
        else{
            userid="!";
        }
        if (request.getParameter("select")!=null){
            locationArray = new String[ request.getParameterValues("select").length];
            locationArray = request.getParameterValues("select");
        }   
        else{
            locationArray = new String[1];
            locationArray[0] = "!";
        }
        
        ///////////////////////////////GET CUSTOM SEARCH INPUTS///////////////////////////
        
        String[] attributes = new String[10];
        int[] attributesIntArray = new int[10];
        int count = 0;
        
        ///////////////////////GET GRAPH INPUTS////////////////////
        if (request.getParameter("dateandtimeCHK")!=null){
            attributes[count] = request.getParameter("dateandtimeCHK");
            count++;         
            attributesIntArray[0] = 1;
        }
        else{
            attributesIntArray[0] = 0;
        }
        if (request.getParameter("outletreferenceCHK")!=null){
                attributes[count] = request.getParameter("outletreferenceCHK");
                count++;  
                attributesIntArray[1] = 1;
        }
        else{
            attributesIntArray[1] = 0;
        }
        if (request.getParameter("outletnameCHK")!=null){
            attributes[count] = request.getParameter("outletnameCHK");
            count++;  
            attributesIntArray[2] = 1;
        }
        else{
            attributesIntArray[2] = 0;
        }
        if (request.getParameter("useridCHK")!=null){
            attributes[count] = request.getParameter("useridCHK");
            count++;  
            attributesIntArray[3] = 1;
        }
        else{
            attributesIntArray[3] = 0;
        }
        if (request.getParameter("transactiontypeCHK")!=null){
            attributes[count] = request.getParameter("transactiontypeCHK");
            count++;     
            attributesIntArray[4] = 1;
        }
        else{
            attributesIntArray[4] = 0;
        }
        if (request.getParameter("cashspentCHK")!=null){
            attributes[count] = request.getParameter("cashspentCHK");
            count++;   
            attributesIntArray[5] = 1;
        }
        else{
            attributesIntArray[5] = 0;
        }
        if (request.getParameter("dateandtimeCHK")!=null){
            attributes[count] = request.getParameter("dateandtimeCHK");
            count++;    
            attributesIntArray[6] = 1;
        }
        else{
            attributesIntArray[6] = 0;
        }
        if (request.getParameter("discountCHK")!=null){
            attributes[count] = request.getParameter("discountCHK");
            count++;
            attributesIntArray[7] = 1;
        }
        else{
            attributesIntArray[7] = 0;
        }
        if (request.getParameter("totalCHK")!=null){
            attributes[count] = request.getParameter("totalCHK");
            count++;   
            attributesIntArray[8] = 1;
        }
        else{
            attributesIntArray[8] = 0;
        }
        if (request.getParameter("transactionidCHK")!=null){
            attributes[count] = request.getParameter("transactionidCHK");
            count++;  
            attributesIntArray[9] = 1;
        }
        else{
            attributesIntArray[9] = 0;
        }
        
        String[] attributesReady = new String[count];
        
        if(count==0){
            attributesReady = new String[1];
        }else{
            attributesReady = new String[count];
        }
        
        for (int i=0; i<count; i++){
            attributesReady[i] = attributes[i];        
        }       
        ///////////////////////GET GRAPH INPUTS////////////////////
        
        AllDataModel data = new AllDataModel(); // This class contains methods for user queries
        boolean matched = false;
        try{
            request.setAttribute("JSONListAttribute", data.getJSONObjectList(startdateStr, enddateStr, userid, locationArray) ); 
            request.setAttribute("attributestoshow", attributesReady);
            request.setAttribute("attributestoshowINT", attributesIntArray);
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
            if (input.matches("[0-9]+") && input.length() > 2) {
                return true;
            }
            else{
                return false;
            }
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
        RequestDispatcher rd = request.getRequestDispatcher("/viewalldata.jsp");
        rd.forward(request,response);
    }

}
