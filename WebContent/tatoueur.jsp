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

<HR>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>

<%
	String url = "jdbc:mysql://localhost:3306/salonTatouage";
	String user = "root";
	String pwd = "System84";

	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>

<h2 align="center"><font><strong>Nos tatoueurs</strong></font></h2>

<table align="center" cellpadding="4" cellspacing="4">
	
	<tr>
		<td><b>Pseudo</b></td>
		<td><b>Style du tatouage</b></td>
		<td><b>Pays d'origine</b></td>	
		<td><b>Années d'experience</b></td>
	</tr>
	<%
		try {
			connection = DriverManager.getConnection(url, user, pwd);
			statement = connection.createStatement();
			String sql = "SELECT * FROM tatoueur";

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
	%>
	<tr>
		<td><%=resultSet.getString("pseudo")%></td>
		<td><%=resultSet.getString("style")%></td>
		<td><%=resultSet.getString("pays")%></td>
		<td><%=resultSet.getInt("experience")%></td>
	</tr>
	<%	}

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

<table/>

<HR>

<jsp:include page="footer.html"></jsp:include>