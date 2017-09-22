<%-- 
    Document   : testJSP
    Created on : 18-Sep-2017, 15:00:03
    Author     : Philipp
        
    Don't change this. It's a template, so copy paste and adjust for your needs.
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
        <h1>This is testJSP.jsp </h1>
        This shows every single Column in the Database.
        <br>Check testJSP.jsp, testModel.java and testServlet.java and adjust for your needs.
        <br>Don't change the files themselves though, they shall serve as templates, because they show how to do this shit and implement MVC, too.
        <br><br>
        <div id="table_div"></div>
        
        
        <!-- Load the google chart loader. -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type ="text/javascript">

            google.charts.load('current', {'packages': ['table', 'corechart']}); // table, corechart and can add more.
            google.charts.setOnLoadCallback(drawTable);

            function drawTable() 
            {  
                var data = new google.visualization.DataTable();
                // Order of Columns must be remembered below when atting rows.
                
                // Again, you might not need every single column+row.
                data.addColumn('datetime', 'Date And Time'); //data.addColumn('datatype', 'NameofColumnlalala');
                data.addColumn('number'  , 'Outlet Ref');
                data.addColumn('string'  , 'Outlet Name');
                data.addColumn('string'  , 'User ID');
                data.addColumn('string'  , 'Transaction Type');
                data.addColumn('number'  , 'Cash spent');
                data.addColumn('number'  , 'Discount');
                data.addColumn('number'  , 'Total');
                data.addColumn('number'  , 'Transaction ID');
                
                
                // Get the Attribute which holds all data retrieved by Model.
                var jsonListOfDBdata = <%=request.getAttribute("JSONListAttribute")%>;
                //console.log("jsonListOfDBdata: " + jsonListOfDBdata + "length: " + jsonListOfDBdata.length);
                
                
                for (var a = 0; a < jsonListOfDBdata.length; a++)
                {
                    var dateTime = jsonListOfDBdata[a].DateAndTime;
                    // Order is important. Must match Columns.
                    data.addRows
                    ([[
                        new Date(dateTime[0], dateTime[1], dateTime[2], dateTime[3], dateTime[4], dateTime[5], dateTime[6]),
                        jsonListOfDBdata[a].OutletRef,
                        jsonListOfDBdata[a].OutletName,
                        jsonListOfDBdata[a].UserID,
                        jsonListOfDBdata[a].TransactionType, 
                        jsonListOfDBdata[a].CashSpent,
                        jsonListOfDBdata[a].Discount,
                        jsonListOfDBdata[a].Total,
                        jsonListOfDBdata[a].TransactionID
                    ]]);
                }
                     
                        
                     /* 
                for (var i = 0; i < jsonListOfDBdata.; i++)
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
                table.draw(data, { width: '100%', height: '100%', page: 'enabled'});
                
                
                
                
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
