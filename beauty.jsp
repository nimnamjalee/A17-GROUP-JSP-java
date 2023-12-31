<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Remove from Bakery</title>
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
    // Handle form submission
    if (request.getMethod().equalsIgnoreCase("post")) {
        String username = request.getParameter("username");
        String productName = request.getParameter("product_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Connection conn = null;
        Statement stmt = null;

        try {
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
            String DB_URL = "jdbc:mysql://localhost:3306/mydb?user=root&password=Pass&useUnicode=true&characterEncoding=UTF-8";
            String USER = "root";
            String PASS = "user@2K7";

            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Execute a SQL statement to delete the data
            String sql = "DELETE FROM beauty WHERE username=? AND product_name=? AND quantity=?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, username);
                pstmt.setString(2, productName);
                pstmt.setInt(3, quantity);

                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<p>Data removed successfully.</p>");
                } else {
                    out.println("<p>No matching data found.</p>");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close the resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
<h2>Remove from Beauty and Health</h2>
<!-- Display the form -->
<form method="post" action="">
    <label for="username">Username:</label>
    <input type="text" name="username" required><br>

    <label for="product_name">Product Name:</label>
    <input type="text" name="product_name" required><br>

    <label for="quantity">Quantity:</label>
    <input type="number" name="quantity" required><br>

    <input type="submit" value="Remove">
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
