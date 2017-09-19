<!DOCTYPE html>
<html>
    <head>
        <title>Google Chart with jsp Mysql Json</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
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
                        console.log(data);                     queryObjectLen = queryObject.empdetails.length;
                        console.log(queryObject.empdetails.length)
                },
                    error: function (xhr, type) {
                        alert('server error occoured');
                }
            });
                google.charts.load('current', {'packages': ['table', 'corechart']});
             google.charts.setOnLoadCallback(drawTable);
                function drawTable() {
                 var data  = new google.visualization.DataTable();
                <!--     data.addColumn('string', 'Name');-->
                data.addColumn('number', 'Transaction ID #');
                data.addColumn('number', 'Amount (£)');
                
                for(var i=0;i<queryObjectLen;i++)
                {
                console.log(queryObject.empdetails[i]);
                        var   name   =   queryObject.empdetails[i].UserID;
                        console.log(queryObject.empdetails[i].UserID);
                        var   empid   =    queryObject.empdetails[i].CashSpent;
                        console.log(queryObject.empdetails[i].CashSpent);
                        var   transid   =   queryObject.empdetails[i].TransactionID;
                        console.log(queryObject.empdetails[i].TransactionID);
                        data.addRows([
                        [transid,  empid]
                        ]);
}


var table = new google.visualization.Table(document.getElementById('table_div'));
table.draw(data, {
                width: '100%',   height: '100%'});
var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
chart.draw(data, {
                width:'100%',   height: '100%',   legend:'none',   curveType:'function',   title: 'First 100 Transactions: Line'});
var chart = new google.visualization.AreaChart(document.getElementById('chart_div2'));
chart.draw(data, {
                width:'100%',   height: '100%',   legend:'none',   title: 'First 100 Transactions: Area',     colors: ['#ff0000']});
                var chart = new google.visualization.ColumnChart(document.getElementById('chart_div3'));
                chart.draw(data, {
                width:'100%',   height: '100%',   legend:'none',   title: 'First 100 Transactions: Scatter Graph',  pointSize: '3',     colors: ['#00ff00']});
                }
                function downloadPDF() {
                //var imgData = "<%= session.getAttribute("chartImgID")%>"; 
                var imgData = document.getElementById("chartImgID").value;
                var doc = new jsPDF('landscape');
                var width = doc.internal.pageSize.width;
                var height = doc.internal.pageSize.height;
                //get dimention of image/graph
                var img = new Image();
                img.src = imgData;
                img.onload = function(){

                //for some reason thee dimensions are correct/good only if I divide by 5???
var imgheight = img.height/5;
  var imgwidth = img.width/5;
                   
// if width of height are bigger than the page do not trim
if (imgwidth>width){
    imgwidth=width;
}
if (imgheight>height){
    imgheight=height;
}
            
doc.addImage(imgData, 'PNG', 0, 10, imgwidth, imgheight);
//doc.addImage(imgData, 'PNG', 0, 10); //default dimentions? - graph is trimmed
            
doc.setFontSize(20);
doc.text(15, 10, 'Chart PDF');
            
//doc.output('datauri');            //opens in same window - doesn't work
//doc.output('dataurlnewwindow');   //opens in new window - opens but doesn't work
//doc.autoPrint();                  //doesn't work
doc.save("mygraph");
}        
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
                    <div id="chart_div"></div>
                    <div id="chart_div2"></div>
                    <div id="chart_div3"></div>
                </div>
            </div>
        </div>

        <form action="GraphPageTest" method="POST">
            <input type="hidden" name="chartImgID"  id="chartImgID">
        </form>

        <button type="button" class="btn btn-primary" onclick="downloadPDF()">Download Graph in PDF</button>
        <br><br>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

    </body>
</html>



