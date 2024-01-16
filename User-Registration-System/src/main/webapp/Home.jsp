<%@page import="com.org.dto.Admin"%>
<%@page import="com.org.dto.User"%>
<%@page import="com.org.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@ include file="components/icons.jsp"%>
<link rel='stylesheet' href="CSS Files/home_style.css">
<link rel="icon" href="https://th.bing.com/th/id/R.6b0022312d41080436c52da571d5c697?rik=Ql6UUNosrWAY0w&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpng-user-icon-icons-logos-emojis-users-2400.png&ehk=8agkVrs8bo9zafVF9Qk4%2bFqv5IwaEZrb8DwX%2ftfJtNc%3d&risl=&pid=ImgRaw&r=0">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<%
	UserDao dao = UserDao.getUserDao();
	List<User> users = dao.fetchAllUsers();
	Admin admin = (Admin) session.getAttribute("isLoggedIn");
	if (admin != null) {
	%>
	<header>
		<h1>User Management</h1>
		<h1>Home Page</h1>
		<ul>
			<li><a href="Home.jsp"><i class="fa-solid fa-house"></i>
					Home</a></li>
			<li><a href="AddUserPage.jsp"><i
					class="fa-solid fa-user-plus"></i> Add User</a></li>
			<li><a href="AdminProfile.jsp?mail=<%=admin.getEmail()%>"><i
					class="fa-solid fa-user"></i> <%=admin.getName()%></a></li>
			<li><a href="logout_admin"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
		</ul>
	</header>

	<main>
		<table>
			<caption>User Details</caption>
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Age</th>
					<th>Mobile</th>
					<th>Gender</th>
					<th>Email</th>
					<th colspan=2>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (User u : users) {
					int id = u.getId();
				%>
				<tr>
					<td><%=id%></td>
					<td><%=u.getName()%></td>
					<td><%=u.getAge()%></td>
					<td><%=u.getMobile()%></td>
					<td><%=u.getGender()%></td>
					<td><%=u.getEmail()%></td>
					<form method="post">
					<td>
						<button type="submit"
							formaction="UpdateDetailsPage.jsp?id=<%=id%>">Edit</button>
					</td>
					<td>
						<button type="submit" formaction="delete_user?id=<%=id%>">Delete</button>
					</td>
					</form>
				</tr>
				<%
				}
				} else
				response.sendRedirect("login.jsp");
				%>
			</tbody>
		</table>

	</main>
</body>
</html>