<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sorry something went!</title>

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

    <div class="container text-center">
        <img src="img/computer.png" class="img-fluid" alt="">
        <h3> Sorry ! Something went wrong...</h3>
        <%= exception %>
        <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home </a>
    </div>
    
</body>
</html>