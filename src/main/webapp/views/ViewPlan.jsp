<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<style>
body {
	
	background-image:
		url("https://www.policyboss.com/blog/wp-content/uploads/2014/10/5-best-child-insurance-plans-1024x626.jpg");
}
</style>

<script>
	function deleteConfirm() {
		return confirm("Are you sure, you want to delete?");
	}
	function activateConfirm() {
		return confirm("Are you sure, you want to activate?");
	}
</script>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<link
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">

<script>
	$(document).ready(function() {
		$('#accountTbl').DataTable({
			"pagingType" : "full_numbers"
		});
	});
</script>

<title>Plan details</title>
</head>
<body>
	<div class="container-fluid ">

		<div>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<a class="navbar-brand" href="#">Health-Insurance</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link" href="#">Account
								Registration <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item active"><a class="nav-link" href="#">Data
								Collection</a></li>
						<li class="nav-item dropdown active"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Admin </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="/loadForm">Create Account</a> <a
									class="dropdown-item" href="/viewAccount">View Accounts</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/loadPlanForm">Create Plan</a> <a
									class="dropdown-item" href="/viewPlan">View Plans</a>
							</div></li>
					</ul>
					<form class="form-inline my-2 my-lg-0">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
					</form>
				</div>
			</nav>
		</div>
		<br></br>
		<h2 align="center" style="color: black">VIEW PLANS</h2>
		<div>
			<h3 align="center" style="color: white">${DeleteMsg}</h3>
			<h3 align="center" style="color: white">${ActivateMsg}</h3>
		</div>

		<div class="container">
			<table id="accountTbl" class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">S.No</th>
						<th scope="col">Plan Name</th>
						<th scope="col">Plan Description</th>
						<th scope="col">Plan Start Date</th>
						<th scope="col">Plan End Date</th>
						
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${plans}" var="c" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td>${c.planName}</td>
							<td>${c.planDescription}</td>
							<td>${c.planStartDate}</td>
							<td>${c.planEndDate}</td>

							<td><a class="btn btn-primary"
								href="/editPlan?pid=${c.planId}" role="button">Edit</a> <c:if
									test="${c.activeSwitch =='N'}">
									<a class="btn btn-success" href="/activatePlan?pid=${c.planId}"
										role="button" onclick="return activateConfirm()">Activate</a>
								</c:if> <c:if test="${c.activeSwitch =='Y'}">
									<a class="btn btn-danger"
										href="/deletePlan?pid=${c.planId}" role="button"
										onclick="return deleteConfirm()">Delete</a>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


</body>

</html>