<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="nav_page.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	#entitybox {
            margin: auto;
            margin-top: 20px;
            height: 500px;
            width: 350px;
            background-color: beige;
            border-top: 1px solid;
            border-bottom: 1px solid;
            border-radius: 10px;
        }

        .entity {
            display: inline-block;
            margin-left: 50px;
            font-family: 'Courier New', Courier, monospace;
            font-weight: bold;
        }

        .value {
            display: inline-block;
            margin-left: 50px;
            font-family: 'Courier New', Courier, monospace;
            text-align: center;
            height: 20px;
            width: 200px;
            border: none;
            border-left: 1px solid black;
            border-right: 1px solid black;
            border-radius: 20px;
        }

        #btn {
            padding: 10px 20px;
            margin-left: 140px;
            text-decoration: none;
            background-color: greenyellow;
            color: black;
            border: none;
            border-radius: 10px;
        }

        #btn:hover {
            background-color: tomato;
        }
</style>
</head>
<body>
	<h1 style="margin-left: 500px;">Add Car Details</h1>
    <div id="entitybox">
        <form action="add_car" method="post">
            <p class="entity">Model: </p> <br/>
            <input type="text" name="model" class="value"> <br />
            <p class="entity">Name: </p> <br/>
            <input type="text" name="name" class="value"> <br />
            <p class="entity">Brand: </p> <br/>
            <input type="text" name="brand" class="value"> <br />
            <p class="entity">FuelType: </p> <br/>
            <input type="text" name="fueltype" class="value"> <br />
            <p class="entity">Color: </p> <br/>
            <input type="text" name="color" class="value"> <br />
            <p class="entity">Price: </p> <br/>
            <input type="text" name="price" class="value"> <br /> <br/>
            <input type="submit" value="ADD" id="btn">
        </form>
    </div>
</body>
</html>