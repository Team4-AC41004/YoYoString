/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Models.AllDataModel;
import Models.AllUsersModel;
import Models.testModel;
import Models.VaDModel;
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
 * ===============
 * === SERVLET ===
 * ===============
 * @author Admin
 */
@WebServlet(name = "SearchData", urlPatterns = {"/SearchData",})
public class SearchData extends HttpServlet{
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        // =========================
        // =====      POST     =====
        // =========================
        
        //get search details
        HttpSession session = request.getSession();
        
        String startdateStr = null;
        String enddateStr = null;
        String userid = null;
        String location = null;
        String[] locationArray = null;
        Date startdate = new Date();
        Date enddate = new Date();
        
        // =======================
        // === Read User Input ===
        // =======================
        if (request.getParameter("startdatepicker") != null){
            startdateStr = request.getParameter("startdatepicker");
        }
        else{ startdateStr = "!" ; } // ! means not selected.
        
        if (request.getParameter("enddatepicker") != null){
            enddateStr = request.getParameter("enddatepicker");
        }
        else{ enddateStr = "!"; }
        
        if (request.getParameter("useridinput") != null){
                userid = request.getParameter("useridinput");
                if (checkInput(userid) == false){
                   userid = "!";
                }
        }
        else { userid = "!"; }
        
        // select is Outlet Name
        if (request.getParameter("select") != null){
            locationArray = new String[ request.getParameterValues("select").length];
            locationArray = request.getParameterValues("select");
        }   
        else{
            locationArray = new String[1];
            locationArray[0] = "!";
        }
        
        // Get User Input (Checkboxes)
        
        String[] attributes      = new String[10];
        int[] arrayThatShowsCheckboxActiveZeroOrOne = new int[9];
        int amountOfCheckboxesSelected = 0;
        
        if (request.getParameter("dateandtimeCHK") != null){
            attributes[amountOfCheckboxesSelected] = request.getParameter("dateandtimeCHK");
            amountOfCheckboxesSelected++;         
            arrayThatShowsCheckboxActiveZeroOrOne[0] = 1;
        }
        else { arrayThatShowsCheckboxActiveZeroOrOne[0] = 0; }
        
        if (request.getParameter("outletreferenceCHK") != null){
                attributes[amountOfCheckboxesSelected] = request.getParameter("outletreferenceCHK");
                amountOfCheckboxesSelected++;  
                arrayThatShowsCheckboxActiveZeroOrOne[1] = 1;
        }
        else { arrayThatShowsCheckboxActiveZeroOrOne[1] = 0; }
        
        if (request.getParameter("outletnameCHK") != null){
            attributes[amountOfCheckboxesSelected] = request.getParameter("outletnameCHK");
            amountOfCheckboxesSelected++;  
            arrayThatShowsCheckboxActiveZeroOrOne[2] = 1;
        }
        else { arrayThatShowsCheckboxActiveZeroOrOne[2] = 0; }
        
        if (request.getParameter("useridCHK") != null){
            attributes[amountOfCheckboxesSelected] = request.getParameter("useridCHK");
            amountOfCheckboxesSelected++;  
            arrayThatShowsCheckboxActiveZeroOrOne[3] = 1;
        }
        else { arrayThatShowsCheckboxActiveZeroOrOne[3] = 0; }
        
        if (request.getParameter("transactiontypeCHK") != null){
            attributes[amountOfCheckboxesSelected] = request.getParameter("transactiontypeCHK");
            amountOfCheckboxesSelected++;     
            arrayThatShowsCheckboxActiveZeroOrOne[4] = 1;
        }
        else { arrayThatShowsCheckboxActiveZeroOrOne[4] = 0; }
        
        if (request.getParameter("cashspentCHK")!=null){
            attributes[amountOfCheckboxesSelected] = request.getParameter("cashspentCHK");
            amountOfCheckboxesSelected++;   
            arrayThatShowsCheckboxActiveZeroOrOne[5] = 1;
        }
        else{
            arrayThatShowsCheckboxActiveZeroOrOne[5] = 0;
        }
        if (request.getParameter("discountCHK")!=null){
            attributes[amountOfCheckboxesSelected] = request.getParameter("dateandtimeCHK");
            amountOfCheckboxesSelected++;    
            arrayThatShowsCheckboxActiveZeroOrOne[6] = 1;
        }
        else{
            arrayThatShowsCheckboxActiveZeroOrOne[6] = 0;
        }
        /*if (request.getParameter("disCHK")!=null){
            attributes[amountOfCheckboxesSelected] = request.getParameter("disamountOfCheckboxesSelectedCHK");
            amountOfCheckboxesSelected++;
            arrayThatShowsCheckboxActiveZeroOrOne[7] = 1;
        }
        else{
            arrayThatShowsCheckboxActiveZeroOrOne[7] = 0;
        } */
        if (request.getParameter("totalCHK")!=null){
            attributes[amountOfCheckboxesSelected] = request.getParameter("totalCHK");
            amountOfCheckboxesSelected++;   
            arrayThatShowsCheckboxActiveZeroOrOne[7] = 1;
        }
        else{
            arrayThatShowsCheckboxActiveZeroOrOne[7] = 0;
        }
        if (request.getParameter("transactionidCHK")!=null){
            attributes[amountOfCheckboxesSelected] = request.getParameter("transactionidCHK");
            amountOfCheckboxesSelected++;  
            arrayThatShowsCheckboxActiveZeroOrOne[8] = 1;
        }
        else{
            arrayThatShowsCheckboxActiveZeroOrOne[8] = 0;
        }
        
        String[] arrayWithSelectedCheckboxes = new String[amountOfCheckboxesSelected];
        
        if(amountOfCheckboxesSelected == 0){
            arrayWithSelectedCheckboxes = new String[1];
        }else{
            arrayWithSelectedCheckboxes = new String[amountOfCheckboxesSelected];
        }
        
        for (int i=0; i < amountOfCheckboxesSelected; i++){
            arrayWithSelectedCheckboxes[i] = attributes[i];        
        }       
        // === GET GRAPH INPUTS ===
        
        // This class contains methods for user queries
        AllDataModel allDataModelObj = new AllDataModel(); 
        
        try
        {
            String fuckingStringZeroOrOne = "";
            for (int o = 0; o < arrayThatShowsCheckboxActiveZeroOrOne.length; o++)
            { 
                System.out.println("PENGULOL: arrayThatShowsCheckboxActiveZeroOrOne["+o+"]:" + arrayThatShowsCheckboxActiveZeroOrOne[o]); 
                fuckingStringZeroOrOne += Integer.toString(arrayThatShowsCheckboxActiveZeroOrOne[o]);
                System.out.println("oh the string: " + fuckingStringZeroOrOne);
            }
            
            request.setAttribute("requestedCustomDataAttribute", allDataModelObj.getJSONObjectList(startdateStr, enddateStr, userid, locationArray) ); 
            //request.setAttribute("arrayWithSelectedCheckboxesAttribute", arrayWithSelectedCheckboxes); // Not currently working. TODO
            
            //request.setAttribute("attributeArrayThatShowsCheckboxActiveZeroOrOne", arrayThatShowsCheckboxActiveZeroOrOne); //fuckingStringZeroOrOne
            request.setAttribute("attributeArrayThatShowsCheckboxActiveZeroOrOne", fuckingStringZeroOrOne);
            
            System.out.println("Post in SearchData" + arrayThatShowsCheckboxActiveZeroOrOne[0]);
        }catch(Exception e){ System.out.println("Catch in SearchData.java luls."); }
        
        RequestDispatcher rd = request.getRequestDispatcher("/viewalldata.jsp");
        rd.forward(request, response);
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
        // =========================
        // ======     GET     ======
        // =========================
      /*  System.out.println("Get in SearchData.java");
        
        VaDModel VaDModelObj = new VaDModel();
        try 
        {
            // Retrieve the attribute that holds all data which was retrieved by the Model from the Database.
            request.setAttribute("JSONListAttribute", VaDModelObj.getJSONObjectList() ); 
        } 
        catch (SQLException ex) { Logger.getLogger(VaDServlet.class.getName()).log(Level.SEVERE, null, ex); }
        
        RequestDispatcher rd = request.getRequestDispatcher("/viewalldata.jsp");
        rd.forward(request, response); */
        
        
        
        
        
        
        
        // This class contains methods for user queries
        AllDataModel allDataModelObj = new AllDataModel(); 
        String[] myarray = new String[1];
        myarray[0]="!";
        
        try
        {
            request.setAttribute("requestedCustomDataAttribute", allDataModelObj.getJSONObjectList("!", "!", "!", myarray) );
            request.setAttribute("attributeArrayThatShowsCheckboxActiveZeroOrOne", "000000000");
            System.out.println("Try in Get in SearchData.java");
        }
        catch(Exception e){ System.out.println("Error. (Catch in SearchData.java)"); } 

        
        RequestDispatcher rd = request.getRequestDispatcher("/viewalldata.jsp");
        rd.forward(request,response);
    }

}
