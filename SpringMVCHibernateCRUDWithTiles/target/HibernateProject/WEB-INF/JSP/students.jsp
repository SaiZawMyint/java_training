<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
String path = request.getContextPath();

String id = "", name = "", roll = "", age = "", gender = "";
if (request.getAttribute("dataMissing") != null) {
	@SuppressWarnings("unchecked")
	HashMap<String, String> map = (HashMap<String, String>) request.getAttribute("dataMissing");
	System.out.println(map);
	name = map.containsKey("name") ? map.get("name") : "";
	roll = map.containsKey("roll") ? map.get("roll") : "";
	age = map.containsKey("age") ? map.get("age") : "";
	gender = map.containsKey("gender") ? map.get("gender") : "";
}
Integer ids = null;
if (request.getAttribute("id") != null) {
	ids = (int) request.getAttribute("id");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Data</title>
<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style>
.wrapper {
		margin: 50px auto;
		width: fit-content;
}

.wrapper h3 {
		text-align: center;
}

.wrapper input {
		width: 100%;
}
</style>
</head>
<body>
		<div class="wrapper">
				<h3>Student Data</h3>
				<form:form method="post"
						action="${pageContext.request.contextPath}/student"
						modelAttribute="student">
						<div class="table-responsive">
								<table class="table table-bordered" style="width: 500px">
										<tr>
												<td>Name :</td>
												<td><form:input type="text" path="name" /><br><%=name%></td>
												<%
												//We don't want to let user edit default id.
												if (ids != null) {
												%>
												<form:input type="text" path="id" value="<%=ids%>"
														hidden="hidden" />
												<%
												}
												%>
										</tr>
										<tr>
												<td>Roll No :</td>
												<td><form:input type="text" path="roll" /><br><%=roll%></td>
										</tr>
										<tr>
												<td>Age :</td>
												<td><form:input type="number" path="age" /><br><%=age%></td>
										</tr>
										<tr>
												<td>Gender :</td>
												<td><form:input type="text" path="gender" /><br><%=gender%></td>
										</tr>
										<tr>
												<td></td>
												<td><input class="btn btn-primary btn-sm" type="submit"
														value="Submit" /></td>
										</tr>
								</table>
						</div>
				</form:form>
				<br>
				<h3>List of Student</h3>
				<table class="table table-bordered" style="width: 500px">
						<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Roll No.</th>
								<th>Age</th>
								<th>Gender</th>
								<th>Edit/Delete</th>
						</tr>
						<c:forEach items="${studentList}" var="student">
								<tr>
										<td width="60" align="center">${student.id}</td>
										<td width="150" align="center">${student.name}</td>
										<td width="150" align="center">${student.roll}</td>
										<td width="150" align="center">${student.age}</td>
										<td width="150" align="center">${student.gender}</td>
										<td width="150" align="center"><a
												href="${pageContext.request.contextPath}/edit/${student.id}">Edit</a>/
												<a
												href="${pageContext.request.contextPath}/delete/${student.id}">Delete</a></td>
								</tr>
						</c:forEach>
				</table>
		</div>
</body>
</html>