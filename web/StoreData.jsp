<%-- 
    Document   : customerinfo
    Created on : 26-Sep-2017, 10:08:44
    Author     : Think
--%>

<%@page import="Util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <title>Customer Info</title>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src="js/html2canvas.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.2/jspdf.plugin.autotable.js"></script>

        <link rel="stylesheet" href="css/index.css"/>

    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        <% String ID = request.getParameter("id");%><br/>
        <a class="btn btn-success" style="position: fixed; z-index: 9999;"href="javascript:genPDF()">Download PDF</a>  
        <div class="container" style="margin-top: 2.5%;">
            <div class="row">
                <div class="col">
                    <h1 class="display-4">Viewing Details for Store <%=ID%>:</h1>

                </div>
            </div>

            <div class="row">
                <div class="col" id="toggle" style="cursor: pointer;">
                    <h2> Transactions for User: </h2><p class="text-muted">(Click to Show/Hide)</p>
                    <hr class="my-2"/>
                </div>
            </div>


            <div class="row" id="togglesection">
                <div class="col">
                    <table class="table table-hover" id="stores">
                        <thead class="thead-dark">
                            <tr>
                                <th>Transaction Date</th>
                                <th>Store ID</th>
                                <th>Store Name</th>
                                <th>Customer ID</th>
                                <th>Transaction Type</th>
                                <th>Cash Spent</th>
                                <th>Discount</th>
                                <th>Total</th>
                                <th>Transaction ID #</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Connection conn = null;
                                conn = DBConnection.createConnection();
                                Statement stmt = null;
                                stmt = conn.createStatement();
                                stmt = null;
                                stmt = conn.createStatement();
                                ResultSet rs = null;
                                String query7 = "SELECT * FROM disbursals WHERE OutletName='" + ID + "'ORDER BY TransactionID DESC LIMIT 0, 500;";
                                rs = stmt.executeQuery(query7);
                                int count = 5000;
                                int inc = 0;
                                while (rs.next() && inc < count) {
                            %>
                            <tr>
                                <%
                                    Date date = rs.getDate("DateAndTime");
                                    int id = rs.getInt("OutletRef");
                                    String name = rs.getString("OutletName");
                                    String userid = rs.getString("UserID");
                                    String transtype = rs.getString("TransactionType");
                                    float cashspent = rs.getFloat("CashSpent");
                                    float discount = rs.getFloat("Discount");
                                    float total = rs.getFloat("Total");
                                    int transactionid = rs.getInt("TransactionID");
                                    inc += 1;
                                %>
                                <td scope="row"><%=date%></td>
                                <td><%=id%></td>
                                <td class="storeid"><%=name%></td>
                                <td class="userid"><%=userid%></td>
                                <td><%=transtype%></td>
                                <td><%=cashspent%></td>
                                <td><%=discount%></td>
                                <td><%=total%></td>
                                <td><%=transactionid%></td>
                            </tr>
                        <script>
                            $(".userid").each(function () {
                                var innertext = $(this).text();
                                $(this).wrapInner("<a href=\"" + "CustomerInfo?id=" + encodeURI(innertext) + "\"></a>");
                            });
                        </script>
                        <%}

                            conn.close();%>

                        </tbody>
                    </table>

                    <script>
                        $("#toggle").click(function () {
                            $("#togglesection").toggle("slow");
                        });
                        $("#toggle2").click(function () {
                            $("#togglesection2").toggle("slow");
                        });
                    </script>

                    <script type="text/javascript">
                        //code from https://stackoverflow.com/questions/23035858/export-html-table-to-pdf-using-jspdf#23056299
                        function genPDF() {
                            var doc = new jsPDF('p', 'pt');
                            var elem = document.getElementById("stores");
                            var res = doc.autoTableHtmlToJson(elem);
                            doc.autoTable(res.columns, res.data);
                            doc.save("table.pdf");
                        }
                    </script>

                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vivus/0.4.2/vivus.min.js" integrity="sha256-QkfKcx3kugootBtJEPpTKDsWEneddME3kXPoT5o3Yic=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    </body>
</html>
