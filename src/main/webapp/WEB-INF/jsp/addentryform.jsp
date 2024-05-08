<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My diary App</title>
<link rel="stylesheet" href="<c:url value="css/style.css"/>">
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
			<h1>ADD ENTRY</h1><br><br>
			<form action="./saveentry" method="post">
				<label>Date </label><input type="date" name="entrydate" class="formcontrolls"><br><br>
				<label>Description</label> 
				<textarea rows="10" cols="30" name="description"></textarea>
				<input type="hidden" name="userid" value="${user.id }">
				<br><br>
				<button type="submit">SAVE ENTRY</button>
			</form>
		</div>
	</div>
</body>
</html>