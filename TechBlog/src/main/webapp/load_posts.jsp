<%@page import="com.tech.blog.entities.Message" %>
  <%@page import="com.tech.blog.entities.User" %>
    <%@page import="com.tech.blog.DAO.PostDao" %>
      <%@page import="com.tech.blog.entities.Category" %>
        <%@page import="java.util.ArrayList" %>
          <%@page import="com.tech.blog.helper.ConnectionProvider" %>
          <%@page import="com.tech.blog.entities.Post" %>
          <%@page import="com.tech.blog.DAO.PostDao" %>
          <%@page import="java.util.List" %>
          <link rel="stylesheet" type="text/css" href="css/style.css">

<div class="row">



<% 
Thread.sleep(400);
List<Post> posts = null;
 PostDao d = new PostDao(ConnectionProvider.getConnection());
 int cid = Integer.parseInt(request.getParameter("cid"));
 if(cid == 0){
  posts = d.getAllPosts();
 }else{
   posts =d.getPostByCatId(cid);
 }
 if(posts.size() == 0){

  out.println("<h3 class='display-3 text-center'>No Post Aavilable in This Category</h3>");
 }

  for(Post p: posts)
  {
%>

<div class="col-md-6">

  <div class="card">

    <div class="card-body">
      <img class="card-img-top" src="PostImg/<%=p.getpPic() %>" alt="Card image cap">
      <h3><%=p.getpTitle() %></h3>
      <p><%=p.getpContent() %></p>
      
    </div>
    <div class="card-footer">
      <a href="#" class="btn btn-outline-primary btn-sm">Read More</a>
      <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
      <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>10</span></a>
   
    </div>
  </div>
</div>


<%

  }



%>
</div>