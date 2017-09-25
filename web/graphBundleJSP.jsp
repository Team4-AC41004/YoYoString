<%-- 
    Document   : graphBundleJSP
    Created on : 22-Sep-2017, 12:53:12
    Author     : Philipp
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Now lissen gud here is how.</title>
    </head>
    <body>
        <h1>Welcome to graphBundleJSP.jsp</h1>
        <div id="columnchart_material" style="width: 1000px; height: 600px;"></div>
        <br>
        <div id="table_div"></div> 
        
        
        <!-- Load the google chart loader. -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type ="text/javascript">

            google.charts.load('current', {'packages': ['table', 'corechart', 'bar']}); // table, corechart and can add more.
            google.charts.setOnLoadCallback(drawTable);

            function drawTable() 
            {  
                var fuck = <%=request.getAttribute("fuck") %>
                console.log("fuck: " + fuck + " and fuck.length: " + fuck.length);
                console.log("fuck[0].TotalYoyoCustomers: " + fuck[0].TotalYoyoCustomers);
                console.log( "fuck: " + fuck[1].a238 ); // Number breaks it. eg fuck[1].238
                //console.log( "fuck: " + fuck[1].238 ); // Using Number only breaks it. eg fuck[1].238
                
                // Column Chart. 
                // 238=Library[1]. 239=Dental Café[15] AND Spare[2]. 236 Air Bar[3]. 243 Ents[4] AND Level 2, Reception[12]. 343 Remote Campus Shop[5]. 
                // 241 Liar Bar[6]. 242 Mono[7]. 240 Food on Four[8]. 237 Floor Five[9]. 
                // 235 DOJ Catering[10] AND DJCAD Cantina[11]. 456 DUSA The Union - Marketplace[13] AND Online Dundee University Students Association[16] AND DUSA The Union Online[17]. 
                // 343 Premier Shop - Yoyo Accept[14]. 2676 Premier Shop[18]. 2677 College Shop[19]. 2679 Ninewells Shop[20].
                
                // Prep the double data shits. // There's only 15 in the list, because there's 15 ID's. Hence you have to combine the names together. TODO
                var dentalCafeAndSpare = fuck[2].a239;// + (fuck[15].a239); 
                //var asdf = fuck[15].a239;
                var columnChart = google.visualization.arrayToDataTable([
                                    ['Unique Amount of Yoyo Customers' , 'Amount'], // This is prob all wrong given that the double ones should make others skip that number. Blargh.
                                    ['All Outlets'             , fuck[0].TotalYoyoCustomers],
                                    ['Library'                 , fuck[1].a238],
                                    ['Dental Café and Spare'   , fuck[2].a239],
                                    ['Air Bar'                 , fuck[3].a236],
                                    ['Ents and Level 2, Reception', fuck[4].a243],
                                    ['Remote Campus Shop and Premier Shop - Yoyo Accept', fuck[5].a343],
                                    ['Liar Bar'                , fuck[6].a241],
                                    ['Mono'                    , fuck[7].a242],
                                    ['Food on Four'            , fuck[8].a240],
                                    ['Floor Five'              , fuck[9].a237],
                                    ['DOJ Catering and DJCAD Catina', fuck[10].a235],
                                    ['DUSA The Union - Marketplace and Online DUSA and DUSA The Union Online',  fuck[11].a456],
                                    ['Premier Shop'            , fuck[12].a2676],
                                    ['College Shop'            , fuck[13].a2677],
                                    ['Ninewells Shop'          , fuck[14].a2679]
                                  ]);
                var optionsColChart = {
                    chart: {
                    title: 'Amount of Unique Yoyo customers Total and per Outlet',
                    subtitle: 'Derived from all data until present day',
                    }
                };
                var colChart = new google.charts.Bar(document.getElementById('columnchart_material'));
                colChart.draw(columnChart, google.charts.Bar.convertOptions(optionsColChart));

                // Table.
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
                var jsonListOfDBdata = <%=request.getAttribute("graphBundleAttribute")%>; // Need to rename the Attribute? TODO
                
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

                var table = new google.visualization.Table(document.getElementById('table_div'));
                table.draw(data, { width: '60%', height: '100%'});
                
            }
        </script>
        
        <% 
            System.out.println( request.getAttribute("graphBundleAttribute") );
            List listName = new LinkedList();
            listName = (LinkedList)request.getAttribute("graphBundleAttribute");
            listName.size(); 
        %>
        <h2>Pen is for writing+ <%=listName.size()%> +Penis</h2>
        
    </body>
</html>
