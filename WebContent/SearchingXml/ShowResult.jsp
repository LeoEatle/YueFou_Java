<%-- 
    Document   : index
    Created on : 2016-5-24, 11:45:12
    Author     : leoeatle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" import="com.leoeatle.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/jsp_db"
     user="myuser"  password="xxxx"/>
<sql:query dataSource="${snapshot}" var="species">
	SELECT * from bioinfo;
</sql:query>

<sql:query dataSource="${snapshot}" var ="reactions_products">
	SELECT reactions.id,reactions.reversible,reactions.name,reactions.metaid,reactions.ListOfReactants,reactions.ListOFProducts from reactions WHERE ListOFProducts = ? 
	<sql:param value="${param.species}" />
</sql:query>
  
 
    <head>
        <title>This is the query result</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
         <!-- Material Design fonts -->
		  <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700">
		  <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/icon?family=Material+Icons">
		
		  <!-- Bootstrap -->
		  <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		
		  <!-- Bootstrap Material Design -->
		  <link rel="stylesheet" type="text/css" href="dist/css/bootstrap-material-design.css">
		  <link rel="stylesheet" type="text/css" href="dist/css/ripples.min.css">
    </head>
    <body>
        
    		<div class="container">
    			<h1 class="row text-center">This is the query result:</h1>
    			<div class = "col-md-12">
    				<div class = "page-header">
    					<h1 >As products</h1>
    				</div>
    			
    			</div>
    			<div class = "bs-component">
    				<table class="table table-striped table-hover ">
					  <thead>
					  <tr>
					    <th>id</th>
					    <th>reversible</th>
					    <th>name</th>
					    <th>metaid</th>
					    <th>ListOfReactants</th>
					    <th>ListOfProducts</th>
					  </tr>
					  </thead>
					  <tbody>
						<!--   这里开始遍历每一个reaction，查找含有该species的reaction -->
						<c:forEach var = "row" items="${reactions_products.rows }">
							<tr>
								<td><c:out value="${row.id }"></c:out></td>
								<td><c:out value="${row.reversible }"></c:out></td>
								<td><c:out value="${row.name }"></c:out></td>
								<td><c:out value="${row.metaid }"></c:out></td>
								<td><c:out value="${row.ListOfReactants }"></c:out></td>
								<td><c:out value="${row.ListOfProducts }"></c:out></td>
								
							</tr>
							
						</c:forEach>
					  </tbody>
					</table>	
    			
    			</div>
    			
            	
            </div>    
    		<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
    		<script type="text/javascript" src="dist/js/jquery.min.js"></script>
        <script type="text/javascript" src="dist/js/material.min.js"></script>
        <script type="text/javascript" src="dist/js/ripples.min.js"></script>
        <script src="dist/js/index.js"></script>
    </body>
</html>
