<%-- 
    Document   : customertab
    Created on : Dec 28, 2023, 9:16:41 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    
String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/mydb?user=root&password=Pass&useUnicode=true&characterEncoding=UTF-8";
    String USER = "root";
    String PASS = "user@2K7";
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet resultSet = null;

    try {
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        // Check the bakery table for the entered username
        String usernameToCheck = request.getParameter("username");
        String bakeryQuery = "SELECT * FROM bakery WHERE username=?";
        stmt = conn.prepareStatement(bakeryQuery);
        stmt.setString(1, usernameToCheck);
        resultSet = stmt.executeQuery();

        double totalPrice = 0.0;

%>
        <h2>Bakery Items for <%= usernameToCheck %></h2>
        <table border="1">
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
<%
        while (resultSet.next()) {
%>
            <tr>
                <td><%= resultSet.getString("product_name") %></td>
                <td><%= resultSet.getInt("quantity") %></td>
                <td><%= resultSet.getDouble("price") %></td>
            </tr>
<%
            totalPrice += resultSet.getDouble("price");
        }
%>
        </table>
        <p>Total Price: <%= totalPrice %></p>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <h2>Error Checking Bakery Items</h2>
        <p><%= e.getMessage() %></p>
<%
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!-- Form to input the username for checking bakery items -->
<h2>Check Bakery Items</h2>
<form method="get">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    <input type="submit" value="Check Bakery Items">
</form>
 <a href="payemail.jsp" class="next"><button>Order Now</button></a>
 
<br><br>
<% try {
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        // Check the bakery table for the entered username
        String usernameToCheck = request.getParameter("username1");
        String freshQuery = "SELECT * FROM fresh WHERE username=?";
        stmt = conn.prepareStatement(freshQuery);
        stmt.setString(1, usernameToCheck);
        resultSet = stmt.executeQuery();

        double totalPrice = 0.0;

%>
        <h2>Fresh Fruits & Vegitables for <%= usernameToCheck %></h2>
        <table border="1">
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
<%
        while (resultSet.next()) {
%>
            <tr>
                <td><%= resultSet.getString("product_name") %></td>
                <td><%= resultSet.getInt("quantity") %></td>
                <td><%= resultSet.getDouble("price") %></td>
            </tr>
<%
            totalPrice += resultSet.getDouble("price");
        }
%>
        </table>
        <p>Total Price: <%= totalPrice %></p>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <h2>Error Checking Fresh Fruits & Vegitables</h2>
        <p><%= e.getMessage() %></p>
<%
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!-- Form to input the username for checking bakery items -->
<h2>Check Fresh Fruits & Vegitables</h2>
<form method="get">
    <label for="username1">Username:</label>
    <input type="text" id="username1" name="username1" required>
    <input type="submit" value="Check fresh">
</form>
 <a href="payemail.jsp" class="next"><button>Order Now</button></a>
 
<br><br>
<% try {
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        // Check the bakery table for the entered username
        String usernameToCheck = request.getParameter("username2");
        String freshQuery = "SELECT * FROM beauty WHERE username=?";
        stmt = conn.prepareStatement(freshQuery);
        stmt.setString(1, usernameToCheck);
        resultSet = stmt.executeQuery();

        double totalPrice = 0.0;

%>
        <h2>Health & Beauty items for <%= usernameToCheck %></h2>
        <table border="1">
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
<%
        while (resultSet.next()) {
%>
            <tr>
                <td><%= resultSet.getString("product_name") %></td>
                <td><%= resultSet.getInt("quantity") %></td>
                <td><%= resultSet.getDouble("price") %></td>
            </tr>
<%
            totalPrice += resultSet.getDouble("price");
        }
%>
        </table>
        <p>Total Price: <%= totalPrice %></p>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <h2>Error Checking Health & Beauty items</h2>
        <p><%= e.getMessage() %></p>
<%
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>


<h2>Check Health & Beauty items</h2>
<form method="get">
    <label for="username2">Username:</label>
    <input type="text" id="username2" name="username2" required>
    <input type="submit" value="Check beauty">
    
</form>
 <a href="payemail.jsp" class="next"><button>Order Now</button></a>
 <br>
 <br><!-- comment -->
 <h2>
     if you want remove item in cart.you can use this path.<h2>
 <a href="remove.jsp" class="next"><button>remove</button></a>
		 <br>
		  <br>
                  <h3> you can check your orders</h3><!-- comment -->
 <a href="ordercus.jsp" class="btn btn-primary">Check orders</a>
  <br>
  <br>	  <h5>Useful Links</h5>
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
