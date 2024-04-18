package com.tech.blog.servlets;

import com.tech.blog.DAO.UserDao;
import com.tech.blog.DAO.PostDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.entities.Post;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class addPostServlet extends HttpServlet {
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            //fetch all data
            int catId = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pImg");
            String pImage = part.getSubmittedFileName();

            //getting CurrentUser ID
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            int userId = user.getId();


//            out.println("your post title is :" + pTitle);
//            out.println(fileName);

            Post p = new Post(pTitle, pContent, pCode, pImage, null, catId, userId);
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            if (dao.savePost(p)) {

                String path  = request.getRealPath("/") + "PostImg" + File.separator + pImage;
                helper.saveFile(part.getInputStream(),path);

                out.println("done");

            } else {
                out.println("error");
            }


        } catch (Exception e) {
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
