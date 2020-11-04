<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String team_name = request.getParameter("team_name");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl, user, password);
statement=connection.createStatement();
String sql ="select * from team_list where team_name ="+ team_name;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database</h1>
<form method="post" action="updateteamlistprocess.jsp">
<input type="hidden" name="team_name" value="<%=resultSet.getString("team_name") %>">
<input type="text" name="team_name" value="<%=resultSet.getString("team_name") %>">
<br>
Coach Name:<br>
<input type="text" name="coach_name" value="<%=resultSet.getString("coach_name") %>">
<br>
Last name:<br>
<input type="text" name="capt_name" value="<%=resultSet.getString("capt_name") %>">
<br>
City name:<br>
<input type="text" name="no_player" value="<%=resultSet.getString("no_player") %>">
<br><br>
<input type="submit" value="submit">
<button onclick="location.href='homepage.html'" type="button"><b>Back</b> </button></br>
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>