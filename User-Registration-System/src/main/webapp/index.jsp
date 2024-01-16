<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
    <link rel="stylesheet" href="CSS Files/index_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link rel="icon" href="https://th.bing.com/th/id/R.6b0022312d41080436c52da571d5c697?rik=Ql6UUNosrWAY0w&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpng-user-icon-icons-logos-emojis-users-2400.png&ehk=8agkVrs8bo9zafVF9Qk4%2bFqv5IwaEZrb8DwX%2ftfJtNc%3d&risl=&pid=ImgRaw&r=0">
</head>
<body>
    <img src="components/image.png" alt="">
    <h1>User Management System</h1>
    <br><br>
    <form>
        <button type="submit" formaction="register.jsp"><i class="fa-solid fa-address-card"></i> Register</button>
        <button type="submit" formaction="login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Login</button>
    </form>
</body>
</html>