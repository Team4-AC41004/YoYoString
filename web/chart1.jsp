<!DOCTYPE html>
<html>
    <head>
        <title>Chart1</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type ="text/javascript">

            var queryObject = "";
            var queryObjectLen = "";
            
            // Ajax to retrieve data from chart1getdata.jsp
            $.ajax({
                    type: 'POST',
                    url: 'chart1getdata.jsp',
                    dataType: 'json',
                    success: function (data) 
                    {
                            queryObject = eval('(' + JSON.stringify(data) + ')');
                            console.log(data);
                            queryObjectLen = queryObject.linkedListThatHoldsJSONObjs.length;
                            console.log(queryObject.linkedListThatHoldsJSONObjs.length)
                    },
                    error: function (xhr, type) { alert('Ajax in chart1.jsp failed to retrieve Data.'); }
            });

            google.charts.load('current', {'packages': ['table', 'corechart']});
            google.charts.setOnLoadCallback(drawTable);

            function drawTable() 
            {
                var data = new google.visualization.DataTable();
                // Add columns for table. Specify datatype then Name.
                data.addColumn('string', 'Date And Time');
                data.addColumn('string', 'Outlet Name');
                data.addColumn('number', 'Outlet Ref');
                data.addColumn('number', 'Cash spent');

                for (var i = 0; i < queryObjectLen; i++)
                {
                    var dateAndTime = queryObject.linkedListThatHoldsJSONObjs[i].DateAndTime;
                    var outletName  = queryObject.linkedListThatHoldsJSONObjs[i].OutletName;
                    var outletRef   = queryObject.linkedListThatHoldsJSONObjs[i].OutletRef;
                    var cashSpent   = queryObject.linkedListThatHoldsJSONObjs[i].CashSpent;
                    
                    data.addRows([
                        [dateAndTime,
                         outletName,
                         outletRef,
                         cashSpent]
                    ]);
                    
                    // Debug Messages that can be seen in Browser.
                    console.log(queryObject.linkedListThatHoldsJSONObjs[i]);
                    console.log(queryObject.linkedListThatHoldsJSONObjs[i].DateAndTime);
                    console.log(queryObject.linkedListThatHoldsJSONObjs[i].OutletName);
                    console.log(queryObject.linkedListThatHoldsJSONObjs[i].OutletRef);
                    console.log(queryObject.linkedListThatHoldsJSONObjs[i].CashSpent);
                }
                

                var table = new google.visualization.Table(document.getElementById('table_div'));
                table.draw(data, { width: '60%', height: '100%'});
                
                //var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                //chart.draw(data, {width:'40%', height: '100%'});
            }

        </script>
    </head>
    <body>
        <div id="table_div"></div>
        <div id="chart_div"></div>
        
    </body>
</html>