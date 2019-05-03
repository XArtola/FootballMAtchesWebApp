<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost/footballmatches?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
			"dw18", "dw18");
	
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		int  wonLeagues; 
		
		String name, stadium, shirtColor;
		
		name=request.getParameter("txt_team_name");  //txt_team_name
		stadium=request.getParameter("txt_team_stadium"); //txt_team_stadium
		wonLeagues=Integer.parseInt(request.getParameter("txt_team_leagues")); //txt_team_team_leagues
		shirtColor=request.getParameter("txt_team_shirt"); //txt_team_shirt
		
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update teams set name=?, stadium=?, wonLeagues=?, shirtColor=? where name=?"); //sql update query 
		pstmt.setString(1,name);
		pstmt.setString(2,stadium);
		pstmt.setInt(3,wonLeagues);
		pstmt.setString(4,shirtColor);
		pstmt.setString(5,name);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("Update Successfully...! Click Back link."); //after update record successfully message
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>Update</title>
		
	<!--css for div main class and table-->
	<style type="text/css">
		
		.main
		{
			width:700px;;
			margin-left:250px;
			padding: 10px;
			border: 5px solid grey;
			
		}
		table
		{
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 600px;
		}
		td
		{
			border: 5px solid silver;
			text-align: left;
			padding: 8px;
		}
		</style>	
		
	</head>
	
<body>

	<div class="main">

	<form method="post" name="myform" ">
		
			<h1>Update Record</h1>
		
		
		<table>	
		   <%
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); //load driver  
		
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost/footballmatches?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"dw18", "dw18");	
			if(request.getParameter("edit")!=null) 
			{
				String name=request.getParameter("edit");
		
				String stadium,wonLeagues,shirtColor;
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from teams where name=?"); // sql select query
				pstmt.setString(1,name);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					stadium=rs.getString(2);
					wonLeagues=rs.getString(3);
					shirtColor=rs.getString(4);
			%>
			<tr>
				<td>Name</td>
				<td><input type="text" name="txt_team_name" value="<%=name%>"></td>
			</tr>
			
			<tr>
				<td>Stadium</td>
				<td><input type="text" name="txt_team_stadiumr" value="<%=stadium%>"></td>
			</tr>
			
			<tr>
				<td>Won Leagues</td>
				<td><input type="text" name="txt_team_leagues" value="<%=wonLeagues%>"></td>
			</tr>
			
			<tr>
				<td>Shirt Color</td>
				<td><input type="text" name="txt_team_shirt" value="<%=shirtColor%>"></td>
			</tr>	
			
			<tr>
				<td><input type="submit" name="btn_update" value="Update"></td>	
			</tr>
				
				<!--  <input type="hidden" name="txt_hide" value="<%=name%>"> -->
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		
	
				<h1><a href="index.jsp"><input type="button" value="Back"></a></h1>
	
		
	</form>

	</div>
	
	
		

</body>

</html>