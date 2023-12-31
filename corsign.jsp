<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, java.util.*" %>
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
        <style>
		  h1 {
      color: #1A3B15;
      text-align: center;
    }
		  label {
      display: block;
      margin-top: 10px;
    }
		   input[type="text"],
    select,
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 5px;
      border-radius: 3px;
      border: 1px solid gray;
    }
    
    input[type="radio"]
    input[type="checkbox"] {
      margin-top: 10px;
    }
    
    input[type="submit"],
    input[type="button"] {
      background-color: blue;
      color: white;
      border: none;
      padding: 10px;
      margin-top: 10px;
      cursor: pointer;
    }
    
    input[type="submit"]:hover,
    input[type="button"]:hover {
      background-color: darkblue;
    }
	  </style>
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
<%
    // JDBC driver name and database URL
    String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/mydb?user=root&password=Pass&useUnicode=true&characterEncoding=UTF-8";

    // Database credentials
    String USER = "root";
    String PASS = "user@2K7";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Register JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Open a connection
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        // Retrieve form data
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String phoneStr = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Prepare the SQL statement
        String sql = "INSERT INTO sign(Namef, address, city, phone, gender, email, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        // Set parameters
        pstmt.setString(1, name);
        pstmt.setString(2, address);
        pstmt.setString(3, city);
        pstmt.setInt(4, Integer.parseInt(phoneStr));
        pstmt.setString(5, gender);
        pstmt.setString(6, email);
        pstmt.setString(7, password);

        // Execute the query
        pstmt.executeUpdate();

        // Display a success message
        out.println("<div class='alert alert-success' role='alert'>Registration successful!</div>");
    } catch (SQLException se) {
        // Handle errors for JDBC
        se.printStackTrace();
        // Display an error message
        out.println("<div class='alert alert-danger' role='alert'>Registration failed. Please try again later.</div>");
    } catch (Exception e) {
        // Handle errors
        e.printStackTrace();
        // Display an error message
        out.println("<div class='alert alert-danger' role='alert'>Registration failed. Please try again later.</div>");
    } finally {
        // Finally block to close resources
        try {
            if (pstmt != null) pstmt.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
        try {
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>

<div class="background"></div>
    <form >
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br>

        <label for="city">City:</label>
        <input type="text" id="city" name="city" required><br>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" maxlength="10" minlength="10" required><br>

        <label for="gender">Gender:</label>
        <input type="radio" id="male" name="gender" value="male" required>Male
        <input type="radio" id="female" name="gender" value="female" required>Female<br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <input type="submit" value="Submit">
        <input type="button" value="Cancel">
    </form>
    
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
