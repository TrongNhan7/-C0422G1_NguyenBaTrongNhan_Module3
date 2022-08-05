<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/5/2022
  Time: 6:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-dark">
    <div class="container-fluid ">
        <div class="collapse navbar-collapse mt-2" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll " style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                    <a class="btn btn-primary" href="/index.jsp" role="button">Home</a>
                </li>
                <li class="nav-item ms-3">
                    <a class="btn btn-primary" href="/facility" role="button">Back to List</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container bg-light w-50 h-100">
    <h1>Edit Facility</h1>
    <form action="/facility?action=create" method="post">
        <div class="col-lg-12">
            <label for="facilityType">Choose a service:</label>
            <select onchange="chooseServiceType()" id="facilityType">
                <option value="None">Choose a service:</option>
                <option value="Villa">Villa</option>
                <option value="House">House</option>
                <option value="Room">Room</option>
            </select>
        </div>
        <div class="col-md-12">
            <label for="name" class="form-label">Name Service</label>
            <input type="text" class="form-control" id="name" name="name"
                   value="<c:out value='${facility.nameService}'/>" required>
        </div>
        <div class="col-md-12">
            <label for="area" class="form-label">Area</label>
            <input type="number" class="form-control" id="area" name="area"
                   value="<c:out value='${facility.area}'/>" required>
        </div>
        <div class="col-md-12">
            <label for="cost" class="form-label">Cost</label>
            <input type="number" class="form-control" id="cost" name="cost"
                   value="<c:out value='${facility.cost}'/>" required>
        </div>
        <div class="col-md-12">
            <label for="inputAddress2" class="form-label">Max people </label>
            <input type="number" class="form-control" id="inputAddress2" name="max_people"
                   value="<c:out value='${facility.maxPeople}'/>" required>
        </div>
        <div class="col-md-12">
            <label for="inputCity" class="form-label">Rent Type</label>
            <input type="text" class="form-control" id="inputCity" name="rent_type_id"
                   value="<c:out value='${facility.rentType}'/>" required>
        </div>
        <div class="col-md-12 " id="s1" style="display: none">
            <label for="standard_room" class="form-label">Standard room</label>
            <input type="text" class="form-control" id="standard_room" name="standard_room"
                   value="<c:out value='${facility.standardRoom}'/>" required>
        </div>

        <div class="col-md-12 " id="s2" style="display: none">
            <label for="description_other_convenience" class="form-label">Convenience</label>
            <input type="text" class="form-control" id="description_other_convenience"
                   name="description_other_convenience"
                   value="<c:out value='${facility.descriptionOtherConvenience}'/>" required>
        </div>

        <div class="col-md-12 " id="s3" style="display: none">
            <label for="pool_area" class="form-label">Pool Area</label>
            <input type="number" class="form-control" id="pool_area" name="pool_area"
                   value="<c:out value='${facility.areaPool}'/>" required>
        </div>

        <div class="col-md-12" id="s4" style="display: none">
            <label for="number_of_floors" class="form-label">Number of floors</label>
            <input type="number" class="form-control" id="number_of_floors" name="number_of_floors"
                   value="<c:out value='${facility.numberOfFloors}'/>" required>
        </div>

        <div class="col-md-12 " id="s5" style="display: none">
            <label for="facility_free" class="form-label">Facility Free</label>
            <input type="text" class="form-control" id="facility_free" name="facility_free"
                   value="<c:out value='${facility.facilityFree}'/>" required>
        </div>

        <div class="col-12 mt-3" align="center">
            <button type="submit" class="btn btn-primary">Edit</button>
        </div>
    </form>
</div>
<script src="js/bootstrap.min.js"></script>
<script>
    function chooseServiceType() {
        let type = document.getElementById("facilityType").value;
        switch (type) {
            case 'None':
                document.getElementById("s1").style.display = "none";
                document.getElementById("s2").style.display = "none";
                document.getElementById("s3").style.display = "none";
                document.getElementById("s4").style.display = "none";
                document.getElementById("s5").style.display = "none";
                break;
            case "Villa":
                document.getElementById("s1").style.display = "block";
                document.getElementById("s2").style.display = "block";
                document.getElementById("s3").style.display = "block";
                document.getElementById("s4").style.display = "block";
                document.getElementById("s5").style.display = "none";
                break;
            case "House":
                document.getElementById("s1").style.display = "block";
                document.getElementById("s2").style.display = "block";
                document.getElementById("s4").style.display = "block";
                document.getElementById("s5").style.display = "none";
                document.getElementById("s3").style.display = "none";
                break;
            case "Room":
                document.getElementById("s1").style.display = "none";
                document.getElementById("s2").style.display = "none";
                document.getElementById("s3").style.display = "none";
                document.getElementById("s4").style.display = "none";
                document.getElementById("s5").style.display = "block";
                break;
        }
    }
</script>
</body>
</html>
