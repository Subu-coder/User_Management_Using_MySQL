package com.org.admin_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.Admin;

@WebServlet("/login_admin")
public class AdminLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mail = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		UserDao ud = UserDao.getUserDao();
		Admin admin = ud.fetchAdminByEmailAndPassword(mail, pass);
		if(admin!=null) {
			resp.sendRedirect("Home.jsp");
			System.out.println("Logged In");
			
			HttpSession session = req.getSession();
			session.setAttribute("isLoggedIn", admin);
		
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("msg", "Invalid Email or Password");
			resp.sendRedirect("login.jsp");
		}
	}
}
