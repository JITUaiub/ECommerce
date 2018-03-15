<%@ page session="false" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<header>
		<title>Registration - Step 2</title>
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
			<form action="RegistrationController?step=2" method="post" name="registrationForm">
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
											}else{
												out.println("");
											}
										}
									%></div></td></tr>
									<tr>
										<td><strong>First Name</strong></td>
										<td><strong>:</strong></td>
										<td><input type="text" name="firstName" value="<% 
										String value = request.getParameter("firstName");
										if(value == null)
											out.println("");
										else
											out.println(value);
											%>"/></td>
									</tr>
									<tr>
										<td><strong>Last Name</strong></td>
										<td><strong>:</strong></td>
										<td><input type="text" name="lastName" value="<% 
										String value2 = request.getParameter("lastName");
										if(value2 == null)
											out.println("");
										else
											out.println(value2);
											%>"/></td>
									</tr>
									<tr>
										<td><strong>Date of Birth</strong></td>
										<td><strong>:</strong></td>
										<td><input type="date" name="dob" value="<% 
										String value3 = request.getParameter("dob");
										if(value3 == null)
											out.println("");
										else
											out.println(value3);
											%>"/></td>
									</tr>
									<tr>
										<td><strong>Gender</strong></td>
										<td><strong>:</strong></td>
										<td>
											<input type="radio" name="gender" value="Male"> Male
											<input type="radio" name="gender" value="Female"> Female
											<input type="radio" name="gender" value="Other"> Other
										</td>
									</tr>
									<tr>
										<td><strong>Mobile</strong></td>
										<td><strong>:</strong></td>
										<td><input type="text" name="mobile" value="<% 
										String value4 = request.getParameter("mobile");
										if(value4 == null)
											out.println("");
										else
											out.println(value4);
											%>"/></td>
									</tr>
									<tr>
										<td><strong>Address</strong></td>
										<td><strong>:</strong></td>
										<td><input type="textarea" name="address" value="<% 
										String value5 = request.getParameter("address");
										if(value5 == null)
											out.println("");
										else
											out.println(value5);
											%>"/></td>
									</tr>
									<tr><td>&nbsp;</td></tr>
									<tr>
										<td colspan="3" align="center"><input type="submit" name="submit" value="Finish Registration" /></td>
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