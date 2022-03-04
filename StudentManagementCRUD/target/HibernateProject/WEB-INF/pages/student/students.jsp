<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
String path = request.getContextPath();

String id = "", action = "";
Integer ids = null;
if (request.getAttribute("id") != null) {
	ids = (int) request.getAttribute("id");
}
if (request.getAttribute("action") != null) {
	action = (String) request.getAttribute("action");
} else {
	action = "student";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Data</title>

</head>
<body>
  <c:if test="${systemMessage != null}">
    <div class="message-field">
      <p>${systemMessage}</p>
    </div>
  </c:if>

  <h3>Student Data</h3>
  <form:form method="post"
    action="${pageContext.request.contextPath}/${action }"
    modelAttribute="student">
    <div class="table-responsive">
      <table class="table table-bordered" style="width: 500px">
        <tr>
          <td>Name :</td>
          <td><form:input type="text" path="name" /> <i
            style="color: orange;"><form:errors path="name"
                cssClass="error" /></i></td>
          <c:if test="${refId != null }">
            <form:input type="text" path="id" value="<%=ids%>"
              hidden="hidden" />
          </c:if>
        </tr>
        <tr>
          <td>Roll No :</td>
          <td><form:input type="text" path="roll" /> <i
            style="color: orange;"><form:errors path="roll"
                cssClass="error" /></i></td>
        </tr>
        <tr>
          <td>Age :</td>
          <td><form:input type="number" path="age" /> <i
            style="color: orange;"><form:errors path="age"
                cssClass="error" /></i></td>
        </tr>
        <tr>
          <td>Gender :</td>
          <td><form:input type="text" path="gender" /> <i
            style="color: orange;"><form:errors path="gender"
                cssClass="error" /></i></td>
        </tr>
        <tr>
          <td></td>
          <td><input class="btn btn-primary btn-sm" name="addData"
            type="submit" value="Submit" /> <c:if
              test="${refId != null }">
              <input class="btn btn-primary btn-sm" name="cancel"
                type="submit" value="cancel" />
            </c:if></td>
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
</body>
</html>