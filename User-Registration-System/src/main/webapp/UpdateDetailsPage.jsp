<%@page import="com.org.dto.Admin"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dto.User"%>
<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Details</title>
	<link rel="stylesheet" href="CSS Files/Update_Page.css">
    <link rel="icon" href="https://th.bing.com/th/id/R.6b0022312d41080436c52da571d5c697?rik=Ql6UUNosrWAY0w&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpng-user-icon-icons-logos-emojis-users-2400.png&ehk=8agkVrs8bo9zafVF9Qk4%2bFqv5IwaEZrb8DwX%2ftfJtNc%3d&risl=&pid=ImgRaw&r=0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
</head>
<body>
	<%
	UserDao dao1 = UserDao.getUserDao();
	List<User> users = dao1.fetchAllUsers();
	Admin admin = (Admin) session.getAttribute("isLoggedIn");
	if (admin != null) {
	%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	UserDao ud = UserDao.getUserDao();
	User user = ud.fetchUserById(id);
	%>

	<header>
		<h1>
			<a href="index.html">User Management</a>
		</h1>
		<ul>
			<li><a href="Home.jsp"><i class="fa-solid fa-house"></i> Home</a></li>
			<li><a href="register.jsp"><i class="fa-solid fa-address-card"></i> Register</a></li>
			<li><a href="logout_admin"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
		</ul>
	</header>
	<main>
		<div class="form-container">
			<h2><%=user.getName()%>'s Profile Details</h2>
			<form action="edit_user" method="post">
				<label for="id">ID</label><br>
				 <input type="text" name="id"id="id" readonly required value=<%=user.getId()%>> 
				 <br><br> 
				
				<label for="name">Name</label><br> 
				<input type="text"name="name" id="name" value=<%=user.getName()%>> <br>
				<br> 
				
				<label for="age">Age</label><br>
				 <input type="number"name="age" id="age" value=<%=user.getAge()%>> <br>
				<br>
				
				 <label for="gender">Gender:</label>
				 <input type="radio" value="male" name="gender" id="male" required>
				<label for="male">Male</label>
				 <input type="radio" value="female" name="gender" id="female" required> <label for="female">Female</label>
				<br>
				<br> 
				
				<label for="mobile">Mobile</label><br> 
				<input
					type="number" name="mobile" id="mobile" maxlength="10" required value=<%=user.getMobile()%>>
				<br>
				<br>
				
				 <label for="email">Email</label><br>
				 <input
					type="email" name="email" id="email" required value=<%=user.getEmail()%>> <br>
				<br>
				<button type="submit">Update</button>
			</form>
		</div>
	</main>
	
	<script>
		<% String gender = user.getGender();
			if(gender.equals("male")){
		%>
				document.getElementById("male").checked=true;
				<%
			} else{
				%>
				document.getElementById("female").checked=true;
				<%
			}
		%>
	</script>
	
	<%
	} else
	response.sendRedirect("login.jsp");
	%>
</body>
</html>