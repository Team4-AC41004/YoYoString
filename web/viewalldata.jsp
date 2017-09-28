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
    <style>
        .modal-dialog{
            
        all:initial;    
        z-index: 999;
        }
        #google-visualization-charteditor-name-input
        {
            background-color: none;
        }

        
    </style>
    <body>
        <%@ include file="navbar.jsp"%>
        <div class="content">
            
            <%  LoggedIn Loggedin = (LoggedIn) session.getAttribute("loggedin");
                if (loggedin != null) {%>
            
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
                    <form action="SearchData" method="POST">
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
                                    <input type="text" class="form-control" name = "startdatepicker" id="startdatepicker" placeholder="2000/01/01" required>

                                    <label for="enddatepicker"> End Date </label> 
                                    <input type="text" class="form-control" name = "enddatepicker" id="enddatepicker" placeholder="3000/12/31" required> 
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
                                        <input type="text" name = "useridinput" id="useridinput" class="form-control" placeholder="0001" aria-label="Username" aria-describedby="sizing-addon2">
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
                                        <select id="select" class=" form-control" placeholder="Select a Location" name = "select" required multiple > <!-- custom-select -->
                                            <!--<option selected>Air Bar</option>-->
                                            <option value="Air Bar">Air Bar</option>
                                            <option value="College Shop">College Shop</option>
                                            <option value="Dental Cafe">Dental Café</option>
                                            <option value="DJCAD Cantina">DJCAD Cantina</option>
                                            <option value="DOJ Catering">DOJ Catering</option>
                                            <option value="DUSA The Union - Marketplace">DUSA The Union - Marketplace</option>
                                            <option value="DUSA The Union Online">DUSA The Union Online</option>
                                            <option value="Ents">Ents</option>
                                            <option value="Floor Five">Floor Five</option>
                                            <option value="Food on Four">Food on Four</option>
                                            <option value="Level 2, Reception">Level 2, Reception</option>
                                            <option value="Liar Bar">Liar Bar</option>
                                            <option value="Library">Library</option>
                                            <option value="Mono">Mono</option>
                                            <option value="Ninewells Shop">Ninewells Shop</option>
                                            <option value="Online Dundee University Students Association">Online Dundee University Students Association</option>
                                            <option value="Premier Shop - Yoyo Accept">Premier Shop - Yoyo Accept</option>
                                            <option value="Premier Shop">Premier Shop</option>
                                            <option value="Remote Campus Shop">Remote Campus Shop</option>
                                            <option value="Spare">Spare</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!-- Remove from here if this doesn't work -->
                            <div class="col-4">
                                <div class="form-group" id="enablelocation">
                                <div class="input-group">

                                <label>
                                    Select Data to be Shown in Chart
                                </label>
                                    <div class="container">

                                        <div class="checkbox">
                                        <label><input type="checkbox" name = "dateandtimeCHK" value = "Date and Time">Date and Time</label>
                                    </div>
                                        <div class="checkbox">
                                        <label><input type="checkbox" name = "outletreferenceCHK" value = "Outlet Reference">Outlet Reference</label>
                                    </div>
                                        <div class="checkbox">
                                        <label><input type="checkbox" name = "outletnameCHK" value = "Outlet Name">Outlet Name</label>
                                    </div>
                                        <div class="checkbox">
                                        <label><input type="checkbox" name = "useridCHK" value="User ID">User ID</label>
                                    </div>
                                        <div class="checkbox">
                                        <label><input type="checkbox" name = "transactiontypeCHK" value="Transaction Type">Transaction Type</label>
                                    </div>
                                        <div class="checkbox">
                                        <label><input type="checkbox" name = "cashspentCHK" value="Cash Spent">Cash Spent</label>
                                    </div>
                                        <div class="checkbox">
                                        <label><input type="checkbox" name = "discountCHK" value="Discount">Discount</label>
                                    </div>
                                        <div class="checkbox">
                                        <label><input type="checkbox" name = "totalCHK" value="Total">Total</label>
                                    </div> 
                                        </div>
                                        <div class="checkbox">
                                        <label><input type="checkbox" name = "transactionidCHK" value="Transaction ID">Transaction ID</label>
                                    </div>

                                    </div>
                                </div>
                                </div>
                                <!-- Remove up to here if this doesn't work -->
                            
                            </div>
                            
                            <div class="col-3">
                                <button type="submit" class="btn btn-info">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
                
                <div id="table_div"></div>
                <br>
                <div id="chart_div"></div>
                <br>
                <button class="btn btn-info" onclick="loadEditor()">Edit Chart</button>
                <br><br>
                
                <button class="btn btn-primary" onclick="downloadPDF()">Download Graph in PDF</button>
                <br>
            </div>
                
                <%} else { %><br/>
            <div class="alert alert-info float-center" style="width: 100%;"role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close" style='cursor: pointer'>
                    <span aria-hidden="true">&times;</span>
                </button>
                It seems like you're not logged in. Click <a href='Login' class='alert-link'>Here</a> to log in!
            </div>
            <%}%>
                
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
      
      var chartEditor = null;
      var wrapper = null;
      var result = null;
      var imageURI = null;
      


        function drawTable()
        { 
            google.charts.setOnLoadCallback(createEditor);
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
            var jsonListOfDBdata = <%=request.getAttribute("requestedCustomDataAttribute")%>;
            //console.log("jsonListOfDBdata: " + jsonListOfDBdata + "length: " + jsonListOfDBdata.length); // Seems to work.


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
            //SELECT WHICH COLUMNS TO SHOW UP HERE AND PASS INTO WRAPPER BELOW? e.g. 'results' gets custom columns, and wrapper gets the 'results' data table
            
            
            // Want an array with 0's and 1's to show in order which Checkbox is active. getParameterValues
            //var arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne = new Array(9);//[9];
            var arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne = new String("<%=request.getAttribute("attributeArrayThatShowsCheckboxActiveZeroOrOne")%>");
            //var arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne = <%//=request.getAttribute("arrayWithSelectedCheckboxesAttribute")%>;
            //console.log("var arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne in viewalldata.jsp: " + arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne);
            //console.log("request: " + <%//=request.getAttribute("attributeArrayThatShowsCheckboxActiveZeroOrOne")%>); // nope
            //console.log("(String)request: " + <%//=(String)request.getAttribute("attributeArrayThatShowsCheckboxActiveZeroOrOne")%>); // nope
            //var what = new String("<%//=request.getAttribute("attributeArrayThatShowsCheckboxActiveZeroOrOne")%>"); // yisss
            //console.log( "what: " + what);
            
            
            //arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne = String(arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne);
            
            if (arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne !== "0") // User has made choices about filtering.
            { 
                console.log("Not null, yay!: var arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne !== null");
                
                var columnsToUse = "";
                var tickedCheckBoxNumber = [];//new Array(2);
                //SELECT WHICH COLUMNS TO SHOW UP HERE AND PASS INTO WRAPPER BELOW? e.g. 'results' gets custom columns, and wrapper gets the 'results' data table
                console.log("KEEL YUU!" + arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne);
                console.log("arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne.length= " + arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne.length);
                
                for (var i = 0; i < arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne.length; i++)
                {
                    console.log("first for loop");
                    if(arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne.charAt(i) !== "0") // If box is ticked
                    {
                        //if (columnsToUse.charAt(0) === "" ) // What's this mean?
                        //{
                        tickedCheckBoxNumber.push(i);
                        console.log("i" + i);
                            //columnsToUse += arrayAttributeArrayThatShowsCheckboxActiveZeroOrOne.charAt(i);   //.push(i); // add the ticked box index number
                        //} // So only ever gonna add 1 ?
                    }
                    else // box not ticked
                    {
                        
                        
                    }
                }
                console.log("FOR LUUUUPPPP OVER");
                console.log("tickedCheckBoxNumber[0] = " + tickedCheckBoxNumber[0]);
                console.log("tickedCheckBoxNumber[1] = " + tickedCheckBoxNumber[1]);
                // What's the intention here?
                try
                {
                    // Does it only work with 2 values?
                   // result = google.visualization.data.group(data, [ tickedCheckBoxNumber[0] ] , [ tickedCheckBoxNumber[1] ]);
                    result = new google.visualization.data.group(data, [tickedCheckBoxNumber[0], tickedCheckBoxNumber[1]]);
                    console.log("Try try try in viewalldata.jsp");
                }
                catch(n)
                {
                    console.log("Catch in viewalldata.jsp: " + n);
                    //result = google.visualization.data.group(data, [0], [5]); // hardcoded values?
                }
            }
            //console.log("columnsToUse = " + columnsToUse);
            
            var table = new google.visualization.Table(document.getElementById('table_div'));
            table.draw(data, {width: '75%', height: '100%', page: 'enabled', allowHTML: 'true', columns: ''});
        }
         

        function createEditor() 
        {
            // Create the chart to edit.
            wrapper = new google.visualization.ChartWrapper({
            'chartType':'PieChart',
            'dataTable': result,
             
            'options': {'title':'Stats', 'legend':'none'}
             
            });
          

            chartEditor = new google.visualization.ChartEditor();
            google.visualization.events.addListener(chartEditor, 'ok', redrawChart);
          
            //imageURI = getChartWrapper().getChart().getImageURI();
               
        }
    

        // On "OK" save the chart to a <div> on the page.
        function redrawChart(){
          chartEditor.getChartWrapper().draw(document.getElementById('chart_div'));
          
          //For PDF
          //imageURI = chartEditor.getChartWrapper().getChart().getImageURI();
          
        }
        
        
        function loadEditor(){
            chartEditor.openDialog(wrapper, {});
            
        }
        
        
        function downloadPDF() {
            alert("hi1");
            
            var imgData;
            //imgData = charteditor.getChart().getImageURI();
            //imgData = chartEditor.getChartWrapper().getChart().getImageURI();

            
            alert("hi "+ imageURI);
            
            //var imgData = chart_div.innerHTML;
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
            };        
        }
       
        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/vivus/0.4.2/vivus.min.js" integrity="sha256-QkfKcx3kugootBtJEPpTKDsWEneddME3kXPoT5o3Yic=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        
        
    </body>
</html>
