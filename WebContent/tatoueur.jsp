<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="tatoo.Tatoueur"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tatoueur</title>
</head>
<body>

<jsp:include page="header.html"></jsp:include>

<h2 align="center"><font><strong>Nos tatoueurs</strong></font></h2>


<%
	try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String url = "jdbc:mysql://localhost/salonTatouage";
				String user= "root";
				String pwd = "";
				
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
		
					out.print("<ul>");
					out.print("<h3>");
					out.print(listeTatoueur.get(i).getPseudo());
					out.print("</h3>");
					out.print("<strong> Pays: </strong>");
					out.print(listeTatoueur.get(i).getPays());
					out.print("<strong> Style: </strong> ");
					out.print(listeTatoueur.get(i).getStyle());
					out.print("<strong> Expérience: </strong> ");
					out.print(listeTatoueur.get(i).getExperience());
					out.print(" ans");
					out.print("</ul>");
					
				

				}	
					
			} 
			catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
%>
</body>
</html>