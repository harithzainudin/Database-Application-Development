<title>Register New Team</title>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%

String team_name=request.getParameter("team_name");
String coach_name=request.getParameter("coach_name");
String capt_name=request.getParameter("capt_name");
String no_player=request.getParameter("no_player");

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

	stmt=conn.prepareStatement("insert into team_list values(?,?,?,?)");
	stmt.clearParameters();
	stmt.setString(1,team_name);
	stmt.setString(2,coach_name);
	stmt.setString(3,capt_name);
	stmt.setString(4,no_player);

	ResultSet rs = stmt.executeQuery();

	if(rs.next()){
	 %>
	  <center>
	  <h1>TEAM HAS BEEN SUCCESSFULLY ADDED INTO THE DATABASE!</h1>
	  <h4>Click the button to go to homepage or insert another team</h4>
	  <button id="homepage" onClick="">Homepage</button>
	  <script type="text/javascript">
	  document.getElementById("homepage").onclick = function () {
	  location.href = "homepage.html";
	  };
	  </script>

	  <button id="insertanotherteam" onClick="">Insert Another Team</button>
	  <script type="text/javascript">
	  document.getElementById("insertanotherteam").onclick = function () {
	  location.href = "registernewteam.html";
	  };
	  </script>
	  </center>
	<%
	}

	else {
	%>
	  <center>
	  <h1>THE TEAM THAT YOU HAVE ENTERED HAVE BEEN CREATED ALREADY!</h1>
	  <h4>Click the button to go to homepage or insert back another team</h4>
	  <button id="hp" onClick="">Homepage</button>
	  <script type="text/javascript">
	  document.getElementById("hp").onclick = function () {
	  location.href = "homepage.html";
	  };
	  </script>

	  <button id="team" onClick="">Insert Another Team</button>
	  <script type="text/javascript">
	  document.getElementById("team").onclick = function () {
	  location.href = "registernewteam.html";
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
	  <center>
	  <h1>THE TEAM THAT YOU HAVE ENTERED HAVE BEEN CREATED ALREADY!</h1>
	  <h4>Click the button to go to homepage or insert back another team</h4>
	  <button id="home" onClick="">Homepage</button>
	  <script type="text/javascript">
	  document.getElementById("home").onclick = function () {
	  location.href = "homepage.html";
	  };
	  </script>

	  <button id="another" onClick="">Insert Another Team</button>
	  <script type="text/javascript">
	  document.getElementById("another").onclick = function () {
	  location.href = "registernewteam.html";
	  };
	  </script>
	  </center>
	<%
	stmt.close();
	conn.close();
      } 
 
%>

	