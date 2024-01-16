<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
    <link rel="stylesheet" href="CSS Files/registration_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" href="https://th.bing.com/th/id/R.6b0022312d41080436c52da571d5c697?rik=Ql6UUNosrWAY0w&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpng-user-icon-icons-logos-emojis-users-2400.png&ehk=8agkVrs8bo9zafVF9Qk4%2bFqv5IwaEZrb8DwX%2ftfJtNc%3d&risl=&pid=ImgRaw&r=0">
    
</head>
<body>
    <header>
        <h1>User Login</h1>
        <ul>
            <li><a href="Home.jsp"><i class="fa-solid fa-house"></i> Home</a></li>
            <li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Login</a></li>
        </ul>
    </header>
    <main>

        <div class="container">
            <h1>User Registration Form</h1>
            <div class="details">
                <form action="register_admin" method="post">
                    <label for="">Name</label> <br>
                    <input type="text" required name="name">
                    <br><br>
                    <label for="">Age</label> <br>
                    <input type="number" required name="age">
                    <br><br>
                    <label for="">Mobile Number</label> <br>
                    <input type="number" required name="mobile">
                    <br><br>
                    <label for="">Email</label> <br>
                    <input type="email" required name="mail">
                    <br><br>
                    <label for="">Password</label> <br>
                    <input type="password" required name="pass">
                    <br><br>
                    <button type="submit">Register</button>
                </form>
            </div>
        </div>
    </main>
</body>
</html>