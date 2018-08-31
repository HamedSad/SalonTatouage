package tatoo;


import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;

public class Application {

	public static void main(String[] args) {
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String url = "jdbc:mysql://localhost/salonTatouage";
				String user= "root";
				String pwd = "System84";
				
				Connection cn = (Connection) DriverManager.getConnection(url, user, pwd);
				
				Statement st = cn.createStatement();
				
				String sql = "SELECT * FROM tatoueur";
				
				ResultSet result = (ResultSet) st.executeQuery(sql);
				
				ArrayList<Tatoueur> listeTatoueur = new ArrayList<Tatoueur>();  
				
				while(result.next()) {
					Tatoueur affichage = new Tatoueur();
					
					affichage.setPseudo(result.getString("pseudo"));
					affichage.setPays(result.getString("pays"));
					affichage.setStyle(result.getString("style"));
					affichage.setExperience(result.getInt("experience"));
					
					listeTatoueur.add(affichage);
				}
				
				for(int i = 0 ; i < listeTatoueur.size(); i ++) {
					
					System.out.print(listeTatoueur.get(i).getPseudo());
					System.out.print(" ");
					System.out.print(listeTatoueur.get(i).getPays());
					System.out.print(" ");
					System.out.print(listeTatoueur.get(i).getStyle());
					System.out.print(" ");
					System.out.println(listeTatoueur.get(i).getExperience());
				}	
					
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
