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
	
	stmt=conn.prepareStatement("select * from game_place");

	ResultSet rs = stmt.executeQuery();
	conn.commit();

	int ctr = 1;
	out.println("<h1>ALL GAME'S PLACE LIST</h1>");
	out.println("<table border = 1>");
	out.println("<tr><th>No.</th><th>HOME</th><th>AWAY</th><th>VENUE</th>");
		while (rs.next()) {
	         out.println("<tr><td>" + ctr + "</td><td> " + rs.getString(1) + "</td><td> " + rs.getString(2) + "</td><td> " + rs.getString(3) + "</td>");  
                            out.println("</tr>");
                            ctr = ctr + 1;
               }
%>
<button id="hp" onClick="">Homepage</button>
	  <script type="text/javascript">
	  document.getElementById("hp").onclick = function () {
	  location.href = "homepage.html";
	  };
	  </script>
<%
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

	