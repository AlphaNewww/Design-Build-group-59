<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Robot Information Management System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        function changeContent(url) {
            $.post(url, function(data) {
                document.getElementById('main-content').innerHTML = data;
            });
        }
    </script>
    
    <script>
    function getUser() {

        $.ajax({
            type: 'POST',
            url: '/getuser',
            async: false,
            success: function(data) {
            	$('#main-content').html(data);
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    }
    
        function saveUser() {
            var form = $('#userForm');
            var url = form.attr('action');
            var formData = form.serialize();

            $.ajax({
                type: 'POST',
                url: '/changeaccount',
                data: formData,
                async: false,
                success: function(data) {
                	$('#main-content').html(data);
                	alert('save success');
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        }
        
        function getRobots() {

            $.ajax({
                type: 'POST',
                url: '/robots',
                async: false,
                success: function(data) {
                	$('#main-content').html(data);
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        }
        
        function getRobot(robotid) {

            $.ajax({
                type: 'POST',
                url: '/robot',
                data: {robotid: robotid},
                async: false,
                success: function(data) {
                	$('#main-content').html(data);
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        }
        
        function saveRobot() {
            var formData = new FormData();

            var robotid = document.getElementById("robotId").value;
            var model = document.getElementById("robotModel").value;
            var color = document.getElementById("robotColor").value;
            var size = document.getElementById("robotSize").value;

            formData.append("robotId", robotid);
            formData.append("model", model);
            formData.append("color", color);
            formData.append("size", size);

            var imageFile = document.getElementById("robotImage").files[0];
            if (imageFile) {
                formData.append("robotImage", imageFile);
            } 

            $.ajax({
                type: 'POST',
                url: '/saveRobot',
                data: formData,
                processData: false,
                contentType: false,
                success: function(data) {
                	alert('save success');
                },
                error: function(xhr, status, error) {
                }
            });
        }

        
        function logout() {

            $.ajax({
                type: 'POST',
                url: '/logout',
                async: false,
                success: function(data) {
                	$(document.body).html(data);
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        }
    </script>
    
</head>
<body>
    <!-- Top navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Robot Information Management System</a>
        <!-- ... more navbar content ... -->
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Side navigation bar -->
            <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                <div class="sidebar-sticky">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="javascript:void(0)" onclick="getUser()">
                                Account
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)" onclick="getRobots()">
                                Robot
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Main content area -->
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4" id="main-content">
                <!-- initial content goes here -->
                <h1>Welcome to the Robot Information Management System</h1>
            </main>
        </div>
    </div>
</body>
</html>
