<%-- 
    Document   : tribes
    Created on : 25-Sep-2017, 10:56:41
    Author     : Think
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.BookWormBean"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.Arrays" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <title>Medical Marvels</title>
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
                // Again, you might not need every single column+row.
                data.addColumn('string', 'User ID');
                // Get the Attribute which holds all data retrieved by Model.
                var jsonListOfDBdata = <%=request.getAttribute("JSONListAttribute")%>;
                //console.log("jsonListOfDBdata: " + jsonListOfDBdata + "length: " + jsonListOfDBdata.length);
                for (var a = 0; a < jsonListOfDBdata.length; a++)
                {
                    var dateTime = jsonListOfDBdata[a].DateAndTime;
                    // Order is important. Must match Columns.
                    data.addRows
                            ([[
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
                    ['Party Animals',  NumofTribe],
                    ['All Users',  7877]
                  ]);

                var options = {
                  legend: 'label',
                  title: 'Percentage of Users',
                  pieSliceText: 'number',
                  is3D:'true',

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
        <div class="container" style="margin-top: 2.5%;">
            <div class="row">
                <div class="col">
                    <h1 class="display-4">Party Animals:</h1>
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
                                    <th> Total Number of Party Animals </th>
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/vivus/0.4.2/vivus.min.js" integrity="sha256-QkfKcx3kugootBtJEPpTKDsWEneddME3kXPoT5o3Yic=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

    </body>
</html>
