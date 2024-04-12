package com.tech.blog.servlets;

import com.tech.blog.DAO.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;
import com.tech.blog.DAO.postDao;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class EditServlet extends HttpServlet {
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            //fetch all data
            String userEmail = request.getParameter("user_email");
            String name = request.getParameter("user_name");
            String password = request.getParameter("password");
            String about = request.getParameter("about");
            Part part = request.getPart("profile-img");
            String imgName = part.getSubmittedFileName();


            //get the user from the session

            HttpSession s = request.getSession();
             User user = (User)s.getAttribute("currentUser");
             user.setEmail(userEmail);
             user.setPassword(password);
             user.setName(name);
             user.setAbout(about);
             String oldFile = user.getProfile();
             user.setProfile(imgName);


             //update data into database

            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean ans = userDao.updateUser(user);
            if(ans){

                String path  = request.getRealPath("/") + "ProfileImg" + File.separator + user.getProfile();
//              delete code
                String pathForDeleteFile  = request.getRealPath("/") + "ProfileImg" + File.separator + oldFile;

                if(!oldFile.equals("Default.png")){
                    helper.deleteFile(pathForDeleteFile);
                }

                //save file
                 if( helper.saveFile(part.getInputStream(),path)){
//                     out.println("File upload");
                     Message msg = new Message(" Profile Successfully update","success","alert-success");

                     s.setAttribute("msg",msg);
                 }
                 else {
//                     out.println("not update");
                     Message msg = new Message("Something went wrong!!","error","alert-danger");
                     s.setAttribute("msg",msg);
                 }


            }
            else {
//                out.println("not updated...");
                Message msg = new Message("Something went wrong!!","error","alert-danger");
                s.setAttribute("msg",msg);

            }

            response.sendRedirect("Profile.jsp");
        }catch (Exception e){
            e.printStackTrace();
        }




    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }
}
