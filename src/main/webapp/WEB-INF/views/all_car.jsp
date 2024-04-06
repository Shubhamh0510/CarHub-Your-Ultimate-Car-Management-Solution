<%@page import="com.jspiders.spring_mvc.dto.CarDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="nav_page.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	#mycarbox {
            display: inline-block;
            height: 200px;
            width: 200px;
            margin-top: 20px;
           margin-left: 30px;
            border: 1px solid;
            border-radius: 20px;
            padding: 25px;
            line-height: 10px;
        }

        .entity{
            display: inline-block;
            font-family: 'Courier New', Courier, monospace;
            font-weight: bold;
        }

        .value{
            display: inline-block;
            font-family: 'Courier New', Courier, monospace;
        }

        form {
            display: inline-block;
            margin-left: 100px;
        }

        button {
            border: none;
            border-radius: 20px;
        }

        .btn {
            height: 17px;
            width: 17px;
            padding: 10px;
            border: none;
        }
</style>
</head>
<body>
	<%!String message; %>
	<%
	@SuppressWarnings("unchecked")
	List<CarDTO> cars = (List<CarDTO>) request.getAttribute("cars");
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
	<h1 style="margin-left: 500px;">Car List</h1>
	<% if (cars != null && cars.size() > 0) {
	%>
	<div>
		<%
		for (CarDTO car : cars) {
		%>
	<div id="mycarbox">
        <p class="entity">Id: </p> 
        <p class="value"><%=car.getId() %> 
            <form action="view_allcar" method="post">
                <input type="text" name="id" value="<%=car.getId()%>" hidden="true">
                <button type="submit">
                    <svg class="btn" xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                        <path
                            d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" />
                    </svg>
                </button>
            </form>
        <p class="entity">Name: </p> <p class="value"><%=car.getName() %></p> <br/>
        <p class="entity">Brand: </p> <p class="value"><%=car.getBrand() %></p> <br/>
        <p class="entity">Price: </p> <p class="value"><%=car.getPrice() %></p> <br/>
    </div>
		<%
		}
		%>
	</div>
	<%
	} else{ %>
	<script type="text/javascript">
		alert("Car Not Available!!!");
	</script>	
	<%	
	}
	%>
</body>
</html>