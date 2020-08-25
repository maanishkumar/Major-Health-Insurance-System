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

<title>Unlock account</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	function checkPasswordMatch() {
		var password = $("#txtNewPassword").val();
		var confirmPassword = $("#txtConfirmPassword").val();
		if (password != confirmPassword)
			$("#CheckPasswordMatch").html("Passwords does not match!");
		else
			$("#CheckPasswordMatch").html("Passwords match..");
	}
	$(document).ready(function() {
		$("#txtConfirmPassword").keyup(checkPasswordMatch);
	});
</script>
<style>
body {
	background-image:
		url("https://ejournalz.com/wp-content/uploads/2018/11/Health-Insurance-Plan.jpg");
}
</style>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark rounded">
			<a class="navbar-brand" href="#">Health-Insurance-System</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarTogglerDemo02"
				aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</nav>




		<div class="container">
		
			<div class="text-left">
				<br> <br>
				<h4>Unlock your account here</h4>
			</div>
			<hr>
			<form:form class="form-signin" action="unlockUserAcc"
				modelAttribute="unlockUser" method="POST">

				<label>Email ID</label>
				<form:input path="email" readonly="true" placeholder="Email address"
					class="form-control col-md-5 mb-1" />
				<br>
				<label>Enter temporary password</label>
				<form:password path="tempPwd" placeholder="Temporary password"
					class="form-control col-md-5 mb-1" required="true" />
				<font style="color: red">${errMsg}</font>
				<br>

				<label>Enter new password</label>
				<form:password id="txtNewPassword" path="newPwd"
					placeholder="New password" class="form-control col-md-5 mb-1 "
					required="true" />
				<br>
				<label>Confirm new password</label>
				<form:password id="txtConfirmPassword" path="confirmPwd"
					placeholder=" Confirm new password"
					class="form-control col-md-5 mb-1 " required="true" />
				<font style="color: red;" id="CheckPasswordMatch"></font>
				<br>
				<br>
				<button
					class="btn btn-md btn-primary btn-block form-control col-md-2 mb-3"
					type="submit" onClick="checkPasswordMatch()">Unlock
					Account</button>
				<br>

			</form:form>
		</div>
	</div>


</body>
</html>