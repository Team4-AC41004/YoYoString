<%-- 
    Document   : tribes
    Created on : 25-Sep-2017, 10:56:41
    Author     : Chris + Philipp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.NightOwlBean"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Arrays"%>
<%@page import="Util.DBConnection"%>
<%@page import="java.sql.*" %>
<%@page import="Beans.PairBean"%> <!-- need keep? (prob make new bean) -->
<%@page import="org.json.*" %>

<!DOCTYPE html>
<html>
    <head>
        <%long startTime = System.nanoTime();%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <title>NightOwls</title>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type ="text/javascript">
            google.charts.load('current', {'packages': ['table', 'corechart', 'charteditor']}); // table, corechart and can add more.
            google.charts.setOnLoadCallback(drawTable);
            function drawTable()
            {
                var data = new google.visualization.DataTable();
                // Order of Columns must be remembered below when atting rows.
                data.addColumn('string', 'User ID');

                // Get the Attribute which holds all data retrieved by Model.
                var jsonListOfDBdata = <%=request.getAttribute("JSONListAttribute")%>;
                
                for (var a = 0; a < jsonListOfDBdata.length; a++)
                {
                    data.addRows([[
                                    jsonListOfDBdata[a].UserID,
                                ]]);
                }
                var css1 = {
                    headerRow: 'row-head',
                    tableRow: 'row-table',
                    oddTableRow: 'row-table-odd',
                    selectedTableRow: 'row-table-select',
                    hoverTableRow: 'row-table-hover',
                    headerCell: 'cell-head',
                    tableCell: 'cell-table'
                };
                var table = new google.visualization.Table(document.getElementById('table_div'));
                table.draw(data, {width: '100%', height: '100%', allowHTML: 'true', columns: '', cssClassNames: 'css1', alternatingRowStyle: 'true'});


                $(".google-visualization-table-td").each(function () {
                    var innertext = $(this).text();
                    $(this).wrapInner("<a href=\"CustomerInfo?id=" + innertext + "\"></a>");
                });
                var NumofTribe = $('.google-visualization-table-td').length;
                console.log(NumofTribe);
                $('#numoftribe').text(NumofTribe);


                google.charts.setOnLoadCallback(drawChart);
                function drawChart() {
                  var perc = google.visualization.arrayToDataTable([
                    ['Tribes', 'User Counts'],
                    ['Night Owls',  NumofTribe],
                    ['All Users',  7877]
                  ]);

                var options = {
                  legend: 'label',
                  title: 'Percentage of Users',
                  pieSliceText: 'number',
                  slices: { 1: {offset:0.2},},
                  is3D:'true',
                  pieStartAngle: 135,
                };

                  var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                  chart.draw(perc, options);
                }
            }
        </script>
        <link rel="stylesheet" href="css/index.css"/>


    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        <% String ID = request.getParameter("id");%><br/> <!-- Need? -->
        <div class="container" style="margin-top: 2.5%;">
            <div class="row">
                <div class="col">
                    <h1 class="display-4">Night Owls have many transactions after 17:00</h1>
                    <hr class="my-2"/>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div id="table_div" style="height: 400px;">

                    </div>
                </div>

                <div class="col-9">
                    <div class="row">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th> Total Number of Nightowls </th>
                                    <th> Total Number of Users </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="numoftribe"> </td>
                                    <td id="numofusers">7877 </td> 
                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                    <th>

                                    </th>
                                    <th>

                                    </th>
                                </tr>
                            </thead>

                        </table>
                    </div>
                    <div class="row">
                        <div id="chart_div" style="width: 100%; height: 100%;">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 1 -->
            <%
                Connection conn = null;
                conn = DBConnection.createConnection();
                Statement stmt = null;
                stmt = conn.createStatement();
            %>
        <!-- /1 -->
        
        
        <hr class="my-2"/>
            <div class="row">
                <div class="col" id="toggle" style="cursor: pointer;">
                    <h2> Transactions by Nightowls in any Store:)</h2><p class="text-muted">(Click to Show/Hide)</p>
                    <hr class="my-2"/>
                </div>
            </div>
               
                        <%
                    // Huge ass For loop start
                    // Basically loop through every single user listed as Nightowl and then summate the results. List listOfJSONObjects = new LinkedList();
                    List listWithUserIDsWhoAreOwls = new LinkedList();
                    listWithUserIDsWhoAreOwls = (LinkedList)request.getAttribute("JSONListAttribute"); // This works. Actually it gets entire Nightowls table (but useless as has only 1st entry)
                    //System.out.println("123" + listWithUserIDsWhoAreOwls.size() );
            List listOfUserIDs = new LinkedList();
            for (int fuck = 0; fuck < listWithUserIDsWhoAreOwls.size(); fuck++)
            {        
                JSONObject jsonObj = (JSONObject)listWithUserIDsWhoAreOwls.get(fuck); //request.getAttribute("JSONListAttribute");
                
                listOfUserIDs.add( jsonObj.getString("UserID")   );
                //System.out.println("WTF JAVA: " + listOfUserIDs.get(fuck));
            }    
                    //System.out.println(jsonObj.getString("UserID") + "ASDF" + listOfUserIDs.get(0));
                    //System.out.println(jsonObj.getString("UserID") );
                    //JSONArray jarray = jsonObj.getJSONArray("UserID");
                    //System.out.println("jarraylength: " + jarray.length());
                    //System.out.println("333: " + jarray.getJSONObject(0).getString("UserID") ); // getString("UserID"));
                    
                    float aTotalTransNumber = 0;
                    float aTotalCashSpent = 0;
                    float aTotalDiscountGotten = 0;
                    int amountOfUsers = listOfUserIDs.size();
                    System.out.println("listOfUserIDs.size(): " + listOfUserIDs.size());
                    
                    List<PairBean> outletsUsedBeans = new LinkedList<PairBean>();
                    List<PairBean> outletsUsedBeansDescOrder = new LinkedList<PairBean>();
                    
                    for (int ii=0; ii < listOfUserIDs.size(); ii++)
                    { //System.out.println("ii: " + ii);
                    
                                stmt = null;
                                stmt = conn.createStatement();
                                //System.out.println("VACHINA");
                                String query7 = "SELECT * FROM disbursals WHERE UserID='" + listOfUserIDs.get(ii) + "' LIMIT 0, 1500;";
                                //System.out.println("?A?A?A");
                                ResultSet rs = null;
                                rs = stmt.executeQuery(query7);
                                float totalCashSpent = 0;
                                int totalAmountOfTransactions = 0;
                                float totalDiscountGotten = 0;
                           
                                while (rs.next()) 
                                {
                                    // Add Outletname if not yet added.
                                    String name = rs.getString("OutletName");
                                    
                                    
                                    // Bean version. outletsUsedBeans
                                    boolean alreadyExists = false; // Assume it's not in list.
                                    for (int j = 0; j < outletsUsedBeans.size(); j++) // Loop through entire list.
                                    {
                                        if (outletsUsedBeans.get(j).getStoreName().equals(name)){ // if the name is found in the List, set true to say we already have it.
                                            alreadyExists = true;
                                            // Increment amount of times user went to this store.
                                            outletsUsedBeans.get(j).incrementStoreVisits();// setStoreVisits( outletsUsedBeans.get(i).getStoreVisits() + 1 );
                                            break;
                                        }
                                    }
                                    if (!alreadyExists) { // store not saved in List yet, so add it
                                        
                                        //System.out.println("NAME" + name);
                                        PairBean pairBeanObj = new PairBean();
                                        pairBeanObj.setStoreName(name);
                                        pairBeanObj.setStoreVisits(1);
                                        outletsUsedBeans.add(pairBeanObj);
                                    }
                                    
                                    totalCashSpent      += rs.getFloat("CashSpent");
                                    totalDiscountGotten += rs.getFloat("Discount");
                                    
                                    totalAmountOfTransactions += 1;
                                }
                                //totalAmount = totalCashSpent+totalDiscountGotten;
                                //avgSpent = totalCashSpent / totalAmountOfTransactions;
                                
                             

                            
                                
                            
                            
                                // outletsUsedBeansDescOrder.get(i).getStoreVisits()
                                // outletsUsedBeansDescOrder.get(i).getStoreVisits()
                    //System.out.println("totalAmountOfTransactions at ii="+ii + " : " + totalAmountOfTransactions);
                    aTotalTransNumber += totalAmountOfTransactions; 
                    aTotalCashSpent += totalCashSpent;
                    aTotalDiscountGotten += totalDiscountGotten;
                    
                    } // end of biggest for loop ever?
                    
                    System.out.println("fek fek fek");
                    System.out.println("AAAAAA" + aTotalTransNumber);
                    conn.close();
                    float aTotalCashDisc = aTotalCashSpent + aTotalDiscountGotten;
                    float aAvgSpent = aTotalCashSpent/aTotalTransNumber;
                    // Format £ amounts to 2 decimal places.
                    for (int a=0; a < 4; a++)
                            {   float value = 0;
                                if(a==0) { value = aTotalCashSpent; }
                                if(a==1) { value = aTotalDiscountGotten; }
                                if(a==2) { value = aTotalCashDisc; }
                                if(a==3) { value = aAvgSpent; }
                                int pow = 100;
                                float tmp = value * pow;
                                float tmpSub = tmp - (int) tmp;

                                if(a==0) 
                                { aTotalCashSpent = ( (float) ( (int) (
                                                    value >= 0
                                                    ? (tmpSub >= 0.5f ? tmp + 1 : tmp)
                                                    : (tmpSub >= -0.5f ? tmp : tmp - 1)
                                                    ) ) ) / pow; 
                                }
                                if(a==1) { aTotalDiscountGotten = ( (float) ( (int) (
                                                    value >= 0
                                                    ? (tmpSub >= 0.5f ? tmp + 1 : tmp)
                                                    : (tmpSub >= -0.5f ? tmp : tmp - 1)
                                                    ) ) ) / pow; }
                                if(a==2) { aTotalCashDisc = ( (float) ( (int) (
                                                    value >= 0
                                                    ? (tmpSub >= 0.5f ? tmp + 1 : tmp)
                                                    : (tmpSub >= -0.5f ? tmp : tmp - 1)
                                                    ) ) ) / pow; } 
                                if(a==3) { aAvgSpent = ( (float) ( (int) (
                                                    value >= 0
                                                    ? (tmpSub >= 0.5f ? tmp + 1 : tmp)
                                                    : (tmpSub >= -0.5f ? tmp : tmp - 1)
                                                    ) ) ) / pow; } 
                                
                            }
                    
                            // Order the List of Outlets used. outletsUsedBeansDescOrder
                            // Loop through all -> take highest, add in new. Again until list empty.
                            while (!outletsUsedBeans.isEmpty()) // Loop through all outlets we have saved.
                            {
                                // Loop through all and extract highest.
                                int highestIndex = -1;
                                for (int i=0; i < outletsUsedBeans.size(); i++)
                                {
                                    // Set first as highest.
                                    if(highestIndex == -1) {highestIndex = i;}
                                    // Now check if 2nd/3rd etc is higher and set them as highest if they are
                                    if(outletsUsedBeans.get(i).getStoreVisits() > outletsUsedBeans.get(highestIndex).getStoreVisits())
                                    { 
                                        // is higher
                                        highestIndex = i;
                                    }
                                }
                                // Now we know index of highest storevisits.
                                // add to 2nd list
                                outletsUsedBeansDescOrder.add(outletsUsedBeans.get(highestIndex));
                                // remove it from first list.
                                outletsUsedBeans.remove(highestIndex);
                            } // end while()
                            // end order outlet list. outletsUsedBeans
                            
                        long endTime = System.nanoTime();
                        long elapsed = endTime - startTime;
                        System.out.println("Took~ " + elapsed/1000000000 + "seconds to load.");
                              %>
                              
                              <a> Transactions: #<%=aTotalTransNumber%></a><br>
                              <a> Total Cash Spent: £<%=aTotalCashSpent%></a><br>
                              <a> Total Discount gotten: £<%=aTotalDiscountGotten%></a> <br>
                              <a> Avg spent: £<%=aAvgSpent%></a><br>
                              <a> Cash + Discount: £<%=aTotalCashDisc%></a><br>
                              <a> Avg transaction per user: <%=aTotalTransNumber/amountOfUsers%></a><br><br>
                              <% 
                                    System.out.println("outletsUsedBeansDescOrder.size(): " + outletsUsedBeansDescOrder.size());
                                    for (int io=0; io < outletsUsedBeansDescOrder.size(); io++)
                                    { 
                                        
                                        %><a> <%=outletsUsedBeansDescOrder.get(io).getStoreVisits()%> transactions in </a><%
                                        %><a> <%=outletsUsedBeansDescOrder.get(io).getStoreName()%> </a><br><%
                                        
                                    }
                              %>


                            
                        

        <script src="https://cdnjs.cloudflare.com/ajax/libs/vivus/0.4.2/vivus.min.js" integrity="sha256-QkfKcx3kugootBtJEPpTKDsWEneddME3kXPoT5o3Yic=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

    </body>
</html>
