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
		url("https://ejournalz.com/wp-content/uploads/2018/11/Health-Insurance-Plan.jpg");
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

<script>
	$("#mySelect").on("change", function() {
		var opt = $(this).val();
		$("tr").each(function() {
			var tr = $(this);
			tr.show();
			if (!tr.hasClass(opt)) {
				tr.hide();
			}
		});
	});
</script>

<title>Account details</title>
</head>
<body>
	<div class="container-fluid ">

		<nav class="navbar navbar-expand-lg navbar-dark bg-dark rounded">
			<a class="navbar-brand" href="#">Health-Insurance-System</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarTogglerDemo02"
				aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</nav>
		<br></br>
		<h2 align="center" style="color: black">VIEW ACCOUNTS</h2>
		<div>
			<h3 align="center" style="color: red">${DeleteMsg}</h3>
			<h3 align="center" style="color: green">${ActivateMsg}</h3>
		</div>

		<div class="container">
			<form>
				<div class="form-group">
					<label for="inputState">Select Role:</label> <select id="mySelect"
						class="form-control">
						<option selected>Choose...</option>
						<option>Case Worker</option>
						<option>Admin</option>
					</select>
				</div>
			</form>
		</div>

		<div class="container">
			<table id="accountTbl" class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">S.No</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Role</th>

						<th scope="col">Account Status</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${accounts}" var="c" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td>${c.name}</td>
							<td>${c.email}</td>
							<td>${c.role}</td>
							<td>${c.lockStatus}</td>

							<td><a class="btn btn-primary"
								href="/editAccount?aid=${c.accountId}" role="button">Edit</a> <c:if
									test="${c.deletedSwitch =='Y'}">
									<a class="btn btn-success"
										href="/activateAccount?aid=${c.accountId}" role="button"
										onclick="return activateConfirm()">Activate</a>
								</c:if> <c:if test="${c.deletedSwitch =='N'}">
									<a class="btn btn-danger"
										href="/deleteAccount?aid=${c.accountId}" role="button"
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