<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>
 <%
 
 try{
            String n = request.getParameter("nom");
            String p = request.getParameter("prenom");
            String e = request.getParameter("email");
            String t = request.getParameter("telephone");
            String d = request.getParameter("dateSouhaitee");
            
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String url = "jdbc:mysql://localhost:3306/salonTatouage";
            String user = "root";
            String pwd = "System84";
            
            Connection con = DriverManager.getConnection(url, user, pwd);
            PreparedStatement ps = con.prepareStatement("insert into rendezvous values(?,?,?,?,?)");
            ps.setString(1, n);
    		ps.setString(2, p);
    		ps.setString(3, e);
    		ps.setString(4, t);
    		ps.setString(5, d);
    	
    		
    		int i = ps.executeUpdate();
            
            
            if(i>0){
            %>
                <jsp:forward page="rendezvous.jsp"></jsp:forward>
            <% 
            }
            else{
                out.print("sorry!please fill correct detail and try again" );
            }
                
 }
 catch(Exception e){e.printStackTrace();
 out.print("sorry!please fill correct detail and try again" );
 }

 %>
    