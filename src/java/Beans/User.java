/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author petersallai
 */
public class User {
    private String userid;
    private String password;
    private int isadmin;

    /**
     * @return the userid
     */
    public String getUserid() {
        return userid;
    }

    /**
     * @param userid the userid to set
     */
    public void setUserid(String userid) {
        this.userid = userid;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the isadmin
     */
    public int getIsadmin() {
        return isadmin;
    }

    /**
     * @param isadmin the isadmin to set
     */
    public void setIsadmin(int isadmin) {
        this.isadmin = isadmin;
    }
    
}
