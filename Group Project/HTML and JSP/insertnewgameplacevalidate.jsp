<title> New Game Schedule</title>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%

//Create an empty new variable 
String message = null;
String home = request.getParameter("home");
String away = request.getParameter("away");
String venue = request.getParameter("venue");

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
	
	// Make the query
	stmt=conn.prepareStatement("insert into game_place values(?,?,?)");
	stmt.clearParameters();
	stmt.setString(1,home);
	stmt.setString(2,away);
	stmt.setString(3,venue);

	//Run the query
	ResultSet rs = stmt.executeQuery();

	if(rs.next()){
	 %>
	  <center>
	  <h1>SUCCESS!</h1>
	  <p> The game place have been inserted into the database</p>
	  <p>Click the button to go to the login page</p>
	  <button id="button" onClick="">Homepage</button>
	  <script type="text/javascript">
	  document.getElementById("button").onclick = function () {
	  location.href = "homepage.html";
	  };
	  </script>

	  <button id="new" onClick="">New Game Place</button>
	  <script type="text/javascript">
	  document.getElementById("new").onclick = function () {
	  location.href = "insertnewgameplace.jsp";
	  };
	  </script>
	  </center>
	<%
	}

	else {
	%>
	  <center>
	  <h1>UNSUCCESS!</h1>
	  <p>The game place have not been inserted into the database</p>
	  <p>You can try insert again or go back to homepage</p>
	  <button id="goback" onClick="">Go Back</button>
	  <script type="text/javascript">
	  document.getElementById("goback").onclick = function () {
	  location.href = "insertnewgameplace.jsp";
	  };
	  </script>

	  <button id="home" onClick="">Homepage</button>
	  <script type="text/javascript">
	  document.getElementById("home").onclick = function () {
	  location.href = "homepage.html";
	  };
	  </script>
	  </center>
	<%
	}

	conn.commit();
  
	//Close the database connection
	stmt.close();
	conn.close();
    } catch (SQLException ex) {		
	out.println("<p><b> Please re-enter again. </b></p>");
	%>
	  <h1>UNSUCCESS!</h1>
	  <p>The game place have not been inserted into the database</p>
	  <p>You can try insert again or go back to homepage</p>
	  
	  <button id="hp" onClick="">Homepage</button>
	  <script type="text/javascript">
	  document.getElementById("hp").onclick = function () {
	  location.href = "homepage.html";
	  };
	  </script>

	  <button id="back" onClick="">Insert New Game Place</button>
	  <script type="text/javascript">
	  document.getElementById("back").onclick = function () {
	  location.href = "insertnewgameplace.jsp";
	  };
	  </script>
	<%
	stmt.close();
	conn.close();
      } 
 
%>
