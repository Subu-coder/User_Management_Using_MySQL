package com.org.Users;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.dao.UserDao;

@WebServlet("/delete_user")
public class DeleteUser extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao ud = UserDao.getUserDao();
		int id = Integer.parseInt(req.getParameter("id"));
		ud.deleteUserById(id);
		resp.sendRedirect("Home.jsp");
	}
}
