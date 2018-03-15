<%@ page session="false" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<header>
		<title>Registration</title>
	</header>

	<body>
		<div id="logo" align="center">
			<a href="index"><h1>LOGO<br/></h1></a>
			<hr size="3"/>
		</div>

		<div id="navMenu">
			<table width="100%">
				<tr align="center" valign="top">
					<td width="20%">&nbsp;</td>
					<td width="20%"><a href="login">Login</a></td>
					<td width="20%"><a href="registration_1">Register</a></td>
					<td width="20%">&nbsp;</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
			</table>
		</div>

		<div id="regForm">
			<form action="LoginController" method="post" name="registrationForm">
				<h1 align="center" valign="top">Registration</h1>
				<table align="center" valign="top" width="50%">
					<tr><td colspan="3"><div align="center" style="color: RED" id="errorMsg"></div></td></tr>
					<tr>
						<td>
							<fieldset>
								<table align="center" valign="top">
									<tr><td colspan="3"><div id="errorMsg" style="color: RED"><% 
											String errorMsg = request.getParameter("errorMsg");
											response.setContentType("text/html");
											if(errorMsg != null){
												if(errorMsg.equals("1")){
													out.println("All fields required.");
												}
												if(errorMsg.equals("2")){
													out.println("Invalid username or password.");
												}else{
													out.println("");
												}
											}
										%></div></td></tr>
									<tr>
										<td><strong>Username</strong></td>
										<td><strong>:</strong></td>
										<td><input type="text" name="username" value="<% 
										String value = request.getParameter("username");
										if(value == null)
											out.println("");
										else
											out.println(value);
											%>"/></td>
									</tr>
									<tr>
										<td><strong>Password</strong></td>
										<td><strong>:</strong></td>
										<td><input type="password" name="password" value="<% 
										String value1 = request.getParameter("password");
										if(value1 == null)
											out.println("");
										else
											out.println(value1);
											%>"/></td>
									</tr>
									<tr><td>&nbsp;</td></tr>
									<tr>
										<td colspan="3" align="center"><input type="submit" name="login" value="Login" /></td>
									</tr>
								</table>
							</fieldset>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>