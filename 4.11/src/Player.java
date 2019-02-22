public class Player {
	
	private String name;
	private int age;
	private String position;
	private Team team;
	private String sport = "";
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAge() {
		return this.age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getPosition() {
		return this.position;
	}
	public void setPosition(String position) {
		this.position=position;
	}
	
	public Team getTeam() {
		return this.team;
	}
	public void setTeam(Team team) {
		this.team = team;
	}
	public String getSport() {
		return sport;
	}
	public void setSport(String sport) {
		this.sport = sport;
	}
	
}
