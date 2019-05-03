<%@page import="java.sql.*"%>

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost/footballmatches?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
			"dw18", "dw18");
	if(request.getParameter("delete")!=null)
	{
		String name=request.getParameter("delete");
		
		PreparedStatement pstmt=null; //create statement
	switch(request.getParameter("selection")){
	case "teams":
		pstmt=con.prepareStatement("delete from teams where name=? "); //sql delete query
		pstmt.setString(1,name);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //close connection
		break;
	case "players":
		pstmt=con.prepareStatement("delete from players where name=? "); //sql delete query
		pstmt.setString(1,name);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //close connection
		break;
	case "matches":
		pstmt=con.prepareStatement("delete from matches where matchID=? "); //sql delete query
		pstmt.setString(1,name);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //close connection
		break;
	}
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
<html>

<head>

<title>index</title>

<!--css for div main class and table -->
<style type="text/css">
.main {
	width: 700px;;
	margin-left: 250px;
	padding: 10px;
	border: 5px solid grey;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 600px;
}

td {
	border: 5px solid silver;
	text-align: center;
	padding: 8px;
}
</style>


</head>

<body>
	<div class="main">

		<table>

			<tr>
				<th>Name</th>
				<th>Stadium</th>
				<th>Won Leagues</th>
				<th>Shirt Color</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<%
		
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");  //load driver 
			
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost/footballmatches?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"dw18", "dw18");
			PreparedStatement pstmt=null; //create statement
		
			pstmt=con.prepareStatement("select * from teams"); //sql select query  
			
			ResultSet rs=pstmt.executeQuery(); //execute query and set in resultset object rs.  
		
			while(rs.next())
			{	
		%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getInt(3)%></td>
				<td><%=rs.getString(4)%></td>

				<td><a href="update.jsp?edit=<%=rs.getString(1)%> ">Modify</a></td>
				<td><a href="?delete=<%=rs.getString(1)%> ">Delete</a></td>

			</tr>
			<%
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>

		</table>

		<h1>
			<a href="add.jsp"><input type="button" value="Add new team"></a>
		</h1>


	</div>

</body>

</html>