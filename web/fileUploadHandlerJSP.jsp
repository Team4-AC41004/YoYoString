<%-- 
    Document   : fileUploadHandlerJSP.jsp
    Created on : 28-Sep-2017, 12:21:02
    Author     : Philipp
    Jars required: (located in lib folder)
    commons-fileupload-1.3.3.jar
    commons-io-2.5.jar
--%>

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
   File file ;
   int maxFileSize = 50000 * 1024;
   int maxMemSize = 50000 * 1024;
   String filePath = "c:/apache-tomcat-8/"; // TODO: change to zeno

   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) 
   {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File("c:\\temp"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
      try
      { 
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();
         out.println("<html>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )  
            {
                String fieldName = fi.getFieldName();
                String fileName = fi.getName();
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();
                file = new File( filePath + fileName ) ; // adjust filename?
                fi.write( file ) ;
                //out.println("Uploaded Filename: " + filePath + fileName + "<br>"); // Shows filepath for Dev, prob shouldnt show to user.
                out.println("Success! Uploaded the file: " + fileName + "<br>"); 
                //String navlink = '"nav-link"';
                //out.println( '<a class="nav-link" href="./">Home <span class="sr-only">(current)</span></a>' );
                
            }
         }
         out.println("</body>");
         out.println("</html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      out.println("<html>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>
<br>
<a class="nav-link" href="./">Home</a>