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
    			<h1 class="row text-center">Welcome to the searching in xml file of biology</h1>
                        <p class="row text-center lead">Made by Leo Eatle</p>
    			
                        <form name="Form" action="ShowResult.jsp" method="POST"  class="form-horizontal jumbotron center-block">
			  <fieldset>
			    <legend>Please select what you goona do and click submit</legend>
			    
			    
			    
			    <div class="form-group label-floating  ">
			      <label for="inputSpecies" class=" control-label">The name of Species</label>
			
			      <div>
                                  <input name="species"  type="text" class="form-control " id="inputSpecies">
			      </div>
			    </div>
			    
			    <div class="form-group ">

			      <label for="select111" class="col-md-2 control-label">Select</label>
			
			      <div class="col-md-10">
			      	<div class="radio radio-primary" >
			      		<label>
			      			<input type="radio" name="optionRadios" id="optionsRadios1" value="query" />
			      			<span class="circle"></span>
			      			Query
			      		</label>	
			      	</div>
			      	<div class="radio radio-primary" >
			      		<label>
			      			<input type="radio" name="optionRadios" id="optionsRadios2" value="add" />
			      			<span class="circle"></span>
			      			Add
			      		</label>	
			      	</div>
			      	<div class="radio radio-primary" >
			      		<label>
			      			<input type="radio" name="optionRadios" id="optionsRadios3" value="option3" />
			      			<span class="circle"></span>
			      			Remove
			      		</label>	
			      	</div>
			      	
			        <!--<select id="select111" class="form-control">
                                    <option value="query">Query</option>
                                    <option value="add">Add</option>
                                    <option value="remove">Remove</option>
			        </select>-->
			      </div>
			    </div>
			   	<div class="form-group">
			      <div class="col-md-4 col-md-offset-5">
			        <button type="reset" class="btn btn-default btn-raised" >Reset</button>
			        <button type="submit" class="btn btn-primary btn-raised">Submit</button>
                  </div>
			    </div>
			  </fieldset>
			</form>
    		</div>    
    		<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
    		<script type="text/javascript" src="dist/js/jquery.min.js"></script>
        <script type="text/javascript" src="dist/js/material.min.js"></script>
        <script type="text/javascript" src="dist/js/ripples.min.js"></script>
        <script src="dist/js/index.js"></script>
    </body>
</html>
