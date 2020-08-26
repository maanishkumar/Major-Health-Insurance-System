<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
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

<title>Create Account</title>
</head>

<body>
	<div class="container-fluid">
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





		<div class="">
			<div class="row ">
				<div class="col-md-8"></div>

				<div class="col-md-4">

					<form:form action="createPlan" modelAttribute="account"
						method="POST" class="container">

						<form:hidden path="planId" />

						<br></br>

						<h2 align="center" style="color: black">Register Or Update
							Plan</h2>
						<h4 align="center">
							<font style="color: white">${UpdateMsg}</font>
						</h4>
						<h4 align="center">
							<font style="color: white">${msg}</font>
						</h4>
						<h4>
							<font style="color: red">${errMsg}</font>
						</h4>


						<div class="form-row mb-3">
							<label>Plan Name</label>
							<form:input path="planName" placeholder="Please enter plan name"
								class="form-control" required="true" />
						</div>
						<div class="form-row mb-3">
							<label>Plan Description</label>
							<form:textarea path="planDescription"
								placeholder="Please enter plan description" class="form-control"
								rows="3" required="true" />
						</div>
						<div class="form-row mb-3">
							<label>Plan Start Date</label>
							<form:input path="planStartDate" type="date"
								placeholder="Please enter plan start date" class="form-control"
								required="true" />
						</div>
						<div class="form-row mb-3">
							<label>Plan End Date</label>
							<form:input path="planEndDate" type="date"
								placeholder="Please enter plan end date" class="form-control"
								required="true" />
						</div>


						<div class="form-row">
							<button class="btn btn-md btn-success btn-block " type="submit">Create/Update
								Plan</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>

	</div>
	<!-- boot strap Js Link -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
</body>

</html>