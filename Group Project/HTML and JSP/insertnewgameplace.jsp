<title>Insert New Game Schedule</title>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%

PreparedStatement stmt = null;
Connection conn = null;   
try {
	//Connect to the database
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String hostname = "172.16.60.13";
	int port = 1521;
	String sid = "orcl";
	String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
	String user = "d192171";
	String pass = "192171";
	conn = DriverManager.getConnection(oracleURL, user, pass);

	stmt=conn.prepareStatement("select * from team_list");
	stmt.clearParameters();
	ResultSet rs = stmt.executeQuery();
%>
<h1 align="center">NEW GAME PLACE FORM</h1>
<p align="center"> Please fill in this form to insert new game place</p>

<form align="center" action="insertnewgameplacevalidate.jsp" method="post">
<p align="center">HOME
<select name="home" onmousedown="if(this.options.length>8){this.size=8;}"  onchange='this.size=0;' onblur="this.size=0;" required>
<% while (rs.next()) {
String home = rs.getString("team_name"); %>
<option value="<%=home %>"><%=home %></option>
<% }
%>
</select>
</p>

<%
stmt=conn.prepareStatement("select * from team_list");
stmt.clearParameters();
ResultSet result = stmt.executeQuery();
%>

<p align="center">AWAY
<select name="away" onmousedown="if(this.options.length>8){this.size=8;}"  onchange='this.size=0;' onblur="this.size=0;"required>
<% while (result.next()) {
String away = result.getString("team_name"); %>
<option value="<%=away %>"><%=away %></option>
<% }
%>
</select>
</p>

<%
stmt=conn.prepareStatement("select * from venue_list");
stmt.clearParameters();
ResultSet set = stmt.executeQuery();
%>

<p align="center">VENUE
<select name="venue" onmousedown="if(this.options.length>8){this.size=8;}"  onchange='this.size=0;' onblur="this.size=0;" required>
<% while (set.next()) {
String venue = set.getString("venue_name"); %>
<option value="<%=venue %>"><%=venue %></option>
<% }
%>
</select>
</p>

<center>
<input type="submit">
<input type="reset">
<button type="button" id="cancel">Cancel</button>
<script type="text/javascript">
document.getElementById("cancel").onclick = function () {
location.href = "homepage.html";
};
</script>

</center>
</form>
<%
	conn.commit();
  
	//Close the database connection
	stmt.close();
	conn.close();
    } catch (SQLException ex) {		
	out.println("<p><b> Cannot read database </b></p>");
	%>
	  <center>
	  <h1>SORRT INTERNAL ERROR!</h1>
	  <h4>Click the button to go to homepage</h4>
	  <button id="home" onClick="">Homepage</button>
	  <script type="text/javascript">
	  document.getElementById("home").onclick = function () {
	  location.href = "homepage.html";
	  };
	  </script>
	  </center>
	<%
	stmt.close();
	conn.close();
      } 
 
%>

	