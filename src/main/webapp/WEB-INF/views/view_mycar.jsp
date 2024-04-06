<%@page import="com.jspiders.spring_mvc.dto.CarDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        #entitybox{
            margin: auto;
            margin-top: 30px;
            height: 410px;
            width: 350px;
            background-color: beige;
            border-top: 1px solid;
            border-bottom: 1px solid;
            border-radius: 10px;
        }
        .entity{
            display: inline-block;
            margin-left: 50px;
            font-family: 'Courier New', Courier, monospace;
            font-weight: bold;
        }
        .value{
            display: inline-block;
            font-family: 'Courier New', Courier, monospace;
        }
        #btn{
            padding: 10px;
            margin-left: 140px;
            text-decoration: none;
            background-color: black;
            color: white;
            border-radius: 10px;
        }
        #btn:hover{
            background-color: tomato;
        }
    </style>
</head>
<body>
	<%!String message; %>
	<%CarDTO car = (CarDTO)request.getAttribute("car");
	message = (String) request.getAttribute("message");
	if(message != null){%>
	<input type="text" id="message" value=<%=message%> hidden="true">
	<script type="text/javascript">
		let msg = document.getElementById("message");
		alert(msg.value);
	</script>
	<%	
	}
	%>
	<div id="entitybox">
            <p class="entity">Id: </p> <p class="value"><%=car.getId() %></p> <br/>
            <p class="entity">Model: </p> <p class="value"><%=car.getModel() %></p> <br/>
            <p class="entity">Name: </p> <p class="value"><%=car.getName() %></p> <br/>
            <p class="entity">Brand: </p> <p class="value"><%=car.getBrand() %></p> <br/>
            <p class="entity">FuelType: </p> <p class="value"><%=car.getFueltype() %></p> <br/>
            <p class="entity">Color: </p> <p class="value"><%=car.getColor() %></p> <br/>
            <p class="entity">Price: </p> <p class="value"><%=car.getPrice() %></p> <br/> <br/>
            <a id="btn" href="my_car">BACK</a>
    </div>
</body>
</body>
</html>