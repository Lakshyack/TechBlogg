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

public class LoginServlet extends HttpServlet {
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //fetch email and password for login
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");


         UserDao dao = new UserDao(ConnectionProvider.getConnection());
         User u = dao.getUserBYEmailAndPassword(userEmail,userPassword);

          if(u == null){
              // login........
//              error///
//              out.println("Invalid Deatils .. try again");

              Message msg = new Message("Invalid Details ! Try with another","error","alert-danger");
              HttpSession s = request.getSession();
              s.setAttribute("msg",msg);
              response.sendRedirect("loginPage.jsp");
              System.out.println("hey this is massage");

          }else {
              // login success
              HttpSession s = request.getSession();
              s.setAttribute("currentUser",u);
              response.sendRedirect("Profile.jsp");
          }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }
}
