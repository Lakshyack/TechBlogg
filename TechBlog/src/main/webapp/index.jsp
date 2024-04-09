
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                crossorigin="anonymous">
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/utility.css">
            <style>
                .banner-background{
                    clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 74% 100%, 41% 93%, 0 100%, 0 0);
                }
                
            </style>
        </head>

        <body>
            <!-- navbar  -->

            <%@include file="normalNavBar.jsp" %>


                <!--banner-->
                <div class="container-fluid p-0 m-0">
                    <div class="jumbotron banner-background">
                        <div class="container">
                            <h3 class="display-3">
                                Welcome to Tech Blog
                            </h3>
                          
                            <p>
                                Welcome to technical blog, world of technology.Programming languages are described in terms of their syntax (form) and semantics (meaning), usually defined by a formal language. Languages usually provide features such as a type system, variables and mechanisms for error handling. 
                            </p>
                            <p> An implementation of a programming language in the form of a compiler or interpreter allows programs to be executed, either directly or by producing an executable.</p>
                            <a href="Registration.jsp" class="btn btn-outline-dark btn-lg"><span><img src="SVGs/user.svg" alt=""></span> Start! its Free</a>
                            <a href="loginPage.jsp" class="btn btn-outline-dark btn-lg icon"><span><img class="icon" src="SVGs/login.svg" alt=""></span> Login</a>
                        </div>

                    </div>

                    
                </div>
               <!-- card Start -->
              
                    <div class="container">



                        <!-- row 1 -->
                        <div class="row mb-2">

                            <div class="col-md-4">
                                <div class="card">
                                
                                    <div class="card-body">
                                      <h5 class="card-title">Java Programming</h5>
                                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                      <a href="#" class="btn primary-background text-white">Read More</a>
                                    </div>
                                  </div>
                            </div>


                            <div class="col-md-4">
                                <div class="card">
                                
                                    <div class="card-body">
                                      <h5 class="card-title">Java Programming</h5>
                                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                      <a href="#" class="btn primary-background text-white">Read More</a>
                                    </div>
                                  </div>
                            </div>


                            <div class="col-md-4">
                                <div class="card">
                                
                                    <div class="card-body">
                                      <h5 class="card-title">Java Programming</h5>
                                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                      <a href="#" class="btn primary-background text-white">Read More</a>
                                    </div>
                                  </div>
                            </div>

                            
                        </div>

                        <!-- row 2 -->

                        <div class="row mb-2">

                            <div class="col-md-4">
                                <div class="card">
                                
                                    <div class="card-body">
                                      <h5 class="card-title">Java Programming</h5>
                                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                      <a href="#" class="btn primary-background text-white">Read More</a>
                                    </div>
                                  </div>
                            </div>


                            <div class="col-md-4">
                                <div class="card">
                                
                                    <div class="card-body">
                                      <h5 class="card-title">Java Programming</h5>
                                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                      <a href="#" class="btn primary-background text-white">Read More</a>
                                    </div>
                                  </div>
                            </div>


                            <div class="col-md-4">
                                <div class="card">
                                
                                    <div class="card-body">
                                      <h5 class="card-title">Java Programming</h5>
                                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                      <a href="#" class="btn primary-background text-white">Read More</a>
                                    </div>
                                  </div>
                            </div>

                            
                        </div>
                    </div>





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