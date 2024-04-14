<%@page import="com.tech.blog.entities.Message" %>
  <%@page import="com.tech.blog.entities.User" %>
    <%@page import="com.tech.blog.DAO.postDao" %>
      <%@page import="com.tech.blog.entities.Category" %>
        <%@page import="java.util.ArrayList" %>
          <%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%

postDao d = new postDao(ConnectionProvider.getConnection());
d.getAllPosts
%>
