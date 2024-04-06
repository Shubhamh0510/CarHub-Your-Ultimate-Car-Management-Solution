<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
div {
	height: 250px;
	width: 210px;
	margin: auto;
	margin-top: 20px;
	border: 1px solid;
	border-radius: 20px;
	padding: 25px;
}
h2 {
	text-align: center;
}
input {
	height: 30px;
	width: 180px;
	border: 1px solid;
	border-radius: 10px;
	margin-left: 7px;
	margin-top: 10px;
	text-align: center;
}
.btn {
	border: 1px solid;
	height: 50px;
	width: 80px;
	border-radius: 10px;
	text-decoration: none;
	color: white;
	margin-left: 60px;
	text-align: center;
	cursor: pointer;
}
</style>
</head>
<body>
	<div>
		<%!String message; %>
		<%
			message = (String) request.getAttribute("message");
			if(message != null){
		%>
		<input type="text" id="message" value=<%=message%> hidden="true">
		<script type="text/javascript">
		let msg = document.getElementById("message");
		alert(msg.value);
		</script>
		<%
			}
		%>
		<h2>Sign Up</h2>
		<form action="add_user" method="post">
			<input type="text" name="email" placeholder="Email">
			<input type="text" name="password" placeholder="Password">
			<input class="btn" style="background-color: greenyellow;" type="submit" value="Sign Up">
		</form>
		<h4>Do you have to login? <a href="sign_in">Sign In</a></h4>
	</div>
</body>
</html>