/*
 * Don't change this. It's a template, so copy paste and adjust for your needs.
*/

package Beans;
import java.util.Date; // Deprecated ... ?
import java.text.DateFormat;
import java.text.SimpleDateFormat;
/**
 * A Bean is a template Class to hold Data that you specify in it. The Model retrieves Data from the Database and stores it in Beans.
 * @author Philipp
 */
public class BookWormBean {
     
    // Example showing all Database entries. Private, as only intended to be modified via public Get/Set below.
    //private DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); // Date deprecated...?
    private Date   dateAndTime;             // DB: DateAndTime of datatype DATETIME (= YYYY-MM-DD HH:MM:SS) example: 2017-08-13 23:59:00
    private int    outletRef   = 0;         // DB: OutletRef of datatype INT
    private String outletName  = "";        // DB: OutletName of datatype VARCHAR
    private String userID      = "";        // DB: UserID of datatype VARCHAR
    private String transactionType = "";    // DB: TransactionType of datatype VARCHAR
    // cashSpent + discount = total
    private float  cashSpent   = 0;         // DB: CashSpent of datatype DECIMAL
    private float  discount    = 0;         // DB: Discount of datatype DECIMAL
    private float  total       = 0;         // DB: Total of datatype DECIMAL
    private int    transactions= 0;
    // DB: TransactionID of type INT set to autoincrement. Just for your information that this exists.
    
   
    // Getter and Setter functions to encapsulate data fields (Don't allow outside classes/methods to directly access fields).
    public void setDateAndTime(Date newDateAndTime) { dateAndTime = newDateAndTime; }
    public Date getDateAndTime() { return dateAndTime; }
    
    public void setOutletRef(int newOutletRef) { outletRef = newOutletRef; }
    public int  getOutletRef() { return outletRef; }
    
    public void   setOutletName(String newOutletName) { outletName = newOutletName; }
    public String getOutletName() { return outletName; }
    
    public void   setUserID(String newUserID) { userID = newUserID; }
    public String getUserID() { return userID; }
    
    public void   setTransactionType(String newTransactionType) { transactionType = newTransactionType; }
    public String getTransactionType() { return transactionType; }
    
    public void  setCashSpent(float newCashSpent) { cashSpent = newCashSpent; }
    public float getCashSpent() { return cashSpent; }
    
    public void  setDiscount(float newDiscount) { discount = newDiscount; }
    public float getDiscount() { return discount; }
    
    public void  setTotal(float newTotal) { total = newTotal; }
    public float getTotal() { return total; }
    
    
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