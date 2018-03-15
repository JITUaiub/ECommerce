<%@ page session="true" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User - Home</title>
</head>
<body>
	<%
		if(session.getAttribute("loggedUser") == null){
			response.sendRedirect("login");
			return;
		}
	%>
	<jsp:useBean id="loggedUser" class="com.ecommerce.models.RegistrationBean" scope="session"></jsp:useBean>
	<h1 align="center">Profile</h1>
	<div align="center">
		<strong>User name :</strong> <jsp:getProperty property="username" name="loggedUser"/><br />
		<strong>First Name:</strong> <jsp:getProperty property="firstName" name="loggedUser"/><br />
		<strong>Last Name:</strong> <jsp:getProperty property="lastName" name="loggedUser"/><br />
		<strong>Email:</strong> <jsp:getProperty property="email" name="loggedUser"/><br />
		<strong>Date of Birth:</strong> <jsp:getProperty property="dob" name="loggedUser"/><br />
		<strong>Gender:</strong> <jsp:getProperty property="gender" name="loggedUser"/><br />
		<strong>Mobile:</strong> <jsp:getProperty property="mobile" name="loggedUser"/><br />
		<strong>Address:</strong> <jsp:getProperty property="address" name="loggedUser"/><br />
	</div>
</body>
</html>