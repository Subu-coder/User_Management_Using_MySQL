<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link rel="stylesheet" href="CSS Files/login_style.css">
    <link rel="icon" href="https://th.bing.com/th/id/R.6b0022312d41080436c52da571d5c697?rik=Ql6UUNosrWAY0w&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpng-user-icon-icons-logos-emojis-users-2400.png&ehk=8agkVrs8bo9zafVF9Qk4%2bFqv5IwaEZrb8DwX%2ftfJtNc%3d&risl=&pid=ImgRaw&r=0">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Login Page</title>
</head>

<body>


    <header>
        <h1>User Login</h1>
        <ul>
            <li><a href="Home.jsp"><i class="fa-solid fa-house"></i> Home</a></li>
            <li><a href="register.jsp"><i class="fa-solid fa-address-card"></i> Register</a></li>
        </ul>
    </header>
    <main>
        <div class="loginDiv">
            <form action="login_admin" method="post">
            <h1>Login</h1>
			<% 
			String msg = (String)session.getAttribute("msg"); 
				if(msg!=null){
			%>
			<h3 style="color:darkred">
				<%= msg %>
			</h3>
			<% session.removeAttribute("msg"); 
				}
			%>
                <div>
                    <i class="fa-solid fa-envelope"></i>
                    <input type="email" name="email" class="inputfield" placeholder="Enter Your email" required>
                </div>
                <div>
                    <i class="fa-solid fa-key"></i>
                    <input type="password" name="pass" class="inputfield" placeholder="Enter You Password" required>
                </div>
                <button type="submit">LOGIN</button>
            </form>
        </div>
    </main>
</body>

</html>