<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/utility.css">
    <style>
        .banner-background {
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 74% 100%, 41% 93%, 0 100%, 0 0);
        }
    </style>




</head>

<body>
    <!-- navbar  -->

    <%@include file="normalNavBar.jsp" %>


        <main class="d-flex align-items-center darkish-background banner-background" style="height: 120vh;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <span class="text-center LoginHeader"><img src="SVGs/loginHeader.svg" alt="">
                                <h6>
                                    Register here!
                                </h6>
                            </span>
                        </div>
                        <div class="card-body">
                            <form id="Reg-form" action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="User_name">User Name</label>
                                    <input name="name" type="text" class="form-control" id="User_name"
                                        aria-describedby="emailHelp" placeholder="User_name">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" placeholder="Enter email">

                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control"
                                        id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="gender">Select gender</label>
                                    <br>
                                    <input type="radio" id="gender" value="Male" name="gender">Male
                                    <input type="radio" id="gender" value="Female" name="gender">Female

                                </div>

                                <div class="form-group">
                                    <textarea name="about" id="about" class="form-control" cols="30"
                                        rows="1"></textarea>
                                </div>


                                <div class="form-check">
                                    <input name="checkbox" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree terms and
                                        conditions</label>
                                </div>
                                <br>

                                <div class="text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please wait...</h4>
                                </div>
                                <div class="text-center">
                                    <button id="submit-btn" type="submit" class="btn btn-primary ">Submit</button>
                                </div>
                            
                            </form>
                        </div>
                        <div class="footer">

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
            $(document).ready(function () {
                console.log('loaded.......');
                $('#Reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

                    //loader hiding and show
                    $("#submit-btn").hide();
                    $("#loader").show();


                    //send register servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log("done");

                            $("#submit-btn").show();
                            $("#loader").hide();


                            if(data.trim() ==='done'){
                                swal("Register Successfully: We redirecting to login page")
                                .then((value) => {
                                    window.location="loginPage.jsp";
                                });
                            }
                            else{
                                swal(data);
                            }

                           
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(error);
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("Something Went Wrong ..Try again!");
                               
                        },
                        processData: false,
                        contentType: false

                    });
                });
            });



        </script>
</body>

</html>