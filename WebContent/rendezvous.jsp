<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Informations</title>
<link rel="icon" type="image/png" href="Image/Tattoo-gun.png" />
</head>
<body>

<jsp:include page="header.html"></jsp:include>

<HR>
<h2><font><strong>Prise de rendez-vous</strong></font></h2>

<p>Pour une prise de rendez-vous, note tes disponibilités, nous te contacterons au plus vite</p>

<form action="rendezvousSave.jsp">
    
        <table>
        <tr> <td>Nom</td><td><input type="text" name="nom"></td></tr>
        <tr> <td>Prenom</td><td><input type="text" name="prenom"></td></tr>
        <tr> <td>Email</td><td><input type="text" name="email"></td></tr>
        <tr> <td>Telephone</td><td><input type="text" name="telephone"></td></tr>	
        <tr> <td>Date souhaitée </td><td><input type="date" name="dateSouhaitee"></td></tr>
        <tr> <td><input type="reset" value="Effacer"><input type="submit" value="Envoyer!"></td></tr>
        </table>
    
</form>
    
<HR>

<jsp:include page="footer.html"></jsp:include>

</body>
</html>