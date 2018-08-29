<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tatoueur</title>
</head>
<body>

<jsp:include page="header.html"></jsp:include>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>

<%@ import com.mysql.jdbc.Connection%>
<%@

			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String url = "jdbc:mysql://localhost/salonTatouage";
				String user= "root";
				String pwd = "System84";
				
				Connection cn = (Connection) DriverManager.getConnection(url, user, pwd);
				
				Statement st = cn.createStatement();
				
				String sql = "SELECT * FROM tatoueur";
				
				ResultSet result = (ResultSet) st.executeQuery(sql);
				%>	
				
				ArrayList<Tatoueur> listeTatoueur = new ArrayList<Tatoueur>();
				
					while(result.next()) {
		<%@ 			Tatoueur affichage = new Tatoueur();
					
					affichage.setPseudo(result.getString("pseudo"));
					affichage.setPays(result.getString("pays"));
					affichage.setStyle(result.getString("style"));
					affichage.setExperience(result.getInt("experience"));
					
					listeTatoueur.add(affichage);
				}
				%>
				for(int i = 0 ; i < listeTatoueur.size(); i ++) {
					
				<%@	System.out.print(listeTatoueur.get(i).getPseudo());
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
	} %>
</body>
</html>