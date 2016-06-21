<!--
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" import="com.leoeatle.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>-->
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
		<link rel="stylesheet" href="dist/css/bootstrap.min.css">
		<!-- Bootstrap Material Design -->
		<link rel="stylesheet" type="text/css" href="dist/css/bootstrap-material-design.css">
		<link rel="stylesheet" type="text/css" href="dist/css/ripples.min.css">
		<style>
			.card {
				height: 300px;
				width: 800px;
			}
			
			.activity-header {
				padding: 0px;
				border-bottom: 1px gray solid;
			}
			
			.activity-body {
				padding-left: 20px;
				height: 220px;
				margin-top: 10px;
			}
			
			.activity-footer {
				position: absolute;
				margin-top: 20px;
				padding-bottom: -20px;
				padding-left: 20px;
				bottom: -30px;
			}
			
			.activity-body>p {
				margin-top: 5px;
			}
			
			.activity-body>p>.label {
				margin-right: 20px;
			}
			
			.activity-name>small{
				font-size: small;
			}
			.activity-create{
				margin-top: 20px;
			}
		</style>
	</head>

	<body>

		<div class="row container-fluid">
			<div>
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
									<li><a href="javascript:void(0)">约炮列表</a></li>
								</ul>
								<form class="navbar-form navbar-left col-md-10">
									<div class="form-group is-empty">
										<input type="text" size="50" class="form-control col-md-10" placeholder="请输入炮友名称进行查找">
									</div>
								</form>
								<ul class="nav navbar-nav navbar-right">
									<li><a href="javascript:void(0)">欢迎，<span>新同学</span></a></li>
									<li class="register"><a href="javascript:void(0)">您还没登录呢</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div id="source-button" class="btn btn-primary btn-xs" style="display: none;">&lt; &gt;</div>
				</div>
			</div>
		</div>
		<div class="container">

			<div class="row activity_information">
				<div class="well col-md-8">
					<div class="activity-content">
						<div class="activity-header">
							<h2 class="activity-name">走！去3p！<small>创建者：LeoEatle 创建时间：2016/6/5</small></h2>
						</div>
						<div class="activity-body">
							<p class="content"><span class="label">一句话：</span><span>今晚就来，自备冈本003，来者不拒</span></p>
							<p class="time text-primary"><span class="label label-primary">时间: </span><span>2016年6月6日</span></p>
							<p class="address text-success"><span class="label label-success">地点: </span><span>四季酒店</span></p>
							<p class="limit_number text-warning"><span class="label label-warning">限制人数：</span><span>2-5人</span></p>
						</div>
						<div class="activity-footer">
							<button class="btn btn-raised btn-info">Share</button>
							<button class="btn btn-raised btn-success">Join it!</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div>
					<button class="btn btn-lg btn-block btn-raised btn-warning activity-create">发起约炮！</button>
				</div>
			</div>
		</div>
			<script type="text/javascript" src="dist/js/jquery.min.js"></script>
			<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="dist/js/material.min.js"></script>
			<script type="text/javascript" src="dist/js/ripples.min.js"></script>
			<script src="dist/js/index.js"></script>
			
	</body>

</html>