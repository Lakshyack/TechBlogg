<%@page import="com.tech.blog.entities.Message" %>
<%@page import= "com.tech.blog.entities.User"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>logIn</title>
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

        <!-- navbar -->
        <%@include file="normalNavBar.jsp" %>

            <main class="d-flex align-items-center darkish-background banner-background" style="height: 80vh;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 offset-md-4">
                            <div class="card">
                                <div class="card-header primary-background text-white">
                                    <span class="text-center LoginHeader"><img src="SVGs/Login1.svg" alt="">
                                        <h5>
                                            LogIn here!
                                        </h5>
                                    </span>
                                </div>

                                <% Message m=(Message)session.getAttribute("msg"); if(m!=null){ 
                                    
                                    
                                    
                                    %>
                                    
                                    <div class="alert <%= m.getCssClass()%>"  role="alert">
                                        <%= m.getContent() %>
                                      </div>

                                    <% 
                                
                                session.removeAttribute("msg");
                                
                                } %>

                                        <div class="card-body">
                                            <form action="LoginServlet" method="post">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Email address</label>
                                                    <input name="email" required type="email" class="form-control"
                                                        id="exampleInputEmail1" aria-describedby="emailHelp"
                                                        placeholder="Enter email">

                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputPassword1">Password</label>
                                                    <input name="password" required type="password" class="form-control"
                                                        id="exampleInputPassword1" placeholder="Password">
                                                </div>

                                                <div class="container text-center p-3">
                                                    <button type="submit" class="btn btn-primary">Submit</button>

                                                </div>
                                            </form>
                                        </div>
                            </div>

                        </div>
                    </div>




                </div>
            </main>




            <!-- <-!-- scripts --->





            <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                crossorigin="anonymous"></script>
            <script src="js/script.js"></script>
    </body>

    </html>