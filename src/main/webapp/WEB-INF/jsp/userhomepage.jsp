<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My diary App</title>
<link rel="stylesheet" href="<c:url value="/css/style.css"/>">
</head>
<body>
	<div class="header">
		<div class="first">
			<img alt="" src="<c:url value="/images/diary.jfif"/>" width="30px" height="30px">
		</div>
		<div class="second">MyDiary App</div>
	</div>
	<br>
	<hr>
	<br>
	<div class="userhome">
		Welcome <span style="color:SteelBlue;">${user.username}</span>
		
		<a href="./signout" style="color:red;float:right;">signout</a>
		<br><br><br>
		<span class="heading">List of Past Entries</span>
		<a href="./addentry"><button type="button" class="addbtn">Add Entry</button></a>
		<br><br>
		<table border="1">
			<tr>
				<th>Date</th>
				<th colspan="3">Action</th>
			</tr>
			<c:if test="${entrylist.size()==0}">
				<tr>
					<td colspan="4" style="font-size: 20px; color: green;text-align: center">User not added any diary entries till now</td>
				</tr>
			</c:if>
			<c:forEach items="${entrylist}" var="e">
				<tr>
					<td><fmt:formatDate value="${e.entrydate}" pattern="dd/MM/yyyy"/></td>
					<td><a href="./viewentry?id=${e.id}">View</a></td>
					<td><a href="./updateentry?id=${e.id}">Update</a></td>
					<td><a href="./deleteentry?id=${e.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>