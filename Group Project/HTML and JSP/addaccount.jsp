<title> Create New Account</title>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%

//Create an empty new variable 
String message = null;
String user_id = request.getParameter("id");
String username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password");

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
	stmt=conn.prepareStatement("insert into user_acc values(?,?,?,?)");
	stmt.clearParameters();
	stmt.setString(1,user_id);
	stmt.setString(2,username);
	stmt.setString(3,email);
	stmt.setString(4,password);

	//Run the query
	ResultSet rs = stmt.executeQuery();

	if(rs.next()){
	 %>
	  <center>
	  <h1>YOU HAVE BEEN REGISTERED!</h1>
	  <h4>Click the button to go to the login page</h4>
	  <button id="button" onClick="">Login</button>
	  <script type="text/javascript">
	  document.getElementById("button").onclick = function () {
	  location.href = "login.html";
	  };
	  </script>
	  </center>
	<%
	}

	else {
	%>
	  <center>
	  <h1>THE INFO THAT YOU HAVE ENTERED HAVE BEEN CREATED ALREADY!</h1>
	  <h4>Click the button to go back creating your account</h4>
	  <button id="button" onClick="">Go Back</button>
	  <script type="text/javascript">
	  document.getElementById("button").onclick = function () {
	  location.href = "addaccount.html";
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
	<h1 align="center">THE INFO THAT YOU HAVE ENTERED HAVE BEEN CREATED ALREADY!</h1>
	  <h4 align="center">Click the button to go back creating your account</h4>
	  <button id="button" onClick="">Go Back</button>
	  <script type="text/javascript">
	  document.getElementById("button").onclick = function () {
	  location.href = "addaccount.html";
	  };
	  </script>
	<%
	stmt.close();
	conn.close();
      } 
 
%>
