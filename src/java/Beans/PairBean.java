
package Beans;

/**
 *
 * @author Philipp
 */
public class PairBean {
    int storeVisits  = 0;
    String storeName = "";
    
    public void setStoreVisits(int newStoreVisits) { storeVisits = newStoreVisits; }
    public int  getStoreVisits() { return storeVisits; }
    
    public void incrementStoreVisits(){ storeVisits += 1; }
    
    public void   setStoreName(String newStoreName) { storeName = newStoreName; }
    public String getStoreName() { return storeName; }
}
