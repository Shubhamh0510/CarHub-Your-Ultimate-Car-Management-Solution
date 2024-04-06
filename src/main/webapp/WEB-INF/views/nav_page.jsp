<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#body{
	padding: 0px;
	margin: 0px;
}
#box1 {
	height: 30px;
	width: 1240px;
	background-color: greenyellow;
	padding: 30px;
}

ul {
	display: inline;
	margin-left: 300px;
}

li {
	display: inline;
	margin-left: 20px;
}

.a1 {
	padding: 10px;
	border: 1px solid white;
	border-radius: 10px;
	text-decoration: none;
	font-size: 20px;
	color: black;
}

.a1:hover {
	background-color: black;
	color: white;
}

#bar {
	height: 20px;
	width: 20px;
}

#bar1:hover {
	background-color: white;
	border: 1px solid black;
}
</style>
</head>
<body id="body">
	<nav>
		<div id="box1">
			<a class="a1" href="home_page"><svg id="bar" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg>  HOME</a>
			<ul>
				<li><a class="a1" href="add_page"><svg id="bar" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344V280H168c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H280v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg> ADD CAR</a></li>
				<li><a class="a1" href="my_car">MY CAR</a></li>
				<li><a class="a1" href="all_car">ALL CAR</a></li>
				<li><a class="a1" href="sign_out">SIGN OUT</a></li>
				<li><a class="a1" href="delete_user">DELETE USER</a></li>
				<li><a class="a1" id="bar1" href=""><svg id="bar"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
							<!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
							<path
								d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z" /></svg></a></li>
			</ul>
		</div>
	</nav>
</body>
</html>