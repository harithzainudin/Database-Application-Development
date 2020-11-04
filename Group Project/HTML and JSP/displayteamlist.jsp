<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "oracle.jdbc.driver.OracleDriver";
String hostname = "172.16.60.13";
int port = 1521;
String database = "orcl";
String connectionUrl = "jdbc:oracle:thin:@"+hostname+":"+port+":"+database;
String user = "D192171";
String password = "192171";

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>


<html>
<h1>Update team list</h1>
<table border="1">
<tr>
<td>Team Name</td>
<td>Coach Name</td>
<td>Captain Name</td>
<td>Number of Player</td>
</tr>

<button onclick="location.href='homepage.html'" type="button"><b>Back to Homepage</b> </button></br>

<%

try{
connection = DriverManager.getConnection(connectionUrl, user, password);
statement=connection.createStatement();
String sql ="select * from team_list";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("team_name") %></td>
<td><%=resultSet.getString("coach_name") %></td>
<td><%=resultSet.getString("capt_name") %></td>
<td><%=resultSet.getString("no_player") %></td>
<td><a href="updateteamlist.jsp?team_name=<%=resultSet.getString("team_name")%>">update</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>