package com.org.Users;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/edit_user")
public class UpdateUser extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id =Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		Long mobile = Long.parseLong(req.getParameter("mobile"));
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		User user = new User();
		user.setName(name);
		user.setAge(age);
		user.setMobile(mobile);
		user.setGender(gender);
		user.setEmail(email);
		user.setPassword(pass);
		 
		UserDao ud = UserDao.getUserDao();
		ud.updateUserById(user, "user",id);
		resp.sendRedirect("UpdateDetailsPage.jsp?id="+id);
	}
}
