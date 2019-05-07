<%@page import="com.zubiri.matches.Connect"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.zubiri.matches.*"%>

<%
	
	try {
		Class.forName("com.mysql.jdbc.Driver"); //load driver 

		
		String selection=request.getParameter("selection");
		if (request.getParameter("btn_add_teams") != null) //check button click event not null
		{
			
			FootballTeam team = new FootballTeam();
			
			team.setName(request.getParameter("txt_player_name"));
			team.setStadium(request.getParameter("txt_team_stadium"));
			team.setWonLeagues(Integer.parseInt(request.getParameter("txt_team_shirt")));
			team.setShirtColor(request.getParameter("txt_team_shirt"));
			Connect.addTeam(team);
			String redirectURL = "add.jsp?selection=teams";
			response.sendRedirect(redirectURL);

			out.println("Insert Successfully...! Click Back link.");// after insert record successfully message
		
		}

		if (request.getParameter("btn_add_players") != null) //check button click event not null
		{
			
			Player player = new Player();
			
			player.setName(request.getParameter("txt_player_name"));
			player.setTeam(request.getParameter("txt_player_team"));
			player.setAge(Integer.parseInt(request.getParameter("txt_player_age")));
			player.setHeight(Integer.parseInt(request.getParameter("txt_player_height")));
			
			Connect.addPlayer(player);
			String redirectURL = "add.jsp?selection=players";
			response.sendRedirect(redirectURL);
		

		}
		if (request.getParameter("btn_add_matches") != null) //check button click event not null
		{
			
			FootballMatch match = new FootballMatch();
			FootballTeam team = new FootballTeam();
			
			team.setName(request.getParameter("txt_matches_lteam"));
			match.setLocalTeam(team);
			team.setName(request.getParameter("txt_matches_vteam"));
			match.setVisitorTeam(team);
			match.setGoalsVisitor(Integer.parseInt(request.getParameter("txt_matches_vgoals")));
			match.setGoalsLocal(Integer.parseInt(request.getParameter("txt_matches_lgoals")));
			
			Connect.addMatch(match);
			
			String redirectURL = "add.jsp?selection=matches";
			response.sendRedirect(redirectURL);

		}

	} catch (Exception e) {
		out.println(e);
	}
%>

<html>

<head>

<title>add</title>

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
	text-align: left;
	padding: 8px;
}
</style>

</head>

<body>

	<div class="main">

		<%
			switch (request.getParameter("selection")) {
			case "teams":
		%>
		<form action="add.jsp?selection=teams" method="post">
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
					<td><input type="submit" name="btn_add_teams" value="Insert"></td>
				</tr>

			</table>


			<h1>
				<a href="index.jsp?selection=teams"><input type="button"
					value="Back"></a>
			</h1>
		</form>

		<%
				break;
				case "players":
			%>
		<form action="add.jsp?selection=players" method="post">
			<h1>Insert player</h1>

			<table>

				<tr>
					<td>Name</td>
					<td><input type="text" name="txt_player_name"></td>
				</tr>

				<tr>
					<td>Team</td>
					<td><input type="text" name="txt_player_team"></td>
				</tr>

				<tr>
					<td>Age</td>
					<td><input type="text" name="txt_player_age"></td>
				</tr>

				<tr>
					<td>Height</td>
					<td><input type="text" name="txt_player_height"></td>
				</tr>

				<tr>
					<td><input type="submit" name="btn_add_players" value="Insert"></td>
				</tr>

			</table>


			<h1>
				<a href="index.jsp?selection=players"><input type="button"
					value="Back"></a>
			</h1>
		</form>
		<%
					break;
					case "matches":
				%>
		<form action="add.jsp?selection=matches" method="post">
			<h1>Insert match</h1>

			<table>

				<tr>
					<td>Local Team</td>
					<td><input type="text" name="txt_matches_lteam"></td>
				</tr>

				<tr>
					<td>Goals local</td>
					<td><input type="text" name="txt_matches_lgoals"></td>
				</tr>

				<tr>
					<td>Goals visitor</td>
					<td><input type="text" name="txt_matches_vgoals"></td>
				</tr>

				<tr>
					<td>Visitor team</td>
					<td><input type="text" name="txt_matches_vteam"></td>
				</tr>

				<tr>
					<td><input type="submit" name="btn_add_matches" value="Insert"></td>
				</tr>

			</table>


			<h1>
				<a href="index.jsp?selection=matches"><input type="button"
					value="Back"></a>
			</h1>
		</form>
		<%
				break;
				}
			%>

	</div>

</body>

</html>