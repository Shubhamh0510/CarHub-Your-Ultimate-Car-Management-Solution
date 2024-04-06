<%@page import="com.jspiders.spring_mvc.dto.CarDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<jsp:include page="nav_page.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	#mycarbox {
            display: inline-block;
            height: 240px;
            width: 200px;
            margin-top: 20px;
            margin-left: 30px;
            border: 1px solid;
            border-radius: 20px;
            padding: 25px;
            line-height: 15px;
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
            margin-left: 8px;
        }

        button {
            border: none;
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
        <p class="entity">Id: </p> <p class="value"><%=car.getId() %></p> <br/>
        <p class="entity">Name: </p> <p class="value"><%=car.getName() %></p> <br/>
        <p class="entity">Brand: </p> <p class="value"><%=car.getBrand() %></p> <br/>
        <p class="entity">Price: </p> <p class="value"><%=car.getPrice() %></p> <br/>
        <form action="edit_car" method="post">
            <input type="text" name="id" value="<%=car.getId()%>" hidden="true">
            <button type="submit">
                <svg class="btn" xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                        d="M441 58.9L453.1 71c9.4 9.4 9.4 24.6 0 33.9L424 134.1 377.9 88 407 58.9c9.4-9.4 24.6-9.4 33.9 0zM209.8 256.2L344 121.9 390.1 168 255.8 302.2c-2.9 2.9-6.5 5-10.4 6.1l-58.5 16.7 16.7-58.5c1.1-3.9 3.2-7.5 6.1-10.4zM373.1 25L175.8 222.2c-8.7 8.7-15 19.4-18.3 31.1l-28.6 100c-2.4 8.4-.1 17.4 6.1 23.6s15.2 8.5 23.6 6.1l100-28.6c11.8-3.4 22.5-9.7 31.1-18.3L487 138.9c28.1-28.1 28.1-73.7 0-101.8L474.9 25C446.8-3.1 401.2-3.1 373.1 25zM88 64C39.4 64 0 103.4 0 152V424c0 48.6 39.4 88 88 88H360c48.6 0 88-39.4 88-88V312c0-13.3-10.7-24-24-24s-24 10.7-24 24V424c0 22.1-17.9 40-40 40H88c-22.1 0-40-17.9-40-40V152c0-22.1 17.9-40 40-40H200c13.3 0 24-10.7 24-24s-10.7-24-24-24H88z" />
                </svg>
            </button>
        </form>
        <form action="view_mycar" method="post">
            <input type="text" name="id" value="<%=car.getId()%>" hidden="true">
            <button type="submit">
                <svg class="btn" xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                        d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" />
                </svg>
            </button>
        </form>
        <form action="delete_car" method="post">
            <input type="text" name="id" value="<%=car.getId()%>" hidden="true">
            <button type="submit">
                <svg class="btn" xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                        d="M135.2 17.7C140.6 6.8 151.7 0 163.8 0H284.2c12.1 0 23.2 6.8 28.6 17.7L320 32h96c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 96 0 81.7 0 64S14.3 32 32 32h96l7.2-14.3zM32 128H416V448c0 35.3-28.7 64-64 64H96c-35.3 0-64-28.7-64-64V128zm96 64c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16z" />
                </svg>
            </button>
        </form>
    </div>
		<%
		}
		%>
	</div>
	<%
	} else{ %>
	<script type="text/javascript">
		alert("Car Not Available !!!");
	</script>
	<%	
	}
	%>
</body>
</html>