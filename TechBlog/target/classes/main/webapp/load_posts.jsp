<%@page import="com.tech.blog.entities.Message" %>
  <%@page import="com.tech.blog.entities.User" %>
    <%@page import="com.tech.blog.DAO.PostDao" %>
      <%@page import="com.tech.blog.entities.Category" %>
        <%@page import="java.util.ArrayList" %>
          <%@page import="com.tech.blog.helper.ConnectionProvider" %>
          <%@page import="com.tech.blog.entities.Post" %>
          <%@page import="com.tech.blog.DAO.PostDao" %>
          <%@page import="java.util.List" %>

<div class="row">



<% 
 PostDao d = new PostDao(ConnectionProvider.getConnection());
 List<Post> posts = d.getAllPosts();
  for(Post p: posts)
  {
%>

<div class="col-md-6">

  <div class="card">

    <div class="card-body">
      <img class="card-img-top" src="PostImg/<%=p.getpPic() %>" alt="Card image cap">
      <h3><%=p.getpTitle() %></h3>
      <p><%=p.getpContent() %></p>
      <p><%=p.getpCode() %></p>
      <!-- <h3><%=p.getpPic() %></h3> -->
    </div>
  </div>
</div>


<%

  }



%>
</div>