public class FootballMatch {

	private FootballTeam localTeam;
	private FootballTeam visitorTeam;
	private int goalsLocal;
	private int goalsVisitor;

	public FootballTeam getLocalTeam() {
		return this.localTeam;
    }

	public void setLocalTeam(FootballTeam localTeam) {
		this.localTeam = localTeam;
	}

	public FootballTeam getVisitorTeam() {
		return this.visitorTeam;
	}

	public void setVisitorTeam(FootballTeam footballTeam) {
		this.visitorTeam = footballTeam;
	}

	public int getGoalsLocal() {
		return this.goalsLocal;
	}

	public void setGoalsLocal(int goalsLocal) {
		this.goalsLocal = goalsLocal;
	}

	public int getGoalsVisitor() {
		return this.goalsVisitor;
	}

	public void setGoalsVisitor(int goalsVisitor) {
		this.goalsVisitor=goalsVisitor;
	}
}