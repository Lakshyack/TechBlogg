package com.tech.blog.servlets;

import com.tech.blog.DAO.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class RegisterServlet extends HttpServlet {


    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //fetch all data from form

        String check = request.getParameter("checkbox");
          if(check == null){
out.println("please Check checkbox");
          }else {
//              fetch left data from form
String name = request.getParameter("name");
String  email = request.getParameter("email");
String password = request.getParameter("password");
String gender = request.getParameter("gender");
String about = request.getParameter("about");

//create a user object and set all data to that object
              User user = new User(name,email,password,about,gender);

//create a user object
              UserDao dao = new UserDao(ConnectionProvider.getConnection());
              if(dao.saveUser(user)){
                  //save
                 out.println("done");
              }
              else {
                  out.println("error");
              }
          }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }
}

