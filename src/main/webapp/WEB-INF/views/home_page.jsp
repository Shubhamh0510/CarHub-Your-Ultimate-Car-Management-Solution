<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="nav_page.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1 style="margin-left: 450px;">WEL-COME TO HOME PAGE</h1>
	<%!String message;%>
	<%
	message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<input type="text" id="msg" value=<%=message%> hidden="true">
	<script type="text/javascript">
		let msg = document.getElementById("msg");
		alert(msg.value)
	</script>
	<%
	}
	%>
</body>
</html>