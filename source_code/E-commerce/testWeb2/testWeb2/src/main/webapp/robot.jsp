<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Robot Information</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .right-label {
            font-size: 1rem;  /* Adjust this value to match the font size on the left */
        }
        .image-preview {
            width: 100%;
            height: 200px;
            object-fit: cover;
            margin-bottom: 15px;
        }
    </style>
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                
                reader.onload = function(e) {
                    document.getElementById('robotImagePreview').src = e.target.result;
                }
                
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <script>
        $(document).ready(function() {
            function refreshData() {
                var params = {
                    robotid: ${robot.id}
                    // Add more parameters as needed
                };

                // 尝试从缓存中获取数据
                var cachedData = localStorage.getItem('cachedData');
                if (cachedData) {
                    // 如果缓存中有数据，直接使用缓存数据填充表格
                    displayData(JSON.parse(cachedData));
                }

                // Make an AJAX request to the Servlet to get new data
                $.get("/getdata", params, function(data) {
                    // alert(data);
                    // Sort the data by 'id' in ascending order
                    data.sort(function(a, b) {
                        return a.id - b.id;
                    });

                    // 缓存数据
                    localStorage.setItem('cachedData', JSON.stringify(data));

                    // 填充表格
                    displayData(data);

                    drawLineChart(data);
                });
            }

            function displayData(data) {
                // 清空表格
                $("#data-table-body").empty();

                // Iterate through the sorted data and populate the table
                data.forEach(function(item) {
                    $("#data-table-body").append("<tr><td>" + item.id + "</td><td>" + item.time + "</td><td>" + item.front_distance + "</td><td>" + item.left_distance + "</td><td>" + item.right_distance + "</td></tr>");
                });
            }
            function drawLineChart(data) {
                // Extract x and y values from data
                var timeValues = data.map(function(item) {
                    return item.time;
                });

                var frontDistanceValues = data.map(function(item) {
                    return item.front_distance;
                });

                var leftDistanceValues = data.map(function(item) {
                    return item.left_distance;
                });

                var rightDistanceValues = data.map(function(item) {
                    return item.right_distance;
                });

                // Create a Chart.js chart
                var ctx = document.getElementById('lineChart').getContext('2d');

                var lineChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: timeValues, // X-axis values (time)
                        datasets: [
                            {
                                label: 'Front Distance',
                                borderColor: 'blue',
                                data: frontDistanceValues
                            },
                            {
                                label: 'Left Distance',
                                borderColor: 'green',
                                data: leftDistanceValues
                            },
                            {
                                label: 'Right Distance',
                                borderColor: 'red',
                                data: rightDistanceValues
                            }
                        ]
                    },
                    options: {
                        scales: {
                            x: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Time'
                                }
                            }],
                            y: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Distance'
                                }
                            }]
                        }
                    }
                });
            }

            // Refresh the data every second
            setInterval(refreshData, 1000);
        });




    </script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <form>
                    <div class="form-group">
                        <label for="robotImage">Image</label>
                        <img id="robotImagePreview" class="image-preview" src="${robot.imgpath}" alt="image"/>
                        <input type="file" class="form-control" id="robotImage" onchange="readURL(this)">
                    </div>
                    <div class="form-group">
                        <label for="robotId">ID</label>
                        <input type="text" class="form-control" id="robotId" placeholder="ID" value="${robot.id}" disabled>
                    </div>
                    <div class="form-group">
                        <label for="robotName">Name</label>
                        <input type="text" class="form-control" id="robotName" placeholder="Name" value="${robot.name}" disabled>
                    </div>
                    <div class="form-group">
                        <label for="robotModel">Model</label>
                        <input type="text" class="form-control" id="robotModel" placeholder="Model" value="${robot.model}">
                    </div>
                    <div class="form-group">
                        <label for="robotColor">Color</label>
                        <input type="text" class="form-control" id="robotColor" placeholder="Color" value="${robot.color}">
                    </div>
                    <div class="form-group">
                        <label for="robotSize">Size</label>
                        <input type="text" class="form-control" id="robotSize" placeholder="Size" value="${robot.size}">
                    </div>
                    <!-- <button type="submit" class="btn btn-primary">Save</button> -->
                    <button type="button" class="btn btn-primary" onclick="saveRobot()">Save</button>
                </form>
            </div>
            <div class="col-md-9">
                <div class="right-label"><b>Average Maze Exploration Time: ${robot.avgtime}</b></div>
                <p></p>
                <div class="right-label"><b>Score Statistics: ${robot.score}</b></div>
                <p></p>
                <div class="right-label"><b>Speed: ${robot.speed}</b></div>
                <p></p>
                <div class="right-label"><b>Path: ${robot.path}</b></div>
                <p></p>
                <canvas id="lineChart" width="400" height="200"></canvas>

                <div style="height: 600px; overflow-y: scroll;">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>time</th>
                            <th>front_distance</th>
                            <th>left_distance</th>
                            <th>right_distance</th>
                        </tr>
                        </thead>
                        <tbody id="data-table-body">
<%--                        <tr>--%>
<%--                            <td>Row 1, Cell 1</td>--%>
<%--                            <td>Row 1, Cell 2</td>--%>
<%--                            <!-- Add more table cells as needed -->--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Row 2, Cell 1</td>--%>
<%--                            <td>Row 2, Cell 2</td>--%>
<%--                            <!-- Add more table cells as needed -->--%>
<%--                        </tr>--%>
<%--                        <!-- Add more table rows as needed -->--%>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                	<c:forEach items="${robot.photos}" var="photo">
                    <div class="col-md-4">
                        <img src="${photo}/photo" class="img-fluid" alt="Image">
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
