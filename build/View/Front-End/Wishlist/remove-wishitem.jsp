<%-- 
    Document   : RemoveFromWishlist
    Created on : May 4, 2023, 10:58:58 AM
    Author     : yokec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    try {
        // Get the productId parameter from the POST request data
        int productId = Integer.parseInt(request.getParameter("productId"));
        int custId = Integer.parseInt(request.getParameter("custId"));

        // Connect to the Derby database
        String host = "jdbc:derby://localhost:1527/Innisfree";
        String user = "nbuser";
        String password = "nbuser";
        Connection conn = DriverManager.getConnection(host, user, password);

        // Insert the product into the wishitem table
        String sql1 = "DELETE FROM WISHITEM WHERE CUSTID = ? AND PRODID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql1);
        pstmt.setInt(1, custId);
        pstmt.setInt(2, productId);
        pstmt.executeUpdate();

        // Close the database connection
        pstmt.close();
        conn.close();
        
        String message = "success";
         response.setContentType("text/plain"); 

        // Send the message back to the AJAX call
        response.getWriter().write(message);
        
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
%>
