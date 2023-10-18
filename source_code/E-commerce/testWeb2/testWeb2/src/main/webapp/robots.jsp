<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script>
        function changeContent(url) {
            $.get(url, function(data) {
                document.getElementById('main-content').innerHTML = data;
            });
        }
    </script>
</head>
<body>
    <div class="container" id="main-content">
        <div class="row">
        	<c:forEach items="${robots}" var="robot">
            <div class="col-md-12">
                <div class="card mb-4" onclick="getRobot(${robot.id})">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="${robot.imgpath}" class="card-img" alt="Product Image">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">ID: ${robot.id}</h5>
                                <p class="card-text">Name: ${robot.name}</p>
                                <p class="card-text">Model: ${robot.model}</p>
                                <p class="card-text">Color: ${robot.color}</p>
                                <p class="card-text">Size: ${robot.size}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        	</c:forEach>
        </div>
    </div>
</body>
</html>
