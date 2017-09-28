<%-- 
    Document   : googlemapTest
    Created on : Sep 26, 2017, 4:56:34 PM
    Author     : Admin
--%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="css/index.css"/>
    
    <title>Heatmaps</title>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $.datepickermap.setDefaults({
                    minDate: new Date(2015, 7, 24),
                    maxDate: "+1d",
                    changeYear: true,
                    altFormat: "yy-mm-dd",
                    dateFormat: "yy-mm-dd"
                });
                $("#startdatepickermap").datepickermap({
                    defaultDate: new Date(2015, 7, 24)
                });
                $("#enddatepickermap").datepickermap();
            });
        </script>
    
    
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #floating-panel {
        background-color: #fff;
        border: 1px solid #999;
        left: 25%;
        padding: 5px;
        position: absolute;
        top: 10px;
        z-index: 5;
      }
    </style>
  </head>

  <body>
      
      <!-- form here -->
      <div class="jumbotron"> 
      <hr class="my-2"/>   
      <form action="GoogleMapTest" method="POST">
        <h1 class="display-4"> Search Options</h1> <br/>
        
        <!---------------------------- PART 1 START ------------------------------>
              
            <div class="form-group">
                <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" id="datecheckmap" checked value="1">
                        Search By Date
                </label>
            </div>
              
            <div class="form-group " id="enabledatemap">
                <label for="startdatepickermap"> Start Date</label>
                <input type="text" class="form-control" name = "startdatepickermap" id="startdatepickermap" placeholder="2000/01/01" required>

                <label for="enddatepickermap"> End Date </label> 
                <input type="text" class="form-control" name = "enddatepickermap" id="enddatepickermap" placeholder="2085/12/31" required> 
            </div>
        <!---------------------------- PART 1 END ------------------------------>
        
        <!---------------------------- PART 2 START ------------------------------>
            
            <div class="form-group">
                <label class="form-check-label">
                    <!--<input class="form-check-input" type="checkbox" id="usercheckmap" checked value="1">-->
                        Search By User
                    </label>
            </div>
            
                <div class="input-group">
                    <span class="input-group-addon" id="sizing-addon2">dusa-</span>
                    <input type="text" name = "useridmap" id="useridmap" class="form-control" placeholder="0001" aria-label="Username" aria-describedby="sizing-addon2" required>
                </div>
        <!---------------------------- PART 2 START ------------------------------>


        <br>
            <button type="submit" class="btn btn-info">Search</button>
      </div>
        
      </form>
      </div>
      
    <div id="floating-panel">
      <button onclick="toggleHeatmap()">Toggle Heatmap</button>
      <button onclick="changeGradient()">Change gradient</button>
      <button onclick="changeRadius()">Change radius</button>
      <button onclick="changeOpacity()">Change opacity</button>
    </div><br>
    <div id="map"></div>
    
    
    <script>
        document.getElementById('datecheckmap').onchange = function() {
        document.getElementById('enddatepickermap').disabled = !this.checked;
        document.getElementById('startdatepickermap').disabled = !this.checked;
        document.getElementById('enddatepickermap').value = "";
        document.getElementById('startdatepickermap').value = "";
        $("#enabledatemap").toggle("fast");
        };  
    </script>
    
    <script>

      // This example requires the Visualization library. Include the libraries=visualization
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdwJhTVFab_pHQL_Kgaavyna3hpQ_U1pY&libraries=visualization">

      var map, heatmap;
        

      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          center: {lat: 56.46492, lng: -3.01256}, // center: {lat: 37.775, lng: -122.434},  56.46492, -3.01256
          mapTypeId: 'roadmap'
        });

        heatmap = new google.maps.visualization.HeatmapLayer({
          data: getPoints(),
          map: map
        });
        
        //TEST
        console.log("Get points method Returns: " + getPoints());
        
      }

      function toggleHeatmap() {
        heatmap.setMap(heatmap.getMap() ? null : map);
      }

      function changeGradient() {
        var gradient = [
          'rgba(0, 255, 255, 0)',
          'rgba(0, 255, 255, 1)',
          'rgba(0, 191, 255, 1)',
          'rgba(0, 127, 255, 1)',
          'rgba(0, 63, 255, 1)',
          'rgba(0, 0, 255, 1)',
          'rgba(0, 0, 223, 1)',
          'rgba(0, 0, 191, 1)',
          'rgba(0, 0, 159, 1)',
          'rgba(0, 0, 127, 1)',
          'rgba(63, 0, 91, 1)',
          'rgba(127, 0, 63, 1)',
          'rgba(191, 0, 31, 1)',
          'rgba(255, 0, 0, 1)'
        ]
        heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
      }

      function changeRadius() {
        heatmap.set('radius', heatmap.get('radius') ? null : 20);
      }

      function changeOpacity() {
        heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
      }

      // Heatmap data: 500 Points
      function getPoints() {
          
         var pointdata = []; //= new google.visualization.DataTable();
         //var pointdata = new google.visualization.DataTable();
         //var pointArray = new google.maps.MVCArray();
         //var pointdata = [
         //   new google.maps.LatLng(0.0,0.0)
         //];
         
        //20 options
        var coords = [
                [56.45769, -2.98248],
                [56.45774, -2.97946],
                [56.45847, -2.97942],
                [56.45654, -2.98385],
                [56.45654, -2.98385],
                [0, 0],
                [0, 0],
                [0, 0],
                [56.45773, -2.98198],
                [56.4576, -2.98243],
                [56.45779, -2.98216],
                [56.45763, -2.98189],
                [56.45809, -2.98096],
                [56.45754, -2.982],
                [56.46356, -3.03916],
                [0, 0],
                [56.45778, -2.98259],
                [56.45778, -2.98259],
                [0, 0],
                [0, 0]
        ];
        
        var userJourneyPoints = <%=request.getAttribute("userJourneyPoints")%>; 
        var coordsToUse = []; 
           
          // alert("userJourneyPoints JSON length: " + userJourneyPoints.length);
          //alert("userJourneyPoints JSON outlet name at 0 " + userJourneyPoints[0].OutletName);
           
            
        for (var i=0; i<userJourneyPoints.length; i++){
            
            //alert("userJourneyPoints JSON: " + userJourneyPoints[1].OutletName);
            switch(userJourneyPoints[i].OutletName) {
            case "Air Bar":
                coordsToUse[i] = 0;
                break;
            case "College Shop":
                coordsToUse[i] = 1;
                break;
            case "Dental Cafe":
                coordsToUse[i] = 2;
                break;
            case "DJCAD Cantina":
                coordsToUse[i] = 3;
                break;
            case "DOJ Catering":
                coordsToUse[i] = 4;
                break;
            case "DUSA The Union - Marketplace":
                coordsToUse[i] = 5;
                break;
            case "DUSA The Union Online":
                coordsToUse[i] = 6;
                break;
            case "Ents":
                coordsToUse[i] = 7;
                break;
            case "Floor Five":
                coordsToUse[i] = 8;
                break;
            case "Food on Four":
                coordsToUse[i] = 9;
                break;
            case "Level 2, Reception":
                coordsToUse[i] = 10;
                break;
            case "Liar Bar":
                coordsToUse[i] = 11;
                break;
            case "Library":
                coordsToUse[i] = 12;
                break;
            case "Mono":
                coordsToUse[i] = 13;
                break;
            case "Ninewells Shop":
                coordsToUse[i] = 14;
                break;
            case "Online Dundee University Students Association":
                coordsToUse[i] = 15;
                break;
            case "Premier Shop - Yoyo Accept":
                coordsToUse[i] = 16;
                break;
            case "Premier Shop":
                coordsToUse[i] = 17;
                break;
            case "Remote Campus Shop":
                coordsToUse[i] = 18;
                break;
            case "Spare":
                coordsToUse[i] = 19;
                break;
            default:
                //code block;
            }
        }
        
        
        for (var i=0; i< userJourneyPoints.length; i++) {
            
            var lat = coords[coordsToUse[i]][0];
            lat = parseFloat(lat);
            //var otherlat = lat.toFixed(5);
            //parseFloat(lat);
            
            var lng = coords[coordsToUse[i]][1];
            lng = parseFloat(lng);
            //var otherlng = lng.toFixed(5);
            //parseFloat(lng);
            
            if (lat===0){    
            }
            else{
            var latLng = new google.maps.LatLng(lat, lng);
            pointdata.push(latLng);
                
            }
            
            //var latLng = new google.maps.LatLng(lat, lng);
            //pointdata.push(latLng);
            //var latLng = new google.maps.LatLng( { lat:coords[coordsToUse[i]][0], lng: coords[coordsToUse[i]][1]} );
            //alert("latLng push: " + latLng);
            
            if (i===0){
                console.log("lattitude passed in 1st coord: " + lat);
                console.log("longitude passed in 1st coord:  " + lng);
                
                console.log("1st coord: " + latLng);
            }
            
        }
        
        //console.log(pointdata);
    
        return [     
           pointdata
           
           //new google.maps.LatLng(56.45769, -2.98248),
           //new google.maps.LatLng(56.45769, -2.98248),
           //new google.maps.LatLng(56.45769, -2.98248),
           //new google.maps.LatLng(56.45769, -2.98248),
           //new google.maps.LatLng(56.45769, -2.98248),
           //new google.maps.LatLng(56, -2)
           
         /* 
         new google.maps.LatLng(coords[coordsToUse[0]], coords[coordsToUse[0]]),
         new google.maps.LatLng(coords[coordsToUse[1]], coords[coordsToUse[10]]),
         new google.maps.LatLng(coords[coordsToUse[2]], coords[coordsToUse[2]]),
         new google.maps.LatLng(coords[coordsToUse[3]], coords[coordsToUse[3]]),
         new google.maps.LatLng(coords[coordsToUse[4]], coords[coordsToUse[4]]),
         new google.maps.LatLng(coords[coordsToUse[5]], coords[coordsToUse[5]]),
         new google.maps.LatLng(coords[coordsToUse[6]], coords[coordsToUse[6]]),
         new google.maps.LatLng(coords[coordsToUse[7]], coords[coordsToUse[7]]),
         new google.maps.LatLng(coords[coordsToUse[8]], coords[coordsToUse[8]])
          */
        ];
      }
    </script>
     <script async defer
        
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdwJhTVFab_pHQL_Kgaavyna3hpQ_U1pY&libraries=visualization&callback=initMap">
    </script>
    
     <!--src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdwJhTVFab_pHQL_Kgaavyna3hpQ_U1pY&libraries=visualization&callback=initMap">-->
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vivus/0.4.2/vivus.min.js" integrity="sha256-QkfKcx3kugootBtJEPpTKDsWEneddME3kXPoT5o3Yic=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        
  </body>
</html>
