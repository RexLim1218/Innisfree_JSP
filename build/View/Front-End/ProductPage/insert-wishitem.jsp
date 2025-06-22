<%-- 
    Document   : insert-wishitem
    Created on : May 3, 2023, 10:59:25 PM
    Author     : yokec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    try {
        // Get the productId parameter from the POST request data
        int productId = Integer.parseInt(request.getParameter("productId"));
        int custId = Integer.parseInt(request.getParameter("custId"));
        String message = "";

        // Connect to the Derby database
        String host = "jdbc:derby://localhost:1527/Innisfree";
        String user = "nbuser";
        String password = "nbuser";
        Connection conn = DriverManager.getConnection(host, user, password);

        // Check if the product already exists in the wishlist
        String sql1 = "SELECT * FROM WISHITEM WHERE CUSTID = ? AND PRODID = ?";
        PreparedStatement pstmt1 = conn.prepareStatement(sql1);
        pstmt1.setInt(1, custId);
        pstmt1.setInt(2, productId);
        ResultSet rs = pstmt1.executeQuery();
        if (rs.next()) {
            message = "success";
        } else {
            // Insert the product into the wishitem table
            String sql2 = "INSERT INTO WISHITEM (CUSTID, PRODID) VALUES (?, ?)";
            PreparedStatement pstmt2 = conn.prepareStatement(sql2);
            pstmt2.setInt(1, custId);
            pstmt2.setInt(2, productId);
            pstmt2.executeUpdate();

            message = "error";

            // Close the database connection
            pstmt2.close();
        }
        pstmt1.close();
        conn.close();
        
        response.setContentType("text/plain"); 

        // Send the message back to the AJAX call
        response.getWriter().write(message);
        
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
%>