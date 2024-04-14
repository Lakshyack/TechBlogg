<%@page import="com.tech.blog.entities.Message" %>
  <%@page import="com.tech.blog.entities.User" %>
    <%@page import="com.tech.blog.DAO.postDao" %>
      <%@page import="com.tech.blog.entities.Category" %>
        <%@page import="java.util.ArrayList" %>
          <%@page import="com.tech.blog.helper.ConnectionProvider" %>

            <% User user=(User)session.getAttribute("currentUser"); if(user==null){
              response.sendRedirect("loginPage.jsp"); } %>
              <!DOCTYPE html>
              <html lang="en">

              <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Profile page!</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                  integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                  crossorigin="anonymous">
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
                  <a class="navbar-brand" href="index.jsp"><span><img src="SVGs/techB.svg" alt="">&nbsp;</span>Tech
                    Blog</a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                      <li class="nav-item active">
                        <a class="nav-link" href="#"><span><img src="SVGs/learn.svg" alt="">&nbsp;</span>Learn Code With
                          Lakshya
                          <span class="sr-only">(current)</span></a>
                      </li>

                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                        <a class="nav-link" href="#"><span><img src="SVGs/contact.svg" alt="">&nbsp;</span>Contact
                          Us</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span><img
                              src="SVGs/upload.svg" alt="">&nbsp;</span>Do Post</a>
                      </li>



                      <!-- <li class="nav-item">
          <a class="nav-link disabled" href="#">More</a>
        </li> -->
                    </ul>
                    <ul class="navbar-nav mr-right">
                      <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span><img
                              class="icon" src="SVGs/logout.svg" alt=""></span>
                          <%= user.getName() %>
                        </a>
                      </li>

                      <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span><img class="icon" src="SVGs/logout.svg"
                              alt=""></span>Logout</a>
                      </li>
                    </ul>
                  </div>
                </nav>

                <!-- end of Nav bar -->


                <% Message m=(Message)session.getAttribute("msg"); if(m!=null){ %>

                  <div class="alert <%= m.getCssClass()%>" role="alert">
                    <%= m.getContent() %>
                  </div>

                  <% session.removeAttribute("msg"); } %>


                    <!-- main body of the page -->

                    <main>
                      <div class="container">
                        <div class="row mt-4">
                          <!-- first coloumn -->
                          <div class="col-md-4">
                            <!-- categories -->

                            <div class="list-group">
                              <a href="#" class="list-group-item list-group-item-action active">
                                All Postss
                              </a>
                              <!-- fetchiing categories from DB  -->
                              <% postDao d=new postDao(ConnectionProvider.getConnection()); ArrayList<Category>
                                list1 = d.getAllCategories();

                                for (Category cc : list1) {
                                %>
                                <a href="#" class="list-group-item list-group-item-action">
                                  <%= cc.getName()%>
                                </a>

                                <% } %>




                            </div>

                          </div>

                          <!-- first coloumn -->
                          <div class="col-md-8">
                            <!-- posts  -->
                            <div class="container text-center" id="loader">
                              <img style="height: 15px;" src="SVGs/loader.svg" alt="">
                              <h3 class="mt-3">Loading...</h3>
                            </div>


                          </div>

                        </div>
                      </div>
                    </main>


                    <!-- end main body page  -->

                    <!-- profile modal -->


                    <!-- Button trigger modal only for checking-->
                    <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#profile-modal">
    Launch demo modal
  </button> -->

                    <!-- Modal -->
                    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
                      aria-labelledby="exampleModalLabel" aria-hidden="true">
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

                              <img src="ProfileImg/<%= user.getProfile() %>" class="img-fluid "
                                style="border-radius: 50%; height: 150px; width: 150px; border: 2px solid black;"
                                alt="">

                              <h5 class="modal-title mt-3" id="exampleModalLabel">
                                <%= user.getName() %>
                              </h5>

                              <!-- details of user -->

                              <div id="Profile-Details">
                                <table class="table">
                                  <tbody>
                                    <tr>
                                      <th scope="row">ID :</th>
                                      <td>
                                        <%= user.getId() %>
                                      </td>

                                    </tr>
                                    <tr>
                                      <th scope="row">Eamil Address</th>
                                      <td>
                                        <%= user.getEmail() %>
                                      </td>

                                    </tr>
                                    <tr>
                                      <th scope="row">Gender</th>
                                      <td>
                                        <%= user.getGender() %>
                                      </td>

                                    </tr>
                                    <tr>
                                      <th scope="row">Status</th>
                                      <td>
                                        <%= user.getAbout() %>
                                      </td>

                                    </tr>
                                    <tr>
                                      <th scope="row">Regsitered On</th>
                                      <td>
                                        <%= user.getDateTime() .toString() %>
                                      </td>

                                    </tr>
                                  </tbody>
                                </table>
                              </div>

                              <!-- End details of user -->


                              <!-- edit user details -->

                              <div id="profile-edit" style="display: none;">

                                <h3>Please edit Carefully!</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                  <table class="table">
                                    <tbody>
                                      <tr>
                                        <th scope="row">ID :</th>
                                        <td>
                                          <%= user.getId() %>
                                        </td>

                                      </tr>

                                      <tr>
                                        <th scope="row">Name</th>
                                        <td><input type="text" class="form-control" name="user_name"
                                            value="<%= user.getName() %>"></td>

                                      </tr>
                                      <tr>
                                        <th scope="row">Eamil Address</th>
                                        <td><input type="email" class="form-control" name="user_email"
                                            value="<%= user.getEmail() %>"></td>
                                      </tr>


                                      <!--Gender not for edit -->
                                      <tr>
                                        <th scope="row">Gender</th>
                                        <td>
                                          <%= user.getGender() %>
                                        </td>
                                      </tr>

                                      <tr>
                                        <th scope="row">Password</th>
                                        <td><input type="password" class="form-control" name="password"
                                            value="<%= user.getPassword() %>"></td>
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



                    <!-- add post modal started -->


                    <!-- Button trigger modal -->

                    <!-- this modal is  only for trying modal  -->
                    <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button> -->

                    <!-- Modal -->
                    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
                      aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header primary-background text-center">
                            <h5 class="modal-title" id="exampleModalLabel">Post details</h5>

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <form id="add-Post-form" action="addPostServlet" method="post"
                              enctype="multipart/form-data">

                              <div class="form-group">


                                <select class="form-control" name="cid">
                                  <option selected disabled>---select category---</option>

                                  <!-- fetching category form database -->

                                  <% postDao posttd=new postDao(ConnectionProvider.getConnection()); ArrayList<Category>
                                    list = posttd.getAllCategories();

                                    for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>">
                                      <%= c.getName()%>
                                    </option>

                                    <% } %>
                                </select>
                              </div>

                              <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control">
                              </div>

                              <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Enter your content" name=""
                                  id="" cols="30" rows="3"></textarea>
                              </div>

                              <div class="form-group">
                                <textarea name="pCode" class="form-control"
                                  placeholder="Enter your program (if you have)" name="" id="" cols="30"
                                  rows="3"></textarea>
                              </div>

                              <div class="form-group">
                                <label for=""> Select your pic </label>
                                <br>
                                <input name="pImg" type="file" name="" id="">
                              </div>

                              <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>

                              </div>


                            </form>
                          </div>


                          <!-- for only checking-- -->
                          <!-- <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                  </div> -->



                        </div>
                      </div>
                    </div>



                    <!--end add post modal -->



                    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                      integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                      crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                      crossorigin="anonymous"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
                      integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
                      crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                    <script src="js/script.js"></script>


                    <script>
                      $(document).ready(function () {
                        //For toggle 
                        let editStatus = false;

                        $('#edit-btn').click(function () {
                          if (editStatus == false) {
                            $('#Profile-Details').hide();
                            $('#profile-edit').show();
                            $('#edit-btn').html("back")
                            editStatus = true;
                          }
                          else {
                            $('#Profile-Details').show();
                            $('#profile-edit').hide();
                            editStatus = false;

                          }
                        })
                      });
                    </script>

                    <!-- now add post js ---  -->

                    <script>

                      $(document).ready(function (e) {

                        //
                        $("#add-Post-form").on("submit", function (event) {
                          //this code gets called when form submitted...
                          event.preventDefault(); //synchronous tarika ruk jayega
                          console.log("you have submited");
                          let form = new FormData(this);
                          // now requesting to server

                          $.ajax({
                            url: "addPostServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {

                              if (data.trim() == "done") {
                                swal("Post submitted!", "Save successfully", "success");
                              } else {
                                swal("Something went wrong!", "Internal error try again", "error");

                              }
                              console.log(data);


                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                              swal("Something went wrong!", "Internal error try again", "error");

                            },
                            processData: false,
                            contentType: false

                          })


                        })
                      })
                    </script>

              </body>

              </html>