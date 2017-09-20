<%-- 
    Document   : testJSP
    Created on : 18-Sep-2017, 15:00:03
    Author     : Philipp
--%>

<%@page import="Beans.testBean"%>
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
        <h1>Good morning!</h1>
        <div id="table_div"></div>
        
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type ="text/javascript">

            google.charts.load('current', {'packages': ['table', 'corechart']});
            google.charts.setOnLoadCallback(drawTable);

            function drawTable() 
            {  
                console.log("1debug");
                var data = new google.visualization.DataTable();
                //data.addColumn('string', 'Name');
                data.addColumn('datetime', 'Date And Time');
                data.addColumn('string', 'Outlet Name');
                data.addColumn('number', 'Outlet Ref');
                data.addColumn('number', 'Cash spent');
                
                // Get the Attribute which holds all data retrieved by Model.
                var test = <%=request.getAttribute("JSONListAttribute")%>;
                console.log("test: " + test + "length: " + test.length);
                
                
                for (var a = 0; a < 4; a++)
                {
                    console.log("for loop: " + a)
                    
                    var dateTime = test.;
                    data.addRows([
                        [dateTime]
                    ]);
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
                <% /*
                    request.getAttribute("JSONListAttribute");
                    List theJSONList = (LinkedList) request.getAttribute("JSONListAttribute");
                    // TODO: Rewrite into Javascript. Get the list of Json objects, then use it to populate table.
                    ArrayList<testBean> listOfTestBeanos = (ArrayList<testBean>) session.getAttribute("testAttribute");
                    
                for (int a=0; a < listOfTestBeanos.size(); a++)
                {//pos.get(i).getID()
                    Date dateAndTime = listOfTestBeanos.get(a).getDateAndTime();
                    String outletName = listOfTestBeanos.get(a).getOutletName();
                    int outletRef = listOfTestBeanos.get(a).getOutletRef();
                    float cashSpent = listOfTestBeanos.get(a).getCashSpent();
                    
                    System.out.println("TESTICLE DEBUG MSG");
                    
                    data.addRows( [ [dateAndTime,outletName,outletRef,cashSpent] ] );
                }
                
                        
                   */     
                  %> 
            }

        </script>

        
        
    </body>
</html>
