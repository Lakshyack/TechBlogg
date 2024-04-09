<%@page import= "com.tech.blog.entities.User"%>
<%
User user =(User)session.getAttribute("currentUser"); 

if(user == null){
    response.sendRedirect("loginPage.jsp");
}

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile page!</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/utility.css">
<style>
    .banner-background {
        clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 74% 100%, 41% 93%, 0 100%, 0 0);
    }
</style>
</head>
<body>
   <!-- nav bar started -->


   <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span><img src="SVGs/techB.svg" alt="">&nbsp;</span>Tech Blog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#"><span><img src="SVGs/learn.svg" alt="">&nbsp;</span>Lear Code With Lakshya <span class="sr-only">(current)</span></a>
        </li>
       
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span><img class="" style="fill: aliceblue;" src="SVGs/list.svg" alt=""></span>
            Categories
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">Programming Language</a>
            <a class="dropdown-item" href="#">Project Implementation</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Data Structure</a>
          </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#"><span><img src="SVGs/contact.svg" alt="">&nbsp;</span>Contact Us</a>
          </li>
       
       

        <!-- <li class="nav-item">
          <a class="nav-link disabled" href="#">More</a>
        </li> -->
      </ul>
      <ul class="navbar-nav mr-right">
        <li class="nav-item">
            <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal" ><span><img class="icon" src="SVGs/logout.svg" alt=""></span><%= user.getName() %></a>
          </li>

        <li class="nav-item">
            <a class="nav-link" href="LogoutServlet"><span><img class="icon" src="SVGs/logout.svg" alt=""></span>Logout</a>
          </li>
      </ul>
    </div>
  </nav>

   <!-- end of Nav bar -->

      <!-- profile modal -->


<!-- Button trigger modal only for checking-->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#profile-modal">
    Launch demo modal
  </button> -->
  
  <!-- Modal -->
  <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header primary-background text-white text-center">
          <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div class="container text-center">
           
                <img src="ProfileImg/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width: 150px;" alt="">
        
                <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>

                <!-- details of user -->

               <div id="Profile-Details"> 
                <table class="table">
                    <tbody>
                      <tr>
                        <th scope="row">ID :</th>
                        <td><%= user.getId() %></td>
                   
                      </tr>
                      <tr>
                        <th scope="row">Eamil Address</th>
                        <td><%= user.getEmail() %></td>
                      
                      </tr>
                      <tr>
                        <th scope="row">Gender</th>
                        <td><%= user.getGender() %></td>
                  
                      </tr>
                      <tr>
                        <th scope="row">Status</th>
                        <td><%= user.getAbout() %></td>
                  
                      </tr>
                      <tr>
                        <th scope="row">Regsitered On</th>
                        <td><%= user.getDateTime() .toString() %></td>
                  
                      </tr>
                    </tbody>
                  </table>
               </div>

               <!-- End details of user -->


               <!-- edit user details -->
        
               <div id="profile-edit" style="display: none;">

                <h3>Please edit Carefully!</h3>
                <form action="EditServlet" method="post">
                    <table class="table">
                        <tbody>
                          <tr>
                            <th scope="row">ID :</th>
                            <td><%= user.getId() %></td>
                       
                          </tr>

                          <tr>
                            <th scope="row">Name</th>
                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
                          
                          </tr>
                          <tr>
                            <th scope="row">Eamil Address</th>
                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
                          </tr>

                        
                         <!--Gender not for edit -->
                          <tr>
                            <th scope="row">Gender</th>
                            <td><%= user.getGender() %></td>
                          </tr>
                         
                          <tr>
                            <th scope="row">Password</th>
                            <td><input type="password" class="form-control" name="password" value="<%= user.getPassword() %>"></td>
                          </tr>

                          <tr>
                            <th scope="row">About</th>
                            <td><textarea rows="3" class="form-control" name="about"> <%= user.getAbout() %>
                            
                            </textarea></td>
                          </tr>

                          <tr>
                            <th scope="row">New Profile</th>
                            <td><input type="file" name="profile-img" class="form-control"></td>
                          </tr>


                         <!-- Time stamp not for edit
                          <tr>
                            <th scope="row">Regsitered On</th>
                            <td><%= user.getDateTime() .toString() %></td>
                      
                          </tr> -->
                        </tbody>
                      </table>

                      <div class="container">
                        <button type="submit" class="btn btn-outline-primary">Save </button>
                      </div>

                </form>

               </div>

               
               <!-- End edit user details-->

            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" id="edit-btn" class="btn btn-primary">Edit</button>
        </div>
      </div>
    </div>
  </div>


  



<!-- end of profile modal -->

   
   <script src="https://code.jquery.com/jquery-3.7.1.min.js"
   integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
   integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
   crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
   integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
   crossorigin="anonymous"></script>
<script src="js/script.js"></script>


<script>
    $(document).ready(function(){
//For toggle 
        let editStatus = false;

        $('#edit-btn').click(function(){
        if(editStatus==false){
            $('#Profile-Details').hide();
            $('#profile-edit').show();
            $('#edit-btn').html("back")
            editStatus = true;
        }
        else{
            $('#Profile-Details').show();
            $('#profile-edit').hide();
            editStatus = false; 
          
        }
        })
    });
</script>

</body>
</html>