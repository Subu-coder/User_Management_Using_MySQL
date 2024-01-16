package com.org.admin_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.dao.UserDao;
import com.org.dto.Admin;
import com.org.dto.User;

@WebServlet("/register_admin")
public class AdminRegister extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		Long mobile = Long.parseLong(req.getParameter("mobile"));
		String email = req.getParameter("mail");
		String pass = req.getParameter("pass");
		
		Admin admin = new Admin();
		admin.setName(name);
		admin.setAge(age);
		admin.setMobile(mobile);
		admin.setEmail(email);
		admin.setPassword(pass);
		
		UserDao ud = UserDao.getUserDao();
		ud.SaveDetails(admin, "Admin");
		resp.sendRedirect("login.jsp");
	}
}
