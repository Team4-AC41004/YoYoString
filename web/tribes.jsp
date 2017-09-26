<%-- 
    Document   : tribes
    Created on : 25-Sep-2017, 10:56:41
    Author     : Think
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        <div class="container" style="margin-top: 2.5%;">
            <div class="row">
                <div class="col">
                    <h1 class="display-4">Available Tribes:</h1>
                    <hr class="my-2"/>
                </div>
            </div>
            <div class="row">
                <div class="col-4 jumbotron">
                    <div class="list-group " id="list-tab" role="tablist">
                        <a class="list-group-item list-group-item-action active" id="list-1" data-toggle="list" href="#1" role="tab" aria-controls="1">The Nightowl</a>
                        <a class="list-group-item list-group-item-action" id="list-2" data-toggle="list" href="#2" role="tab" aria-controls="2">The Daybreaker</a>
                        <a class="list-group-item list-group-item-action" id="list-3" data-toggle="list" href="#3" role="tab" aria-controls="3">The Bookworm</a>
                        <a class="list-group-item list-group-item-action" id="list-4" data-toggle="list" href="#4" role="tab" aria-controls="4">The Medical Marvel</a>
                        <a class="list-group-item list-group-item-action" id="list-5" data-toggle="list" href="#5" role="tab" aria-controls="5">The Mono Maniac</a>
                        <a class="list-group-item list-group-item-action" id="list-6" data-toggle="list" href="#6" role="tab" aria-controls="6">The Air-Bar Advocate</a>
                        <a class="list-group-item list-group-item-action" id="list-7" data-toggle="list" href="#7" role="tab" aria-controls="7">The Liar Bar Lover</a>
                        <a class="list-group-item list-group-item-action" id="list-8" data-toggle="list" href="#8" role="tab" aria-controls="8">The Foodie on Four</a>
                    </div>
                </div>
                <div class="col-8 jumbotron">
                    <div class="tab-content" style="overflow-y: scroll; height: 400px;"id="nav-tabContent">
                        <div class="tab-pane fade show active" id="1" role="tabpanel" aria-labelledby="list-home-list" >
                            <img class="rounded float-right" src="img/nightowl.png" style="width: 200px; height: 200px;"/>
                            <h2> The Night Owl:</h2> <br/>
                            <p> Late Nights; Hard Work, and Caffeine - The Driving forces for this user are a quiet
                                shopping experience free from the stresses of day-to-day rigamarole. Making the most
                                of the peace and quiet provided at the Library, they are happy to go a bit further to
                                ensure they're not bothered.</p><hr class="my-2"/>
                          
                            <a class="btn btn-info" href="NightOwls" class="btn btn-info">View Night Owls</a>
                            

                        </div>
                        <div class="tab-pane fade" id="2" role="tabpanel" aria-labelledby="list-profile-list">
                            <img class="rounded float-right" src="img/daybreakers.png" style="width:200px; height:200px;"/>
                            <h2> The Daybreaker </h2> <br/>
                            <p> First to wake, first to bed - That's the motto of the Early Risers up and about
                                before the rest of us have woken up for the day. Whether it's compiling data, 
                                taking photos or making breakfast, the Daybreaker makes sure to get the most 
                                of the magic hours where humanity sleeps, but the world moves.</p><hr class="my-2"/>
                            <a class="btn btn-info" href="DayBreakers">View Daybreakers</a>
                        </div>
                        <div class="tab-pane fade" id="3" role="tabpanel" aria-labelledby="list-messages-list">
                            <img class="rounded float-right" src="img/bookworm.png" style="width: 200px; height:200px;"/>
                            <h2> The Bookworm </h2><br/>
                            <p> The Library's the place to be - a bookworm knows this and when you've got your head in a book you 
                                need a warm drink to keep you going! A large number of this users transactions have taken place in
                                the library.</p><hr class='my-2'/>
                            <a class="btn btn-info" href="bookworms">View BookWorms</a>
                        </div>
                        <div class="tab-pane fade" id="4" role="tabpanel" aria-labelledby="list-settings-list">DAYS</div>
                        <div class="tab-pane fade" id="5" role="tabpanel" aria-labelledby="list-home-list">BREAK</div>
                        <div class="tab-pane fade" id="6" role="tabpanel" aria-labelledby="list-profile-list">DOWN</div>
                        <div class="tab-pane fade" id="7" role="tabpanel" aria-labelledby="list-messages-list">GREATO</div>
                        <div class="tab-pane fade" id="8" role="tabpanel" aria-labelledby="list-settings-list">DAYZ</div>
                    </div>
                </div>
                <script>
                    $('#myList a').click(function (e) {
                        e.preventDefault()
                        $(this).tab('show')
                    })
                </script>
            </div>
        </div>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/vivus/0.4.2/vivus.min.js" integrity="sha256-QkfKcx3kugootBtJEPpTKDsWEneddME3kXPoT5o3Yic=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

    </body>
</html>
