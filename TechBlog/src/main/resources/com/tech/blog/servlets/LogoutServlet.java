package com.tech.blog.servlets;

import com.tech.blog.DAO.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LogoutServlet extends HttpServlet {
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //Remove session and remove Current user all  details
        HttpSession s = request.getSession();
        s.removeAttribute("currentUser");
        Message m = new Message("Logout Successfully!","success","alert-success");
s.setAttribute("msg",m);
        response.sendRedirect("loginPage.jsp");
        System.out.println("this is logout Servlet");


    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }
}
