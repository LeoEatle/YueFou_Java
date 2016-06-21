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
    <head>
        <title>Searching in the xml file</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
         <!-- Material Design fonts -->
		  
		  <link rel="stylesheet" type="text/css" href="dist/css/googleapis_css.css" />
		  <link rel="stylesheet" type="text/css" href="dist/css/googleapis_icon.css" />
		  <!-- Bootstrap -->
		  <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		
		  <!-- Bootstrap Material Design -->
		  <link rel="stylesheet" type="text/css" href="dist/css/bootstrap-material-design.css">
		  <link rel="stylesheet" type="text/css" href="dist/css/ripples.min.css">
    </head>
    <body>
    	<%
    		
    		ResultSet result = (ResultSet)request.getAttribute("result");
    	%>
        
    		<div class="container">
    			<div class="row">
						<div class="col-md-12">
						<div class="bs-component">
							<div class="navbar navbar-warning">
								<div class="container-fluid">
									<div class="navbar-header">
										<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
											<span class="icon-bar"></span>
											<span class="icon-bar"></span>
											<span class="icon-bar"></span>
										</button>
										<a class="navbar-brand" href="javascript:void(0)">约否</a>
									</div>
									<div class="navbar-collapse collapse navbar-responsive-collapse">
										<ul class="nav navbar-nav">
											<li class="active"><a href="javascript:void(0)">首页</a></li>
											<li><a href="javascript:void(0)">发布活动</a></li>
										</ul>
										<form class="navbar-form navbar-left col-md-10">
											<div class="form-group is-empty">
												<input type="text" size="50" class="form-control col-md-10" placeholder="请输入活动名称进行查找">
											</div>
										</form>
										<ul class="nav navbar-nav navbar-right">
											<li><a href="javascript:void(0)">欢迎，</a></li>
											<li class="register"><a href="javascript:void(0)">注册</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div id="source-button" class="btn btn-primary btn-xs" style="display: none;">&lt; &gt;</div>
						</div>
    			</div>
					
					
							

					
				
    			
    		</div>    
    			<div class="show">
    				<% while(result.next())
    					{%>
    					<div class="row">
    						<div class="panel panel-default">
    						  
							  <div class="panel-heading">Panel heading</div>
							  <div class="panel-body">
							    Panel content
							  </div>
							  <div class="panel-footer">
							  	Panel footer
							  </div>
							</div>
    					
    					</div>	
    				<% 	}%>
    			</div>
    		
    		
    		<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
    		<script type="text/javascript" src="dist/js/jquery.min.js"></script>
        <script type="text/javascript" src="dist/js/material.min.js"></script>
        <script type="text/javascript" src="dist/js/ripples.min.js"></script>
        <script src="dist/js/index.js"></script>
    </body>
</html>
