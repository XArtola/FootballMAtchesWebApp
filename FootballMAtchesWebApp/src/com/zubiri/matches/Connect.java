/**
 * 
 */
package com.zubiri.matches;

import java.sql.*;
import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;

/**
 * @author ik013043z1
 *
 */
public class Connect {

	public static Connection con = null;

	public static void setConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver"); // load driver
		con = DriverManager.getConnection(
				"jdbc:mysql://localhost/footballmatches?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"dw18", "dw18");
	}

	public static void setConnection(String url, String database, String user, String password)
			throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver"); // load driver
		Connection con = DriverManager.getConnection("jdbc:mysql://" + url + "/" + database
				+ "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				user, password);
	}

	public static void addPlayer(Player player) throws ClassNotFoundException, SQLException {
		setConnection();
		PreparedStatement pstmt_players = null; // create statement
		pstmt_players = Connect.con.prepareStatement("insert into players (name, team , age, height) values(?,?,?,?)"); 
		pstmt_players.setString(1, player.getName());
		pstmt_players.setString(2, player.getTeam());
		pstmt_players.setInt(3, player.getAge());
		pstmt_players.setInt(4, player.getHeight());
		pstmt_players.executeUpdate(); // execute query
		Connect.con.close();
	
	}
	
	public static void addTeam(FootballTeam team) throws ClassNotFoundException, SQLException {
		setConnection();
		PreparedStatement pstmt = null; // create statement
		pstmt = con.prepareStatement("insert into teams(name,stadium,wonLeagues,shirtColor) values(?,?,?,?);"); // query
		pstmt.setString(1, team.getName());
		pstmt.setString(2, team.getStadium());
		pstmt.setInt(3, team.getWonLeagues());
		pstmt.setString(4, team.getShirtColor());
		pstmt.executeUpdate(); // execute query
		con.close(); // close connection

	}
	
	public static void addMatch(FootballMatch match) throws ClassNotFoundException, SQLException {
		setConnection();
		PreparedStatement pstmt = null; // create statement
		pstmt = con.prepareStatement(
				"insert into matches (localTeam, visitorTeam, goalsLocal, goalsVisitor) values(?,?,?,?);"); //sql update query 
		
		pstmt.setString(1, match.getLocalTeam().getName());
		pstmt.setString(2, match.getVisitorTeam().getName());
		pstmt.setInt(3, match.getGoalsLocal());
		pstmt.setInt(4, match.getGoalsVisitor());
		pstmt.executeUpdate(); //execute query
		con.close(); //connection close

	}
	
	public static void modifyPlayer(Player player) throws ClassNotFoundException, SQLException {
		setConnection();
		PreparedStatement pstmt_players = null; //create statement  

		pstmt_players = con
				.prepareStatement("update players set name=?, team=?, age=?, height=? where name=?"); //sql update query 
		pstmt_players.setString(1, player.getName());
		pstmt_players.setString(2, player.getTeam());
		pstmt_players.setInt(3, player.getAge());
		pstmt_players.setInt(4, player.getHeight());
		pstmt_players.setString(5, player.getName());
		pstmt_players.executeUpdate(); //execute query

		con.close(); //connection close
	
	}
	
	public static void modifyTeam(FootballTeam team) throws ClassNotFoundException, SQLException {
		setConnection();
		PreparedStatement pstmt = null; //create statement  

		pstmt = con.prepareStatement("update teams set name=?, stadium=?, wonLeagues=?, shirtColor=? where name=?"); // query
		pstmt.setString(1, team.getName());
		pstmt.setString(2, team.getStadium());
		pstmt.setInt(3, team.getWonLeagues());
		pstmt.setString(4, team.getShirtColor());
		pstmt.setString(5, team.getName());
		pstmt.executeUpdate(); // execute query
		con.close(); // close connection
	
	}
	
	public static void modifyMatch(FootballMatch match) throws ClassNotFoundException, SQLException {
		setConnection();
		PreparedStatement pstmt = null; //create statement  

		pstmt = con
				.prepareStatement("update players set name=?, team=?, age=?, height=? where matchID=?"); //sql update query 
		pstmt.setString(1, match.getLocalTeam().getName());
		pstmt.setString(2, match.getVisitorTeam().getName());
		pstmt.setInt(3, match.getGoalsLocal());
		pstmt.setInt(4, match.getGoalsVisitor());
		pstmt.setInt(5, match.getMatchID());
		pstmt.executeUpdate(); //execute query

		con.close(); //connection close
	
	}
	
	
	public static void deletePlayer(String name) throws ClassNotFoundException, SQLException {
		setConnection();
		PreparedStatement pstmt_players = null; //create statement  

		pstmt_players = con.prepareStatement("delete from players where name=? "); //sql delete query
		pstmt_players.setString(1, name);
		pstmt_players.executeUpdate(); //execute query

		con.close(); //close connection
	}
	
	public static void deleteTeam(String name) throws ClassNotFoundException, SQLException {
		setConnection();
		PreparedStatement pstmt = null; //create statement  

		pstmt = con.prepareStatement("delete from teams where name=? "); //sql delete query
		pstmt.setString(1, name);
		pstmt.executeUpdate(); //execute query

		con.close(); //close connection
	}
	
	public static void deleteMatch(String matchID) throws ClassNotFoundException, SQLException {
		setConnection();
		PreparedStatement pstmt = null; //create statement  

		pstmt = con.prepareStatement("delete from matches where matchID=? "); //sql delete query
		pstmt.setInt(1, Integer.parseInt(matchID));
		pstmt.executeUpdate(); //execute query

		con.close(); //close connection
	}
	
	public static ResultSet getPlayers() throws ClassNotFoundException, SQLException{
		
		setConnection();
		PreparedStatement pstmt = null; //create statement
		pstmt = con.prepareStatement("select * from players"); 
		return pstmt.executeQuery(); //execute query and set in resultset object rs.  

	}
	
public static ResultSet getMatches() throws ClassNotFoundException, SQLException{
		
		setConnection();
		PreparedStatement pstmt = null; //create statement
		pstmt = con.prepareStatement("select * from matches"); 
		return pstmt.executeQuery(); //execute query and set in resultset object rs.  

	}
	
public static ResultSet getTeams() throws ClassNotFoundException, SQLException{
	
	setConnection();
	PreparedStatement pstmt = null; //create statement
	pstmt = con.prepareStatement("select * from teams"); 
	return pstmt.executeQuery(); //execute query and set in resultset object rs.  

}
	

}