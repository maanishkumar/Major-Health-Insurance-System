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
		url("https://ejournalz.com/wp-content/uploads/2018/11/Health-Insurance-Plan.jpg");
}


</style>

<title>Create Account</title>
</head>

<body>
	<div class="container-fluid">
		<div>
			<nav class="navbar navbar-expand-lg  navbar-dark bg-dark rounded">
				<a class="navbar-brand" href="#">Health-Insurance-System</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarTogglerDemo02"
					aria-controls="navbarTogglerDemo02" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</nav>
		</div>





		<div class="">
			<div class="row ">
				<div class="col-md-7"></div>

				<div class="col-md-5">

					<form:form action="create" modelAttribute="account" method="POST"
						class="container">
						<form:hidden path="accountId" />
						<br></br>
						<h2 align="center" style="color: blue">Create Account Here</h2>
						<p>
							<font style="color: green"><em>${UpdateMsg}</em></font>
						</p>
						<p>
							<font style="color: green"><em>${msg}</em></font>
						</p>
						<p>
							<font style="color: red"><em>${errMsg}</em></font>
						</p>

						<div class="form-row ">
							<div class="form-group col-md-6 mb-3">
								<label>First name</label>
								<form:input path="firstName" placeholder="First name"
									class="form-control" required="true" />
							</div>
							<div class="form-group col-md-6 mb-3">
								<label>Last name</label>
								<form:input path="lastName" placeholder="Last name"
									class="form-control" required="true" />
							</div>
						</div>

						<div class="form-row ">
							<label>Email Address</label>
							<form:input path="email" placeholder="Email ID"
								class="form-control" required="true" />
						</div>

						<div class="form-row ">

							<div class="col-md-6 mb-3 ">
								<label>Gender</label>
								<form:select class="custom-select" path="gender" required="true">
									<form:option value="">Choose...</form:option>
									<form:option value="Male">Male</form:option>
									<form:option value="FeMale">FeMale</form:option>
								</form:select>
							</div>

							<div class="col-md-6 mb-3">
								<label>Role</label>
								<form:select class="custom-select" path="role" required="true">
									<form:option value="">Choose...</form:option>
									<form:option value="Case Worker">Case Worker</form:option>
									<form:option value="Admin">Admin</form:option>

								</form:select>
							</div>
						</div>

						<div class="form-row">
							<button class="btn btn-md btn-primary btn-block " type="submit">Create/Update
								Account</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>

	</div>







</body>

</html>