<%-- 
    Document   : index.jsp
    Created on : Dec 24, 2023, 2:20:47 PM
    Author     : Acer
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Untitled Document</title>
    <!-- Bootstrap -->
	<link href="css/bootstrap-4.4.1.css" rel="stylesheet">
	<link href="styles.css" rel="stylesheet" type="text/css">
  </head>
  <body>
  	<div class="container-fluid">
  	  <div class="container">
  	    <nav class="navbar navbar-expand-lg navbar-light bg-light"> <a class="navbar-brand" href="index.jsp"><img src="images/lg2.png" alt="logo" width="99" height="70" class="d-block mx-auto rounded"></a>
  	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  	      <div class="collapse navbar-collapse" id="navbarSupportedContent1">
  	        <ul class="navbar-nav mr-auto">
  	          <li class="nav-item active"> <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a> </li>
  	          <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="galleryDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         category&nbsp; </a>
    <div class="dropdown-menu" aria-labelledby="galleryDropdown">
    
        <a class="dropdown-item" href="fresh.jsp">FRESH Fruit & Vegitables</a>
        <a class="dropdown-item" href="beut.jsp">Beauty & Health</a>
		<a class="dropdown-item" href="productsql.jsp">Bakery</a>
        
    </div>
</li>
  	          <li class="nav-item"> <a class="nav-link" href="contact.jsp">Contact Us&nbsp;</a></li>
                   <li class="nav-item"> <a class="nav-link" href="comment.jsp">comment section</a></li>
  	          <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="galleryDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         login&nbsp; </a>
    <div class="dropdown-menu" aria-labelledby="galleryDropdown">
    
        <a class="dropdown-item" href="login.jsp">Customer</a>
        <a class="dropdown-item" href="admin.jsp">Admin</a>
	
        
    </div>
</li>
  	          <li class="nav-item"> <a class="nav-link" href="corsign.jsp">Sign Up&nbsp;</a></li>
            </ul>
</div>
        </nav>
		 <div id="bannerimage"></div>
  	    
  	    <h1 class="text-center">&nbsp;</h1>
  	    <h1 class="text-center"> Welcome To GREEN SUPERMARKET&nbsp; &nbsp;</h1>
        <p class="text-center">Green supermarket is always with you.</p>
        <div class="row">
          <div class="col-lg-4">
            <div class="card col-md-4 col-lg-12"> <img class="card-img-top" src="images/lc.jpg" alt="Card image cap">
              <div class="card-body">
				  <h5 class="card-title">FRESH Fruit & Vegitables</h5>
                <p class="card-text">you can buy all kinds of vegitables and fruits here.</p>
                <a href="fresh.jsp" class="btn btn-primary">view products</a> </div>
            </div>
          &nbsp;</div>
          <div class="col-lg-4">
            <div class="card col-md-4 col-lg-12"> <img class="card-img-top" src="images/la.jpg" alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Beauty & Health</h5>
                <p class="card-text">you can buy all kinds of external cosmetics,soaps of your choice here.</p>
                <a href="beut.jsp" class="btn btn-primary">view products&nbsp;</a> </div>
            </div>
          &nbsp;</div>
          <div class="col-lg-4">
            <div class="card col-md-4 col-lg-12"> <img class="card-img-top" src="images/lb.jpg" alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Bakery&nbsp;</h5>
                <p class="card-text">you can buy all kinds of bakery products here.</p>
                <a href="productsql.jsp" class="btn btn-primary">view products&nbsp;</a> </div>
            </div>
          &nbsp;</div>
        </div>
		  
		  
		  <br>
		  <br>
		  <h5>Useful Links</h5>
        <div id="accordion1" role="tablist">
          <div class="card">
            <div class="card-header" role="tab" id="headingOne1">
              <h5 class="mb-0"> <a data-toggle="collapse" href="#collapseOne1" role="button" aria-expanded="true" aria-controls="collapseOne1"> About Us</a> </h5>
            </div>
            <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordion1">
              <div class="card-body"><a href="aboutus.jsp">Come and learn about us.</a></div>
            </div>
          </div>
          <div class="card">
            <div class="card-header" role="tab" id="headingTwo1">
              <h5 class="mb-0"> <a class="collapsed" data-toggle="collapse" href="#collapseTwo1" role="button" aria-expanded="false" aria-controls="collapseTwo1"> Follow Us </a> </h5>
            </div>
            <div id="collapseTwo1" class="collapse" role="tabpanel" aria-labelledby="headingTwo1" data-parent="#accordion1">
				<div class="card-body"><a href="">Come and join us.</a></div>
            </div>
          </div>
</div>
		  <br><br>
        <footer><div class="row">
            <div class="col-lg-3"><img src="images/lg2.png" alt="logo" width="170" height="90" class="d-block mx-auto rounded" align="left"></div>
            <div class="col-lg-6"><center>
              <br>
				<br>
              @Copyrigh&nbsp; &nbsp; Green supermarket 2023&nbsp;
            </center></div>
          </div></footer>
          <br><br>
  	  </div>
    </div>
  	<!-- body code goes here -->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
	<script src="js/jquery-3.4.1.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/popper.min.js"></script> 
	<script src="js/bootstrap-4.4.1.js"></script>
  </body>
</html>


    
