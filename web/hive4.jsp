<%-- 
    Document   : hive2
    Created on : Jun 6, 2018, 9:18:36 PM
    Author     : nEW u
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cricket data analysis</title>
    </head>
    <body bgcolor="lightgreen">
        <center>
            <h1 style="background-color: black;color: limegreen;text-align:center;font-size: 300%">
                Players Who Scored Century
            </h1>
        </center>
    <center>
        <table border ="1" width="80%" target="_blank">
        <tr>
        <th style="text-align:center">Players</th>
        <th style="text-align:center">Runs</th>
        </tr>
         <%
            try
            {
                Class.forName("org.apache.hive.jdbc.HiveDriver");
                String url = "jdbc:hive2://192.168.232.128:10000/demo";
                Connection con = DriverManager.getConnection(url,"","");
                Statement stmt=con.createStatement();
                String q = "select playe_on_strike,SUM(runs_on_ball) as run from cricket GROUP BY playe_on_strike having run>75";
                ResultSet rs=stmt.executeQuery(q);
                while(rs.next())
                {
         %>
         <tr>
             <td style="text-align:center"><%=rs.getString(1)%> </td>
             <td style="text-align:center"><%=rs.getString(2)%> </td>
         </tr>
         <%
            }
}
            catch(Exception e)
            {
                out.println("Error :"+e.getMessage());
            }    
         %>
         </table>
         
         <img align="middle" src="full.jpg"  width="400" height="400" style="vertical-align: middle">
         </center>
    </body>
</html>
