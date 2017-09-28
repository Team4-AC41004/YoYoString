<%-- 
    Document   : customerinfo
    Created on : 26-Sep-2017, 10:08:44
    Author     : Chris + Philipp
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="Util.DBConnection"%>
<%@page import="Beans.PairBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <title>Customer Info</title>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.2/jspdf.plugin.autotable.js"></script>
        <link rel="stylesheet" href="css/index.css"/>

    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        <% String ID = request.getParameter("id");%><br/>
        <a class="btn btn-success" style="position: fixed; z-index: 9999;"href="javascript:genPDF()">Download PDF</a>  

        <div class="container" style="margin-top: 2.5%;">
            <div class="row">
                <div class="col">
                    <h1 class="display-4">Viewing Details for User <%=ID%>:</h1>

                </div>
            </div>
            <div class="row">
                <div class="col" id="toggle2" style="cursor: pointer;">
                    <h2> Member of Tribes: </h2><p class="text-muted">(Click to Show/Hide)</p>
                    <hr class="my-2"/>
                </div>
            </div>
            <div class="row" id="togglesection2">
                <%
                    Connection conn = null;
                    conn = DBConnection.createConnection();
                    Statement stmt = null;
                    stmt = conn.createStatement();
                    String query = "select UserID from nightowls WHERE UserID='" + ID + "';";
                    ResultSet rs = null;
                    System.out.println("Query created.");
                    rs = stmt.executeQuery(query);
                    while (rs.next()) {
                        String iddb = rs.getString("UserID");
                        System.out.println(iddb);
                        System.out.println(ID);
                        if (iddb != null) {
                            System.out.println("ADDING BADGE");
                %>
                <div class="col-2 badge">
                    <a href="NightOwls"><img src="img/nightowl.png" class="img-fluid"/></a>
                    <span> <%=ID%> is a Nightowl!</span>
                </div>
                <%} else {
                        }
                    }
                    rs = null;
                    String query2 = "select UserID from daybreakers WHERE UserID='" + ID + "';";
                    System.out.println("Query created.");
                    rs = stmt.executeQuery(query2);
                    while (rs.next()) {
                        String iddb = rs.getString("UserID");
                        System.out.println(iddb);
                        System.out.println(ID);
                        if (iddb != null) {
                            System.out.println("ADDING BADGE");
                %>
                <div class="col-2 badge">
                    <a href="DayBreakers"><img src="img/daybreakers.png" class="img-fluid"/></a>
                    <span> <%=ID%> is a Daybreaker! </span>
                </div>
                <%} else {
                        }
                    }
                    rs = null;
                    String query3 = "select UserID from bookworms WHERE UserID='" + ID + "';";
                    System.out.println("Query created.");
                    rs = stmt.executeQuery(query3);
                    while (rs.next()) {
                        String iddb = rs.getString("UserID");
                        System.out.println(iddb);
                        System.out.println(ID);
                        if (iddb != null) {
                            System.out.println("ADDING BADGE");
                %>
                <div class="col-2 badge">
                    <a href="bookworms"><img src="img/bookworm.png" class="img-fluid"/></a>
                    <span> <%=ID%> is a Bookworm! </span>
                </div>
                <%} else {
                        }
                    }
                    rs = null;
                    String query4 = "select UserID from medicalmarvels WHERE UserID='" + ID + "';";
                    System.out.println("Query created.");
                    rs = stmt.executeQuery(query4);
                    while (rs.next()) {
                        String iddb = rs.getString("UserID");
                        System.out.println(iddb);
                        System.out.println(ID);
                        if (iddb != null) {
                            System.out.println("ADDING BADGE");
                %>
                <div class="col-2 badge">
                    <a href="MedicalMarvels"><img src="img/medicalmarvels.png" class="img-fluid"/></a>
                    <span> <%=ID%> is a Medical Marvel! </span>
                </div>
                <%} else {
                        }
                    }
                    rs = null;
                    String query5 = "select UserID from partyanimals WHERE UserID='" + ID + "';";
                    System.out.println("Query created.");
                    rs = stmt.executeQuery(query5);
                    while (rs.next()) {
                        String iddb = rs.getString("UserID");
                        System.out.println(iddb);
                        System.out.println(ID);
                        if (iddb != null) {
                            System.out.println("ADDING BADGE");
                %>
                <div class="col-2 badge">
                    <a href="PartyAnimals"><img src="img/partyanimal.png" class="img-fluid"/></a>
                    <span> <%=ID%> is a Party Animal! </span>
                </div>
                <%} else {
                        }
                    }
                    rs = null;
                    String query6 = "select UserID from premierpatriots WHERE UserID='" + ID + "';";
                    System.out.println("Query created.");
                    rs = stmt.executeQuery(query6);
                    while (rs.next()) {
                        String iddb = rs.getString("UserID");
                        System.out.println(iddb);
                        System.out.println(ID);
                        if (iddb != null) {
                            System.out.println("ADDING BADGE");
                %>
                <div class="col-2 badge">
                    <a href="PremierPatriots"><img src="img/premierpatriots.png" class="img-fluid"/></a>
                    <span> <%=ID%> is a Party Animal! </span>
                </div>
                <%} else {
                        }
                    }
                    rs = null;
                %>
            </div>
            <hr class="my-2"/>
            <div class="row">
                <div class="col" id="toggle" style="cursor: pointer;">
                    <h2> Transactions for User: </h2><p class="text-muted">(Click to Show/Hide)</p>
                    <hr class="my-2"/>
                </div>
            </div>


            <div class="row" id="togglesection">
                <div class="col">
                    <table class="table table-hover" id="stores">
                        <thead class="thead-dark">
                            <tr>
                                <th>First Transaction</th>
                                <th>Transactions</th>
                                <th>Average spent per Transaction</th>
                                <th>Total Cash Spent</th>
                                <th>Total Discount</th>
                                <th>Cash + Discount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                stmt = null;
                                stmt = conn.createStatement();
                                String query7 = "SELECT * FROM disbursals WHERE UserID='" + ID + "' LIMIT 0, 500;";
                                ResultSet rs2 = null;
                                rs = stmt.executeQuery(query7);
                                int count = 5000;
                                int inc = 0;
                                float totalCashSpent = 0;
                                int totalAmountOfTransactions = 0;
                                float totalDiscountGotten = 0;
                                float totalAmount = 0;
                                float avgSpent = 0;
                                boolean gotFirstDate = false;
                                Date date = null;
                                List<String> outletsUsed = new LinkedList<String>();
                                //Map<Integer,String> mapOutletsUsed = new HashMap<Integer,String>();
                                List<PairBean> outletsUsedBeans = new LinkedList<PairBean>();
                                List<PairBean> outletsUsedBeansDescOrder = new LinkedList<PairBean>();
                          %><tr><%    
                                while (rs.next() && inc < count) 
                                {
                                    // Get the first date.
                                    if (!gotFirstDate){ 
                                        date = rs.getDate("DateAndTime"); 
                                        gotFirstDate = true;
                                    }
                                    
                                    //int id = rs.getInt("OutletRef");
                                    // Add Outletname if not yet added.
                                    String name = rs.getString("OutletName");
                                    // Loop through List and see if it's already in the List.
                                 /*   boolean alreadyExists = false; // Assume it's not in list.
                                    for (int i = 0; i < outletsUsed.size(); i++) // Loop through entire list.
                                    {
                                        if (outletsUsed.get(i).equals(name)){ // if the name is found in the List, set true to say we already have it.
                                            alreadyExists = true; 
                                            break;
                                        }
                                    }
                                    if (!alreadyExists) { outletsUsed.add(name); } */
                                    
                                    // Bean version. outletsUsedBeans
                                    boolean alreadyExists = false; // Assume it's not in list.
                                    for (int i = 0; i < outletsUsedBeans.size(); i++) // Loop through entire list.
                                    {
                                        if (outletsUsedBeans.get(i).getStoreName().equals(name)){ // if the name is found in the List, set true to say we already have it.
                                            alreadyExists = true;
                                            // Increment amount of times user went to this store.
                                            outletsUsedBeans.get(i).incrementStoreVisits();// setStoreVisits( outletsUsedBeans.get(i).getStoreVisits() + 1 );
                                            break;
                                        }
                                    }
                                    if (!alreadyExists) { // store not saved in List yet, so add it
                                        PairBean pairBeanObj = new PairBean();
                                        pairBeanObj.setStoreName(name);
                                        pairBeanObj.setStoreVisits(1);
                                        outletsUsedBeans.add(pairBeanObj);
                                    }
                                    
                                    totalCashSpent      += rs.getFloat("CashSpent");
                                    totalDiscountGotten += rs.getFloat("Discount");
                                    inc += 1;
                                    
                                    totalAmountOfTransactions += 1;
                                }
                                totalAmount = totalCashSpent+totalDiscountGotten;
                                avgSpent = totalCashSpent / totalAmountOfTransactions;
                                // Format £ amounts to 2 decimal places.
                            for (int a=0; a < 4; a++)
                            {   float value = 0;
                                if(a==0) { value = totalCashSpent; }
                                if(a==1) { value = totalDiscountGotten; }
                                if(a==2) { value = totalAmount; }
                                if(a==3) { value = avgSpent; }
                                int pow = 100;
                                float tmp = value * pow;
                                float tmpSub = tmp - (int) tmp;

                                if(a==0) 
                                { totalCashSpent = ( (float) ( (int) (
                                                    value >= 0
                                                    ? (tmpSub >= 0.5f ? tmp + 1 : tmp)
                                                    : (tmpSub >= -0.5f ? tmp : tmp - 1)
                                                    ) ) ) / pow; 
                                }
                                if(a==1) { totalDiscountGotten = ( (float) ( (int) (
                                                    value >= 0
                                                    ? (tmpSub >= 0.5f ? tmp + 1 : tmp)
                                                    : (tmpSub >= -0.5f ? tmp : tmp - 1)
                                                    ) ) ) / pow; }
                                if(a==2) { totalAmount = ( (float) ( (int) (
                                                    value >= 0
                                                    ? (tmpSub >= 0.5f ? tmp + 1 : tmp)
                                                    : (tmpSub >= -0.5f ? tmp : tmp - 1)
                                                    ) ) ) / pow; } 
                                if(a==3) { avgSpent = ( (float) ( (int) (
                                                    value >= 0
                                                    ? (tmpSub >= 0.5f ? tmp + 1 : tmp)
                                                    : (tmpSub >= -0.5f ? tmp : tmp - 1)
                                                    ) ) ) / pow; } 
                                
                            } 

                            // Order the List of Outlets used. outletsUsedBeansDescOrder
                            
                            // Loop through all -> take highest, add in new. Again until list empty.
                            
                            while (!outletsUsedBeans.isEmpty()) // Loop through all outlets we have saved.
                            {
                                //System.out.println("=== New While Loop ===");
                            
                                // Loop through all and extract highest.
                                int highestIndex = -1;
                                for (int i=0; i < outletsUsedBeans.size(); i++)
                                {
                                    // Set first as highest.
                                    if(highestIndex == -1) {highestIndex = i;}
                                    // Now check if 2nd/3rd etc is higher and set them as highest if they are
                                    //System.out.println("outletsUsedBeans.get(" +i+ ").getStoreVisits(): " + outletsUsedBeans.get(i).getStoreVisits()); 
                                    //System.out.println("outletsUsedBeans.get(" +highestIndex+ ").getStoreVisits():highestIndex " + outletsUsedBeans.get(highestIndex).getStoreVisits()); 
                                    if(outletsUsedBeans.get(i).getStoreVisits() > outletsUsedBeans.get(highestIndex).getStoreVisits())
                                    { 
                                        // is higher
                                        //System.out.println("new highestIndex = " + i);
                                        highestIndex = i;
                                    }
                                }
                                // Now we know index of highest storevisits.
                                // add to 2nd list
                                outletsUsedBeansDescOrder.add(outletsUsedBeans.get(highestIndex));
                                // remove it from first list.
                                outletsUsedBeans.remove(highestIndex);
                                
                            //System.out.println("outletsUsedBeans.isEmpty(): "+outletsUsedBeans.isEmpty());
                            } // end while()
                            // end order outlet list. outletsUsedBeans
                                %>
                                
                            <!-- Populate Table -->
                                <td scope="row"><%=date%></td>
                                <td><%=totalAmountOfTransactions%></td>
                                <td><%=avgSpent%>£</td>
                                <td><%=totalCashSpent%>£</td>
                                <td><%=totalDiscountGotten%>£</td>
                                <td><%=totalAmount%>£</td>
                            </tr>
                            <%  
                            conn.close();%>
                            
                        </tbody>
                    </table>
                    <table class="table table-hover" id="storesdata">
                        <thead class="thead-dark">
                            <tr>
                                <th>Store Used</th>
                                <th>How often</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                            <% 
                                for (int i=0; i < outletsUsedBeansDescOrder.size(); i++) 
                                {
                                 %> <tr> <%
                                     %><td class="storeid"> <%=outletsUsedBeansDescOrder.get(i).getStoreName()%></td>
                                    
                                      <td><%=outletsUsedBeansDescOrder.get(i).getStoreVisits()%></td> <%
                                 %> </tr> <%
                            %>

                                    
                                        
                                    
                              <%}%>
                                


                            <script>
                                $(".storeid").each(function () {
                                    var innertext = $(this).text();
                                    $(this).wrapInner("<a href=\"" + "StoreData?id=" + encodeURI(innertext) + "\"></a>");
                                });
                            </script>
                        </tbody>
                    </table>
                    <script>
                        $("#toggle").click(function () {
                            $("#togglesection").toggle("slow");
                        });
                        $("#toggle2").click(function () {
                            $("#togglesection2").toggle("slow");
                        });
                    </script>
                    
                </div>
                    <script type="text/javascript">
                        //code from https://stackoverflow.com/questions/23035858/export-html-table-to-pdf-using-jspdf#23056299
                        function genPDF() {
                            var doc = new jsPDF('p', 'pt');
                            var elem = document.getElementById("storesdata");
                            var elem2 = document.getElementById("stores");
                            var res = doc.autoTableHtmlToJson(elem, elem2);
                            doc.autoTable(res.columns, res.data);
                            doc.save("table.pdf");
                        }
                    </script>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vivus/0.4.2/vivus.min.js" integrity="sha256-QkfKcx3kugootBtJEPpTKDsWEneddME3kXPoT5o3Yic=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    </body>
</html>
