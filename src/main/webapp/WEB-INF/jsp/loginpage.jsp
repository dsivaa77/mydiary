<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My dairy App</title>
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
	<div class="bodypart">
		<div class="bodypart1">
			<img alt="" src="<c:url value="/images/diary.jfif"/>" width="200px" height="200px">
		</div>
		<div class="bodypart2">
			<h1>LOGINN HERE</h1><br><br>
			<form action="./authenticate" method="post">
				<label>username</label> <input type="text" name="username" class="formcontrolls"><br><br>
				<label>password</label> <input type="password" name="password" class="formcontrolls"><br><br>
				<button type="submit">LOGIN</button>
			</form>
			<br>
			New User? <a href="./register">register </a>here
		</div>
	</div>
</body>
</html>