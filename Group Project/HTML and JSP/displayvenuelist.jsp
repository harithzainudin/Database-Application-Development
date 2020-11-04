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
	
	stmt=conn.prepareStatement("select * from venue_list");
	ResultSet rs = stmt.executeQuery();
	conn.commit();

%>
<title> Football Venue's List</title>
<h1>FOOTBALL VENUE'S LIST</h1>
<table border="1">
<tr>
	<th>Venue Name</th>
	<th>Venue Capacity</th>
</tr>
<button onclick="location.href='homepage.html'" type="button"><b>Back</b> </button></br>

<%
int i=0;

while(rs.next()) {
%>
<tr>
	<td><%=rs.getString("venue_name") %></td>
	<td><%=rs.getString("venue_capacity") %></td>

</tr>
<%
i++;
}
	//Close the database connection
	stmt.close();
	conn.close();

    } catch (SQLException ex) {		
	out.println("<p><b> Unable to connect to database. </b></p>");
	%>
	  <center>
	  <h1>Click the button to go back!</h1>
	  <button type="button" id="back"><-BACK</button>
	  <script type="text/javascript">
	  document.getElementById("back").onclick = function () {
	  location.href = "homepage.html";
	  };
	  </script>
	  </center>
	<%
	stmt.close();
	conn.close();
      } 
 
%>

	