/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;
import java.util.Date;
/**
 *
 * @author Philipp
 */
public class testBean {
     
    Date   dateAndTime;
    String outletName  = "";
    int    outletRef   = 0;
    float  cashSpent   = 0;
    
    public void   setDateAndTime(Date newDateAndTime) { dateAndTime = newDateAndTime; }
    public Date getDateAndTime() { return dateAndTime; }
    
    public void   setOutletName(String newOutletName) { outletName = newOutletName; }
    public String getOutletName() { return outletName; }
    
    public void setOutletRef(int newOutletRef) { outletRef = newOutletRef; }
    public int  getOutletRef() { return outletRef; }
    
    public void  setCashSpent(float newCashSpent) { cashSpent = newCashSpent; }
    public float getCashSpent() { return cashSpent; }
}
/* 


import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

private String getDateTime() {
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    return dateFormat.format(date);
}


*/