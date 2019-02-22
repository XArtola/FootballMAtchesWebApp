
public class FootballTeam extends Team{
	public boolean checkPlayer(Player player) {
		if(player.getSport().equals("football")) {
			return true;
		}
		return false;
	}
}