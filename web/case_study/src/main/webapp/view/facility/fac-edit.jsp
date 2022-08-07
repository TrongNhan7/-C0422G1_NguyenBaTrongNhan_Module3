<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
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
</div>

<c:if test="${mess!=null}">
    <p class="text-danger" align="center" style="font-size: 50px">${mess}</p>
</c:if>
<div class="container-fluid ">
    <div class="row">
        <div class="col-lg-3">
            <img src="img\4056083.jpg" class="w-100 " style="height: 300px">
            <img src="img\biet-thu.jpg" class="w-100 mt-3" style="height: 300px">
        </div>

        <div class="col-lg-6">
            <h1>Create Facility</h1>
            <form action="/facility?action=editFacility" method="post">
                <table>
                    <input type="hidden" name="id" id="id" value="${facility.id}">
                    <input type="hidden" name="serviceTypeId" id="serviceTypeId" value="${facility.serviceTypeId}">
                    <input type="text" class="form-control" id="name" name="nameFacility" placeholder="Name Service"
                           value="${facility.nameService}">
                    <input type="number" class="form-control" id="area" name="area" placeholder="Area"
                           value="${facility.area}">
                    <input type="number" class="form-control" id="cost" name="cost" placeholder="Cost"
                           value="${facility.cost}">
                    <input type="text" class="form-control" id="max_people" name="max_people" placeholder="Max people"
                           value="${facility.maxPeople}">
                    <input type="text" class="form-control" id="standard_room" name="standard_room" placeholder="Standard room"
                           value="${facility.standardRoom}">
                    <input type="text" class="form-control" id="description_other_convenience"
                           name="description_other_convenience" placeholder="Convenience"
                           value="${facility.descriptionOtherConvenience}">
                    <input type="number" class="form-control" id="pool_area" name="pool_area" placeholder="Pool Area"
                           value="${facility.areaPool}">
                    <input type="number" class="form-control" id="number_of_floors" name="number_of_floors" placeholder="Number of floors"
                           value="${facility.numberOfFloors}">
                    <input type="text" class="form-control" id="facility_free" name="facility_free" placeholder="Facility Free"
                           value="${facility.serviceFree}">
                    <select name="rent_type_id" id="rent_type_id" >
                        <option value="none">Rent Type</option>
                        <option value="1">Year</option>
                        <option value="2">Month</option>
                        <option value="3">Day</option>
                        <option value="4">Hour</option>
                    </select>
                    <div class="col-12 mt-3" align="center">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </table>
            </form>
        </div>
        <div class="col-lg-3">
            <img src="img\4056083.jpg" class="w-100 " style="height: 300px">
            <img src="img\biet-thu.jpg" class="w-100 mt-3" style="height: 300px">
        </div>
    </div>
</div>
<script src="js/bootstrap.min.js"></script>
<script>
    window.onload = function() {
        let serviceTypeId =  document.getElementById("serviceTypeId").value;
        display(serviceTypeId)
    };
    function display(type) {
        switch (type) {
            case "1":
                document.getElementById("standard_room").style.display = "block";
                document.getElementById("description_other_convenience").style.display = "block";
                document.getElementById("pool_area").style.display = "block";
                document.getElementById("number_of_floors").style.display = "block";
                document.getElementById("facility_free").style.display = "none";
                document.getElementById("facility_free").value = "";
                document.getElementById("rent_type_id").value = ${facility.rentTypeId};
                break;
            case "2":
                document.getElementById("standard_room").style.display = "block";
                document.getElementById("description_other_convenience").style.display = "block";
                document.getElementById("pool_area").style.display = "none";
                document.getElementById("pool_area").value = 0;
                document.getElementById("number_of_floors").style.display = "block";
                document.getElementById("facility_free").style.display = "none";
                document.getElementById("facility_free").value = "";
                document.getElementById("rent_type_id").value = ${facility.rentTypeId};

                break;
            case "3":
                document.getElementById("standard_room").style.display = "none";
                document.getElementById("description_other_convenience").style.display = "block";
                document.getElementById("pool_area").style.display = "none";
                document.getElementById("number_of_floors").style.display = "none";
                document.getElementById("facility_free").style.display = "block";
                document.getElementById("standard_room").value = "";
                document.getElementById("pool_area").value = 0;
                document.getElementById("number_of_floors").value = 0;
                document.getElementById("rent_type_id").value = ${facility.rentTypeId};

                break;
        }
    }
</script>

<%--                    <div class="col-md-12 ">--%>
<%--                        <label for="serviceTypeId" class="form-label">Rent Type</label>--%>
<%--                        <select name="serviceTypeId" id="serviceTypeId">--%>
<%--                            <option value="1">Villa</option>--%>
<%--                            <option value="2">House</option>--%>
<%--                            <option value="3">Room</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
</body>
</html>
