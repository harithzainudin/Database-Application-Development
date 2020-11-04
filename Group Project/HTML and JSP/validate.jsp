<html>
<head>
<title> Validating info </title>
</head>

<body>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%

//Create an empty new variable 
String username = request.getParameter("username");
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

	//Make the query
	stmt=conn.prepareStatement("select * from user_acc where username=? and pswrd=?");
	stmt.setString(1,username);
	stmt.setString(2,password);

	ResultSet rs = stmt.executeQuery();
	if(rs.next()) {
	  String redirectURL = "homepage.html";
	  response.sendRedirect(redirectURL);
	}
	else {
	%>
	  <center>
	  <h1> ERROR INFO! </h1>
	  <p> You have entered either wrong username or password, click the button to go back to login page</p>
	  <button id="goback" onClick=""> Go back </button>
	  <script type="text/javascript">
    	  document.getElementById("goback").onclick = function () {
          location.href = "login.html";
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
	out.println("<p><b> Could not login. </b></p>");
	stmt.close();
	conn.close();
  } 
 
%>

</body>
</html>