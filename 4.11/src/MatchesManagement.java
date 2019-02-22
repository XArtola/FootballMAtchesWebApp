import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

public class MatchesManagement {
	public static void main(String[] args) {
		if (args.length != 1) {
			System.out.println("Enter the file name of the file you want to read.");
			System.out.println("example: java Matches ../Champions.txt");
		}else {
			try {
				File teamInfo = new File("TeamInfo.txt");
				ArrayList<FootballTeam> teams = new ArrayList<FootballTeam>();
				Scanner sc1 = new Scanner(teamInfo);
				try {
					while (sc1.hasNextLine()) {
						FootballTeam a = new FootballTeam();
						String tokens[] = sc1.nextLine().split("::");
						a.setName(tokens[0]);
						a.setNationality(tokens[1]);
						a.setStadium(tokens[2]);
						a.setCapacity(Integer.parseInt(tokens[3]));
						System.out.println(tokens[0]+tokens[1]+tokens[2]+tokens[3]);
						teams.add(a);
					}
				}catch(NullPointerException e) {
					e.printStackTrace();
				}
				
				ArrayList<FootballMatch> list = new ArrayList<FootballMatch>();

				System.out.println(args[0]);
				
				try {
					File matches = new File(args[0]);
					Scanner sc = new Scanner(matches);

					while (sc.hasNextLine()) {
						FootballMatch match = new FootballMatch();
						String tokens[] = sc.nextLine().split("::");
						for (int x = 0; x < teams.size(); x++) {
							if (tokens[0].equals(teams.get(x).getName())) {
								match.setLocalTeam(teams.get(x));
								break;
							}
						}
						System.out.println(tokens[3]);
						for (int x = 0; x < teams.size(); x++) {
							System.out.println(teams.get(x).getName());

							if(tokens[3].equals(teams.get(x).getName())) {
								match.setVisitorTeam(teams.get(x));
								break;
							}
						}

						match.setGoalsLocal(Integer.parseInt(tokens[1]));
						match.setGoalsVisitor(Integer.parseInt(tokens[2]));
						list.add(match);
					}
				}catch(FileNotFoundException e) {
					e.printStackTrace();
				}
				
				for (int x = 0; x < list.size(); x++) {
					System.out.println("\n*MATCH RESULT*");
					System.out.println(list.get(x).getLocalTeam().getName() + "\t" + list.get(x).getGoalsLocal() + " - "
							+ list.get(x).getGoalsVisitor() + "\t" + list.get(x).getVisitorTeam().getName() + "\n");

					System.out.println("*" + list.get(x).getLocalTeam().getName().toUpperCase() + "*");
					System.out.println("Nationality: " + list.get(x).getLocalTeam().getNationality());
					System.out.println("Stadium: " + list.get(x).getLocalTeam().getStadium());
					System.out.println("Capacity: " + list.get(x).getLocalTeam().getCapacity());
				}

				System.out.println();
				sc1.close();
				//NullPointerException
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		}
		
		

	}
	
}
