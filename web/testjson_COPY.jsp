<!DOCTYPE html>

<%@page import="javax.imageio.ImageIO"%>

<html>
    <head>
        <title>Google Chart with jsp Mysql Json</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

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
                   // <!--     data.addColumn('string', 'Name');-->
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
                
                var imgUri = chart.getImageURI();                
                document.getElementById("chartImgID").value=imgUri;
            }
            
            function downloadPDF() {
            var imgData = "<%= session.getAttribute( "chartImgID" ) %>";                 
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
    <body>
        <div id="table_div"></div>
        <div id="chart_div"></div>
        <br>
            <button type="button" class="btn btn-primary" onclick="downloadPDF()">Download Graph in PDF</button>
            <br><br>
    </body>
</html>



