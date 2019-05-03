<%@ page import="java.sql.*" %>  

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost/footballmatches?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
			"dw18", "dw18");

	if(request.getParameter("btn_add")!=null) //check button click event not null
	{
		String name,stadium,leagues,shirt;
		
		name=request.getParameter("txt_team_name"); //txt_name 
		stadium=request.getParameter("txt_team_stadium"); //txt_stadium
		leagues=request.getParameter("txt_team_leagues"); //txt_leagues
		shirt=request.getParameter("txt_team_shirt"); //txt_shirt
	
		PreparedStatement pstmt=null; //create statement 
		
		pstmt=con.prepareStatement("insert into teams(name,stadium,wonLeagues,shirtColor)values(?,?,?,?)"); //sql insert query 
		pstmt.setString(1,name); 
		pstmt.setString(2,stadium);
		pstmt.setString(3,leagues);	
		pstmt.setString(4,shirt);	
		pstmt.executeUpdate(); //execute query
		
		con.close();  //close connection 
		
		out.println("Insert Successfully...! Click Back link.");// after insert record successfully message
		
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>add</title>
		
		<!--css for div main class and table -->
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
		
		<!-- javascript for form validation-->
		<script>
		
			function validate()
			{
				var name = document.myform.txt_name;
				var owner = document.myform.txt_owner;
				
				if (name.value == "")
				{
					window.alert("please enter name ?");
					name.focus();
					return false;
				}
				if (owner.value == "")
				{
					window.alert("please enter owner ?");
					owner.focus();
					return false;
				}
			}
			
		</script>
		
	</head>
	
	<body>

		<div class="main">

		<form method="post" name="myform"  onsubmit="return validate();">

				<h1>Insert team</h1>
	
		
			
			<table>	
		
				<tr>
					<td>Name</td>
					<td><input type="text" name="txt_team_name"></td>
				</tr>
				
				<tr>
					<td>Stadium</td>
					<td><input type="text" name="txt_team_stadium"></td>
				</tr>
				
				<tr>
					<td>Won leagues</td>
					<td><input type="text" name="txt_team_leagues"></td>
				</tr>
				
				<tr>
					<td>Shirt color</td>
					<td><input type="text" name="txt_team_shirt"></td>
				</tr>	
				
				<tr>
					<td><input type="submit" name="btn_add" value="Insert"></td>	
				</tr>
				
			</table>
			
				
					<h1><a href="index.jsp"><input type="button" value="Back"></a></h1>
				
				
		</form>
		
		</div>

</body>

</html>