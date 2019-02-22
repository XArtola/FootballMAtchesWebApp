import java.util.ArrayList;
public abstract class Team {
	
	private String name;
	private String nationality;
	private String stadium;
	private int capacity;
	protected ArrayList<Player> players = new ArrayList<Player>();
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNationality() {
		return this.nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	
	public String getStadium() {
		return this.stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	
	public int getCapacity() {
		return this.capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	
	public void addPlayer(Player player) {
		if(checkPlayer(player)) {
			players.add(player);
		}
	}
	public abstract boolean checkPlayer(Player player);
}
