<%@page import="java.sql.*"%>
<%@page import="com.zubiri.matches.*"%>

<%
	try {
		
		if (request.getParameter("delete") != null) {
			
			String name = request.getParameter("delete");

			switch (request.getParameter("selection")) {
			case "teams":
				Connect.deleteTeam(name);
				break;
			case "players":
				Connect.deletePlayer(name);
				break;
			case "matches":
				Connect.deleteMatch(name);
				break;
			}
		}
	} catch (Exception e) {
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
				<%
					switch (request.getParameter("selection")) {
					case "teams":
				%>
				<th>Name</th>
				<th>Stadium</th>
				<th>Won Leagues</th>
				<th>Shirt Color</th>

				<%
					break;
					case "players":
				%>

				<th>Name</th>
				<th>Team</th>
				<th>Age</th>
				<th>Height</th>

				<%
					break;
					case "matches":
				%>

				<th>Local team</th>
				<th>Goals local</th>
				<th>Goals visitor</th>
				<th>Visitor team</th>
				<%
					break;
					}
				%>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<%
				try {

						ResultSet rs = null;

					switch (request.getParameter("selection")) {
					case "teams":
						rs =Connect.getTeams();
						
						break;

					case "players":
						rs =Connect.getPlayers();
					
						break;

					case "matches":
						rs =Connect.getMatches();
						
						break;
					}

				

					while (rs.next()) {
			%>
			<tr>
				<%
					switch (request.getParameter("selection")) {
							case "teams":
				%>

				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getInt(3)%></td>
				<td><%=rs.getString(4)%></td>

				<td><a
					href="update.jsp?edit=<%=rs.getString(1)%>&selection=teams ">Modify</a></td>
				<td><a href="?delete=<%=rs.getString(1)%>&selection=teams ">Delete</a></td>
				<%
					break;
							case "players":
								
				%>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getInt(3)%></td>
				<td><%=rs.getInt(4)%></td>

				<td><a
					href="update.jsp?edit=<%=rs.getString(1)%>&selection=players">Modify</a></td>
				<td><a href="?delete=<%=rs.getString(1)%>&selection=players">Delete</a></td>
				<%
					break;
							case "matches":
				%>

				<td><%=rs.getString(2)%></td>
				<td><%=rs.getInt(4)%></td>
				<td><%=rs.getInt(5)%></td>
				<td><%=rs.getString(3)%></td>


				<td><a
					href="update.jsp?edit=<%=rs.getInt(1)%>&selection=matches ">Modify</a></td>
				<td><a href="?delete=<%=rs.getInt(1)%>&selection=matches">Delete</a></td>

				<%
					break;
							}
				%>
			</tr>
			<%
				}

				} catch (Exception e) {
					out.println(e);
				}
			%>

		</table>

		<h1>
			<%
				switch (request.getParameter("selection")) {
				case "teams":
			%>
			<a href="add.jsp?selection=teams"><input type="button"
				value="Add new team"></a>

			<%
				break;
				case "players":
			%>

			<a href="add.jsp?selection=players"><input type="button"
				value="Add new player"></a>
			<%
				break;
				case "matches":
			%>

			<a href="add.jsp?selection=matches"><input type="button"
				value="Add new match"></a>
			<%
				break;
				}
			%>
		</h1>

		<h1>
			<a href="select.jsp"><input type="button" value="Main menu"></a>
		</h1>
	</div>

</body>

</html>