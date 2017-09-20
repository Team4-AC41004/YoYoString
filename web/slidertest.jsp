<!DOCTYPE html>
<html>
    <head>
        <title>Google Chart with jsp Mysql Json</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css"/>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type ="text/javascript">

            var queryObject = "";
            var queryObjectLen = "";
            $.ajax({
            type: 'POST',
                    url: 'getdata.jsp',
                    dataType: 'json',
            success: function (data) {
            queryObject = eval('(' + JSON.stringify(data) + ')');
                    console.log(data);
                    queryObjectLen = queryObject.empdetails.length;
                    console.log(queryObject.empdetails.length)
                    },
                    error: function (xhr, type) {
                    alert('server error occoured');
                    }
            });
            google.charts.load('current', {'packages': ['table', 'corechart', 'controls']});
            google.charts.setOnLoadCallback(drawDashboard);
          
            function drawDashboard() {
                var data = new google.visualization.DataTable();
                <!--     data.addColumn('string', 'Name');-->
                data.addColumn('number', 'Transaction ID #');
                data.addColumn('number', 'Amount (£)');

                for(var i=0; i<queryObjectLen; i++)
                {
                    console.log(queryObject.empdetails[i]);
                    var name = queryObject.empdetails[i].UserID;
                    console.log(queryObject.empdetails[i].UserID);
                    var empid =  queryObject.empdetails[i].CashSpent;
                    console.log(queryObject.empdetails[i].CashSpent);
                    var transid = queryObject.empdetails[i].TransactionID;
                    console.log(queryObject.empdetails[i].TransactionID);
                    data.addRows([
                        [transid,empid]
                    ]);
                }


                var table = new google.visualization.Table(document.getElementById('table_div'));
                table.draw(data, { width: '100%', height: '100%'});

                var dash = new google.visualization.Dashboard(document.getElementById('dashboard'));

                var control = new google.visualization.ControlWrapper({
                controlType: 'ChartRangeFilter',
                containerId: 'control_div',
                options: {
                    filterColumnIndex: 0,
                    ui: {
                        chartOptions: {
                            height: 50,
                            width: 600,
                            chartArea: {
                                width: '80%'
                            }
                        }
                    }
                }
                });

                var chart = new google.visualization.ChartWrapper({
                    chartType: 'LineChart',
                    containerId: 'chart_div'
                });

                function setOptions (wrapper) {
       
                    wrapper.setOption('width', 620);
                    wrapper.setOption('chartArea.width', '80%');
                    
                }
    
                setOptions(chart);
   
    
                dash.bind([control], [chart]);
                dash.draw(data);
            }

        </script>
    </head>
    <style>
            body
            {
                overflow-x: hidden;
            }
    </style>
    <body>
        <%@ include file="navbar.jsp"%>
        <div class="content">
            <div class="row" style="height: 100;">
                <div class="col-6">
                    <div id="table_div"></div>
                </div>
                <div class="col" style="position: fixed; width: 50%; right: 0;">
                    <div id="dashboard">
                        <div id="chart_div"></div>
                        <div id="control_div"></div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

    </body>
</html>



