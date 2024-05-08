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
	<br><br>
	<h1>Welcome <span style="color:SteelBlue;">${user.username}</span></h1>
	<a href="./signout" style="color:red;float:right;">signout</a>
	<div class="bodypart">
		<div class="bodypart1">
			<img alt="" src="<c:url value="/images/diary.jfif"/>" width="200px" height="200px">
		</div>
		<div class="bodypart2">
			<h1>UPDATE ENTRY</h1><br><br>
			<form action="./processupdateentry" method="post">
				<label>Date </label><input type="text" name="entrydate" class="formcontrolls" value="<fmt:formatDate value="${entry.entrydate}" pattern="yyyy-MM-dd"/>" readonly><br><br>
				<label>Description</label> 
				<textarea rows="10" cols="30" name="description">${entry.description}</textarea>
				<input type="hidden" name="userid" value="${user.id}">
				<input type="hidden" name="id" value="${entry.id}">
				<br><br>
				<a href="./userhomepage"><button type="submit">UPDATE ENTRY</button></a>
			</form>
		</div>
	</div>
</body>
</html>