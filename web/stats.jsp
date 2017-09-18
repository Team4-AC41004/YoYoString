<%-- 
    Document   : stats
    Created on : 14-Sep-2017, 13:31:16
    Author     : Think
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" %>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Landing Page for YoYoStat">
        <meta name="author" content="cjgsdundee">

        <title>YoYoStats - View Stats</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css"/>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">

            // Load the Visualization API and the corechart package.
            google.charts.load('current', {'packages': ['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Topping');
                data.addColumn('number', 'Slices');
                data.addRows([
                    ['Mushrooms', 3],
                    ['Onions', 1],
                    ['Olives', 1],
                    ['Zucchini', 1],
                    ['Pepperoni', 2]
                ]);

                // Set chart options
                var options = {'title': 'How Much Pizza I Ate Last Night',
                    'width': 400,
                    'height': 300};

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
        </head>
    <body>
        <%@ include file="navbar.jsp" %>

        <div id="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-7" style="overflow: auto; display: inline-block; height: 80vh;">
                        <table class="table table-hover">
                            <thead class="thead-default">
                                <tr>
                                    <th>Transaction Date</th>
                                    <th>Store ID</th>
                                    <th>Store Name</th>
                                    <th>Customer ID</th>
                                    <th>Transaction Type</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = null;
                                    conn = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk/ip17team4db", "ip17team4", "0455.ip17t.5540");
                                    Statement stmt = null;
                                    stmt = conn.createStatement();
                                    String query = "select * from test";
                                    ResultSet rs = null;
                                    rs = stmt.executeQuery(query);
                                    int count = 100;
                                    int inc = 0;
                                    while (rs.next() && inc < count) {
                                %>
                                <tr>
                                    <%
                                        int transactionid = rs.getInt("TransactionID");
                                        Date date = rs.getDate("DateAndTime");
                                        int id = rs.getInt("OutletRef");
                                        String name = rs.getString("OutletName");
                                        String userid = rs.getString("UserID");
                                        String transtype = rs.getString("TransactionType");
                                        float cashspent = rs.getFloat("CashSpent");
                                        inc += 1;
                                    %>
                                    <td scope="row"><%=date%></td>
                                    <td><%=id%></td>
                                    <td><%=name%></td>
                                    <td><%=userid%></td>
                                    <td><%=transtype%></td>
                                    <td><%=cashspent%></td>
                                </tr>               

                                <%
                                    }
                                    conn.close();
                                %>

                            </tbody>
                        </table>  
                    </div>
                    <div class="col">
                        <div id="chart_div">

                        </div>
                    </div>
                </div>
                <div class="row">
                    <nav class="navbar fixed-bottom navbar-light bg-light">
                        <a class="navbar-brand" href="#"></a>
                    </nav>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    </body>
</html>
