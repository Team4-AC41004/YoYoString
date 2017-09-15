<!DOCTYPE html>
<html>
    <head>
        <title>Google Chart with jsp Mysql Json</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

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

                    google.charts.load('current', {'packages': ['table', 'corechart']});
                    google.charts.setOnLoadCallback(drawTable);

                    function drawTable() {
            var data = new google.visualization.DataTable();
                    <!--     data.addColumn('string', 'Name');-->
                    data.addColumn('number', 'TransID');
                data.addColumn('number', 'Amount');
                 for(var i=0;i<queryObjectLen;i++)
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
                }
                

                var table = new google.visualization.Table(document.getElementById('table_div'));
                table.draw(data, { width: '60%', height: '100%'});
                var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                chart.draw(data, {width:'40%', height: '100%'});
            }

        </script>
    </head>
    <body>
        <div id="table_div"></div>
        <div id="chart_div"></div>
        
    </body>
</html>



