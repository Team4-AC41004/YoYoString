/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author Admin
 */
public class LoggedIn {
    
    boolean loggedin = false;
    int userid = 0;
    int outletref = 0;
    int isadmin = 0;
    
    //initialisation
    public void LoggedIn(){
    }
    
    //methods
    
    public void setUserid(int id){
        this.userid = id;
    }
    public int getUserid(){
        return userid;
    }
   
    public void setLoggedin(){
        loggedin = true;
    }
    public void setLoggedout(){
        loggedin = false;
        isadmin = 0;
        outletref = 0;
        userid=0;
    }
    
    public void setLoginState(boolean loggedin){
        this.loggedin = loggedin;
    }
    public boolean getLoggedin(){
        return loggedin;
    }
    
    public void setOutletRef(int outletref){
        this.outletref = outletref;
    }
    
    public int getOutletRef(){
        return outletref;
    }
    
    public void setIsAdmin(int isadmin){
        this.isadmin = isadmin;
    }
    
    public int getIsAdmin(){
        return isadmin;
    }  
}
