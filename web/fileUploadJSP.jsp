<html>
    <body>
        Choose the spreadsheet you want to upload, then press upload. <br><br>
        <form action="fileUploadHandlerJSP.jsp" method="post" enctype="multipart/form-data">
        <input type="file" name="file" size="50" accept=".xlsx" />
        <br /><br>
        <input type="submit" value="Upload File" />
        </form>
        <br>
        <a class="nav-link" href="./">Return to Homescreen</a>
    </body>
</html>