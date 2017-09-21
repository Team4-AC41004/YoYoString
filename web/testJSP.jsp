<%-- 
    Document   : testJSP
    Created on : 18-Sep-2017, 15:00:03
    Author     : Philipp
--%>

<%@page import="Beans.testBean"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Le Title</title>
    </head>
    <body>
        <h1>This is testJSP.jsp h1</h1>
        <div id="table_div"></div>
        
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type ="text/javascript">

            google.charts.load('current', {'packages': ['table', 'corechart']});
            google.charts.setOnLoadCallback(drawTable);

            function drawTable() 
            {  
                console.log("1debug");
                var data = new google.visualization.DataTable();
                // Order of Columns must be remembered below when atting rows.
                //data.addColumn('string', 'Name');
                data.addColumn('date', 'Date');
                data.addColumn('timeofday', 'Time');
                data.addColumn('number', 'Outlet Ref');
                data.addColumn('string', 'Outlet Name');
                data.addColumn('number', 'Cash spent');
                
                // Get the Attribute which holds all data retrieved by Model.
                var test = <%=request.getAttribute("JSONListAttribute")%>;
                console.log("test: " + test + "length: " + test.length);
                
                
                for (var a = 0; a < test.length; a++)
                {
                    //console.log("for loop[a]: " + a);
                    //console.log("test[a].DateAndTime: " + test[a].DateAndTime);
                    //console.log("test[a].CashSpent " + test[a].CashSpent);
                    //var dateTime = test.;
                    //console.log("test[a].valueOf: " + test[a].DateAndTime.valueOf() );
                    //console.log("test[a].toString: " + test[a].DateAndTime.toString() );
                    // Order is important. Must match Columns.
                    data.addRows
                    ([[
                        test[a].Date,
                        test[a].Time,
                        test[a].OutletRef,
                        test[a].OutletName,
                        test[a].CashSpent
                    ]]);
                }
                     
                        
                     /* 
                for (var i = 0; i < test.; i++)
                {
                    console.log(queryObject.empdetails[i]);
    
                    var name = queryObject.empdetails[i].UserID;
    
                    console.log(queryObject.empdetails[i].UserID);
                    var empid = queryObject.empdetails[i].CashSpent;
                    console.log(queryObject.empdetails[i].CashSpent);
                    var transid = queryObject.empdetails[i].TransactionID;
                    console.log(queryObject.empdetails[i].TransactionID);
                    
                    data.addRows([
                        [transid,empid]
                    ]);
                } */
                

                var table = new google.visualization.Table(document.getElementById('table_div'));
                table.draw(data, { width: '60%', height: '100%'});
                
                
                
                
                // === Java
                //ArrayList<ProgrammeOfStudy> pos = (ArrayList<ProgrammeOfStudy>) request.getAttribute("items");
                <% 
                  /*  request.getAttribute("JSONListAttribute");
                    List theJSONList = (LinkedList) request.getAttribute("JSONListAttribute");
                    System.out.println("testJSP.jsp: theJSONList: " + theJSONList); */
                    // TODO: Rewrite into Javascript. Get the list of Json objects, then use it to populate table.
                    //ArrayList<testBean> listOfTestBeanos = (ArrayList<testBean>) request.getAttribute("JSONListAttribute");
                    //List listWithJSONattribute = (LinkedList) request.getAttribute("JSONListAttribute");
                    
                    
                   /* 
                for (int a=0; a < listOfTestBeanos.size(); a++)
                {//pos.get(i).getID()
                    Date dateAndTime = listOfTestBeanos.get(a).getDateAndTime();
                    System.out.println();
                    String outletName = listOfTestBeanos.get(a).getOutletName();
                    int outletRef = listOfTestBeanos.get(a).getOutletRef();
                    float cashSpent = listOfTestBeanos.get(a).getCashSpent();
                    
                    System.out.println("TESTICLE DEBUG MSG"); 
                    
                    //data.addRows( [ [dateAndTime,outletName,outletRef,cashSpent] ] );
                } */
                
                        
                        
                  %> 
            }

        </script>

        
        
    </body>
</html>
