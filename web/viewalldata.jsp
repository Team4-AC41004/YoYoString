<%-- 
    Document   : testJSP
    Created on : 18-Sep-2017, 15:00:03
    Author     : Philipp
        
    Don't change this. It's a template, so copy paste and adjust for your needs.
--%>

<%@page import="Beans.VaDBean"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css"/>
        <title>All Stats - Sorting</title>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $.datepicker.setDefaults({
                    minDate: new Date(2015, 7, 24),
                    maxDate: "+1d",
                    changeYear: true,
                    altFormat: "yy-mm-dd",
                    dateFormat: "yy-mm-dd"
                });
                $("#startdatepicker").datepicker({
                    defaultDate: new Date(2015, 7, 24)
                });
                $("#enddatepicker").datepicker();
            });
        </script>
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        <div class="content">
            <div class="jumbotron"> 
                <div class="row">
                    <div class="col">
                        <h1 class="display-3">
                            Viewing all Records, 2015-2016.
                        </h1>
                    </div>
                </div>

                <hr class="my-2"/>
                <div class="row">
                    <div class="col">
                        <p>This shows every single Column in the Database.
                            <br/>By using the options below, you can search for specific dates, users, transaction amounts and multiple other data sets.
                            <br/> <strong>PLEASE NOTE: By searching for a large number of transactions (more than 12 months), the page will take longer to load the data. Unless you need to, try and keep data sets below 20,000 transactions.</strong>
                    </div>
                </div>
                <hr class="my-2"/>
                <div class="row">
                    <form action="Search" method="POST">
                        <h1 class="display-4"> Search Options</h1> <br/>
                        <div class="row">
                            <div class="col-3">
                                <div class="form-group">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" id="datecheck" checked value="1">
                                        Search By Date
                                    </label>
                                </div>
                                <div class="form-group " id="enabledate">
                                    <label for="startdatepicker"> Start Date</label>
                                    <input type="date" class="form-control" id="startdatepicker" placeholder="2000/01/01">

                                    <label for="enddatepicker"> End Date </label> 
                                    <input type="text" class="form-control" id="enddatepicker" placeholder="3000/12/31"> 
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" id="usercheck" checked value="1">
                                        Search By User
                                    </label>
                                </div>
                                <div class="form-group" id="enableuser">
                                    <div class="input-group">
                                        <span class="input-group-addon" id="sizing-addon2">dusa-</span>
                                        <input type="text" id="useridinput" class="form-control" placeholder="0001" aria-label="Username" aria-describedby="sizing-addon2">
                                    </div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" id="storecheck" checked value="1">
                                        Search By Location
                                    </label>
                                </div>
                                <div class="form-group" id="enablelocation">
                                    <div class="input-group">
                                        <select id="select" class="custom-select form-control" placeholder="Select a Location">
                                            <option selected>Select a Location</option>
                                            <option value="1">Air Bar</option>
                                            <option value="2">College Shop</option>
                                            <option value="3">Dental Café</option>
                                            <option value="4">DJCAD Cantina</option>
                                            <option value="5">DOJ Catering</option>
                                            <option value="6">DUSA The Union - Marketplace</option>
                                            <option value="7">DUSA The Union Online</option>
                                            <option value="8">Ents</option>
                                            <option value="9">Floor on Five</option>
                                            <option value="10">Food on Four</option>
                                            <option value="11">Level 2, Reception</option>
                                            <option value="12">Liar Bar</option>
                                            <option value="13">Library</option>
                                            <option value="14">Mono</option>
                                            <option value="15">Ninewells Shop</option>
                                            <option value="16">Online Dundee University Students Association</option>
                                            <option value="17">Premier Shop - Yoyo Accept</option>
                                            <option value="18">Premier Shop</option>
                                            <option value="19">Remote Campus Shop</option>
                                            <option value="20">Spare</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3">
                                <button type="submit" class="btn btn-info">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
                
                <div id="table_div"></div>
                <div id="chart_div"></div>
            </div>
        </div>
         <script>
                document.getElementById('datecheck').onchange = function() {
                document.getElementById('enddatepicker').disabled = !this.checked;
                document.getElementById('startdatepicker').disabled = !this.checked;
                document.getElementById('enddatepicker').value = "";
                document.getElementById('startdatepicker').value = "";
                $("#enabledate").toggle("fast");
                };
                document.getElementById('usercheck').onchange = function() {
                document.getElementById('useridinput').disabled = !this.checked;
                document.getElementById('useridinput').value = "";
                $("#enableuser").toggle("fast");
                };
                document.getElementById('storecheck').onchange = function() {
                document.getElementById('select').disabled = !this.checked;
                document.getElementById('select').value = "";
                $("#enablelocation").toggle("fast");
                };
        </script>

        <!-- Load the google chart loader. -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type ="text/javascript">

      google.charts.load('current', {'packages': ['table', 'corechart', 'charteditor']}); // table, corechart and can add more.
      google.charts.setOnLoadCallback(drawTable);
      


      function drawTable()
      {
          google.charts.setOnLoadCallback(loadEditor);
          var data = new google.visualization.DataTable();
          // Order of Columns must be remembered below when atting rows.

          // Again, you might not need every single column+row.
          data.addColumn('datetime', 'Date And Time'); //data.addColumn('datatype', 'NameofColumnlalala');
          data.addColumn('number', 'Outlet Ref');
          data.addColumn('string', 'Outlet Name');
          data.addColumn('string', 'User ID');
          data.addColumn('string', 'Transaction Type');
          data.addColumn('number', 'Cash spent');
          data.addColumn('number', 'Discount');
          data.addColumn('number', 'Total');
          data.addColumn('number', 'Transaction ID');


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
            var result = google.visualization.data.group(data, [2], [{'column': 7, 'aggregation': google.visualization.data.sum, 'type': 'number'}]);
            var table = new google.visualization.Table(document.getElementById('table_div'));
            table.draw(result, {width: '40%', height: '100%', page: 'enabled', allowHTML: 'true', columns: ''});
            
         
         var chartEditor = null;

        function loadEditor() {
          // Create the chart to edit.
          var wrapper = new google.visualization.ChartWrapper({
             'chartType':'LineChart',
             'dataTable':result,
             
             'options': {'title':'Population Density (people/km^2)', 'legend':'none'}
          });

          chartEditor = new google.visualization.ChartEditor();
          google.visualization.events.addListener(chartEditor, 'ok', redrawChart);
          chartEditor.openDialog(wrapper, {});
        }

        // On "OK" save the chart to a <div> on the page.
        function redrawChart(){
          chartEditor.getChartWrapper().draw(document.getElementById('chart_div'));
        }
    }
       
        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/vivus/0.4.2/vivus.min.js" integrity="sha256-QkfKcx3kugootBtJEPpTKDsWEneddME3kXPoT5o3Yic=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        
    </body>
</html>
