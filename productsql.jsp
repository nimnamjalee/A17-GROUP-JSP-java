<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <!-- Add your CSS stylesheets here -->
	<link href="css/bootstrap-4.4.1.css" rel="stylesheet">
	<link href="styles.css" rel="stylesheet" type="text/css">
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
              <br> <br> 
    <form method="post" align="center">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required>
        <br>
        <br>
        <img  src="images/bagu.jpg" alt="Card image cap"><br>
        <h3>Baguette</h3>
        <p>price:Rs 270.00</p>
        <!-- Hidden fields for database-related data -->
        <input type="hidden" name="productName1" value="Baguette">
        <input type="hidden" name="price1" value="270.00">
        <label for="quantity1">Quantity</label>
        <input type="number" id="quantity1" name="quantity1" min="1" max="10" required>
        <button type="submit" class="add-to-cart-btn" name="addToCart1">Add to Cart</button>
    </form>
<br>
        <br>
    <form method="post"align="center">
        <img  src="images/cak.jpg" alt="Card image cap"><br>
        <h3>Cake</h3>
        <p>price:Rs 590.00</p>
        <!-- Hidden fields for database-related data -->
        <input type="hidden" name="productName2" value="Cake">
        <input type="hidden" name="price2" value="590.00">
        <label for="quantity2">Quantity</label>
        <input type="number" id="quantity2" name="quantity2" min="1" max="10" required>
        <button type="submit" class="add-to-cart-btn" name="addToCart2">Add to Cart</button>
    </form>
  <br>
        <br>
              <form method="post" align="center">
        <img  src="images/bread.jpg" alt="Card image cap"><br>
        <h3>Bread</h3>
        <p>Price:Rs 145.00</p>
        <!-- Hidden fields for database-related data -->
        <input type="hidden" name="productName3" value="Bread">
        <input type="hidden" name="price3" value="145.00">
        <label for="quantity3">Quantity</label>
        <input type="number" id="quantity3" name="quantity3" min="1" max="10" required>
        <button type="submit" class="add-to-cart-btn" name="addToCart3">Add to Cart</button>
    </form>
    <%@ page import="java.sql.*, java.io.*, java.util.*" %>

    <%-- Your existing database connection code --%>
    <%
        String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost:3306/mydb?user=root&password=Pass&useUnicode=true&characterEncoding=UTF-8";

        // Database credentials
        String USER = "root";
        String PASS = "user@2K7";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String userName = (String) session.getAttribute("userName");

        if (userName == null && request.getParameter("username") != null) {
            // Set the username in the session if not already set
            userName = request.getParameter("username");
            session.setAttribute("userName", userName);
        }

        if (request.getParameter("addToCart1") != null || request.getParameter("addToCart2") != null) {
            // User clicked "Add to Cart" button
            String productName = "";
            double price = 0.0;

            if (request.getParameter("addToCart1") != null) {
                // Baguette form submitted
                productName = request.getParameter("productName1");
                price = Double.parseDouble(request.getParameter("price1"));
            } else if (request.getParameter("addToCart2") != null) {
                // Cake form submitted
                productName = request.getParameter("productName2");
                price = Double.parseDouble(request.getParameter("price2"));
            }
            else if (request.getParameter("addToCart3") != null) {
                // Cake form submitted
                productName = request.getParameter("productName3");
                price = Double.parseDouble(request.getParameter("price3"));
            }

            int quantity = Integer.parseInt(request.getParameter("quantity" + (request.getParameter("addToCart1") != null ? "1" : (request.getParameter("addToCart2") != null ? "2" : "3"))));
            double total = price * quantity;

            try {
                // Your existing code for database connection
                Class.forName(JDBC_DRIVER);
                conn = DriverManager.getConnection(DB_URL, USER, PASS);

                // Check if the userName exists in the sign table
                String checkUserQuery = "SELECT Namef FROM sign WHERE Namef = ?";
                pstmt = conn.prepareStatement(checkUserQuery);
                pstmt.setString(1, userName);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    // Username exists, insert into bakery table
                    String insertCartSql = "INSERT INTO bakery(username, product_name, quantity, price) VALUES (?, ?, ?, ?)";
                    pstmt = conn.prepareStatement(insertCartSql);

                    // Set parameters
                    pstmt.setString(1, userName);
                    pstmt.setString(2, productName);
                    pstmt.setInt(3, quantity);
                    pstmt.setDouble(4, total);

                    // Execute the query
                    pstmt.executeUpdate();

                    out.println("<div class='alert alert-success' role='alert'>Product added to cart successfully!</div>");
                } else {
                    out.println("<div class='alert alert-danger' role='alert'>Username not found. Please sign up first.</div>");
                }
            } catch (SQLException | ClassNotFoundException se) {
                // Handle errors
                se.printStackTrace();
                // Display an error message
                out.println("<div class='alert alert-danger' role='alert'>Failed to add product to cart.</div>");
            } finally {
                // Close resources if needed
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }
    %>
    <br><a href="productsql.jsp" class="previous"><button>&laquo; Previous</button></a>
    <a href="npro.jsp" class="next"><button>Next &raquo;</button></a>
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
