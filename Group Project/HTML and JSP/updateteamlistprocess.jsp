<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "oracle.jdbc.driver.OracleDriver";%>
<%!String url = "jdbc:oracle:thin:@"+"172.16.60.13"+":"+"1521"+":"+"orcl";%>
<%!String user = "D192171";%>
<%!String password = "192171";%>
<%
String team_name = request.getParameter("team_name");
String coach_name=request.getParameter("coach_name");
String capt_name=request.getParameter("capt_name");
String no_player=request.getParameter("no_player");
if(team_name != null)
{
Connection con = null;
PreparedStatement ps = null;
int USER = Integer.parseInt(team_name);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,password);
String sql="Update team_list set team_name=?,coach_name=?,capt_name=?,no_player=? where team_name="+team_name;
ps = con.prepareStatement(sql);
ps.setString(1,team_name);
ps.setString(2, coach_name);
ps.setString(3, capt_name);
ps.setString(4, no_player);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>