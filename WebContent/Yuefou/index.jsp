<!--
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" import="com.leoeatle.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>-->
<!-- 设置相对路径 -->
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/Yuefou/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html>
<html>

<head>
<title>约否</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Material Design fonts -->

<link rel="stylesheet" type="text/css"
	href="dist/css/googleapis_css.css" />
<link rel="stylesheet" type="text/css"
	href="dist/css/googleapis_icon.css" />
<!-- Bootstrap -->
<link rel="stylesheet" href="dist/css/bootstrap.min.css">
<!-- Bootstrap Material Design -->
<link rel="stylesheet" type="text/css"
	href="dist/css/bootstrap-material-design.css">
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

.activity-name>small {
	font-size: small;
}

#mymodallabel {
	color: black;
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
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-responsive-collapse">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="javascript:void(0)">约否</a>
						</div>
						<div class="navbar-collapse collapse navbar-responsive-collapse">
							<ul class="nav navbar-nav">
								<li class="active"><a href="javascript:void(0)">首页</a></li>
								<li><a href="javascript:void(0)">我的活动</a></li>
							</ul>
							<form class="navbar-form navbar-left col-md-10"
								action="<%=request.getContextPath()%>/ActivityServlet">
								<div class="form-group is-empty">
									<input type="hidden" name="todo" value="query"> <input
										type="text" size="50" class="form-control col-md-10"
										name="name" placeholder="请输入活动名称进行查找">
								</div>
							</form>
							<ul class="nav navbar-nav navbar-right">
								<%
									if (session.getAttribute("login") == null || session.getAttribute("login").equals("no")) {
								%>
								<li><a href="javascript:void(0)">欢迎，<span>新同学</span></a></li>
								<!--登录的模态框-->
								<!-- Button trigger modal -->
								<li type="button" class="btn btn-primary" data-toggle="modal"
									data-target="#loginModal">您还没登录呢，点击登录</li>
								<!-- Modal -->
								<div class="modal fade" id="loginModal" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">登录</h4>
											</div>
											<div class="modal-body">
												<!--开始写表单内容啦！和数据库一一对应-->
												<form class="form-horizontal"
													action="<%=request.getContextPath()%>/CheckServlet"
													method="POST">
													<input type="hidden" name="todo" value="login">
													<fieldset>
														<legend>请填写用户名和密码进行登录</legend>
														<div class="form-group  label-floating">
															<label for="inputUsername" class="col-md-2 control-label">用户名</label>

															<div class="col-md-10">
																<input name="username" type="text" class="form-control"
																	id="inputEmail">
															</div>

														</div>
														<div class="form-group  label-floating">
															<label for="inputPassword" class="col-md-2 control-label">密码</label>

															<div class="col-md-10">
																<input name="userpassword" type="password"
																	class="form-control" id="inputPassword">
															</div>
														</div>
														<div class="form-group  label-floating"
															style="margin-top: 0;">
															<!-- inline style is just to demo custom css to put checkbox below input above -->
															<div class="col-md-offset-2 col-md-10">
																<div class="checkbox">
																	<label> <input type="checkbox">
																		记住用户名和密码
																	</label> <label> <input type="checkbox" disabled="">
																		vip用户
																	</label>
																</div>
															</div>
														</div>


														<div class="form-group">
															<div class="col-md-10 col-md-offset-2">
																<a type="button" class="btn btn-default btn-raised">忘了密码？</a>

																<button type="submit" class="btn btn-primary btn-raised">提交</button>
															</div>
														</div>
													</fieldset>
												</form>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal" onclick="toggleRegisterModal()">没有账号？点击注册</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="registerModal" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">注册</h4>
											</div>
											<div class="modal-body">
												<!-- -->
												<form class="form-horizontal" method="POST"
													action="<%=request.getContextPath()%>/CheckServlet">
													<input type="hidden" name="todo" value="register">
													<fieldset>
														<legend>请完善您的个人资料</legend>
														<div class="form-group  label-floating">
															<label for="inputUsername" class="col-md-2 control-label">用户名</label>

															<div class="col-md-10">
																<input name="username" type="text" class="form-control"
																	id="inputEmail">
															</div>
														</div>
														<div class="form-group  label-floating">
															<label for="inputPassword" class="col-md-2 control-label">密码</label>

															<div class="col-md-10">
																<input name="userpassword" type="password"
																	class="form-control" id="inputPassword">
															</div>
														</div>
														<div class="form-group  label-floating">
															<label for="inputEmail" class="col-md-2 control-label">邮箱</label>

															<div class="col-md-10">
																<input name="email" type="text" class="form-control"
																	id="inputEmail">
															</div>
														</div>


														<div class="form-group">
															<label class="col-md-2 control-label">性别</label>

															<div class="col-md-10">
																<div class="radio radio-primary">
																	<label> <input type="radio" name="sex"
																		id="optionsRadios1" value="Male" checked=""> 男
																		Male
																	</label>
																</div>
																<div class="radio radio-primary">
																	<label> <input type="radio" name="sex"
																		id="optionsRadios2" value="Female"> 女 Female
																	</label>
																</div>
															</div>
														</div>
														<div class="form-group">
															<div class="col-md-10 col-md-offset-2">
																<button type="button" class="btn btn-default btn-raised">申请成为vip用户？</button>
																<button type="submit" class="btn btn-primary btn-raised">提交</button>
															</div>
														</div>
													</fieldset>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary">现在成为约否的一员！</button>
											</div>
										</div>
									</div>
								</div>

								<%
									} else if (session.getAttribute("login").equals("yes")) {
								%>
								<li><a href="javascript:void(0)">欢迎，<span> <%
 	out.println(session.getAttribute("username"));
 		String cs = request.getContextPath();
 		cs = cs + "/CheckServlet";
 %>
									</span></a></li>
								<li class="personalCenter"><a id="Login"
									href="personalCenter.jsp">个人中心</a></li>
								<button class="personalCenter btn btn-raised" id="LoginOff"
									href="javascript:void(0)">注销</button>
								<%
									}
								%>

							</ul>
						</div>
					</div>
				</div>
				<div id="source-button" class="btn btn-primary btn-xs"
					style="display: none;">&lt; &gt;</div>
			</div>
		</div>
	</div>
	<div class="container">

		<div class="row activity_information">
			<div class="well col-md-8">
				<div class="activity-content">
					<div class="activity-header">
						<h2 class="activity-name">
							走！看电影！<small>创建者：LeoEatle 创建时间：2016/6/5</small>
						</h2>
					</div>
					<div class="activity-body">
						<p class="content">
							<span class="label">一句话：</span><span>《X战警：天启》已经上映，诚邀1到3名小伙伴，无论是漫威粉还是DC粉来者不拒</span>
						</p>
						<p class="time text-primary">
							<span class="label label-primary">时间: </span><span>2016年6月5日</span>
						</p>
						<p class="address text-success">
							<span class="label label-success">地点: </span><span>太阳新天地</span>
						</p>
						<p class="limit_number text-warning">
							<span class="label label-warning">限制人数：</span><span>2-5人</span>
						</p>
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
				<button
					class="btn btn-lg btn-block btn-raised btn-warning activity-create"
					data-toggle="modal" data-target="#CreateActivity">发起活动</button>
			</div>

			<div class="modal fade" id="CreateActivity" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">私の活动</h4>
						</div>
						<div class="modal-body">
							<!--开始写表单内容啦！和数据库一一对应-->
							<form class="form-horizontal"
								action="<%=request.getContextPath()%>/CheckServlet"
								method="POST">
								<input type="hidden" name="todo" value="login">
								<fieldset>
									<legend>请创建您梦想的活动ください</legend>
									<div class="form-group">
										<label for="inputActivityname" class="col-md-2 control-label">活动名称</label>

										<div class="col-md-10">
											<input name="ActivityName" type="text" class="form-control"
												id="inputActivityName" placeholder="起个爆炸的名字">
										</div>

									</div>
									<div class="form-group  ">
										<label for="inputDate" class="col-md-2 control-label">活动日期</label>

										<div class="col-md-10">
											<input name="ActivityDate" type="test" class="form-control"
												id="inputDate" placeholder="这会是难忘的一天">
										</div>
									</div>
									<div class="form-group ">
										<label for="inputContent" class="col-md-2 control-label">活动概要</label>

										<div class="col-md-10">
											<input name="ActivityContent" type="test"
												class="form-control" id="inputContent"
												placeholder="想如何介绍你的神奇活动？">
										</div>
									</div>
									<div class="form-group  ">
										<label for="inputAddress" class="col-md-2 control-label">活动地点</label>

										<div class="col-md-10">
											<input name="ActivityAddress" type="test"
												class="form-control" id="inputAddress" placeholder="在哪里见面呢">
										</div>
									</div>
									<div class="form-group  ß">
										<label for="inputOrganizer" class="col-md-2 control-label">创始人的名字</label>

										<div class="col-md-10">
											<input name="ActivityOrganizer" type="test"
												class="form-control" id="inputOrganizer"
												placeholder="伟大的活动创始人叫什么好">
										</div>
									</div>
									<div class="form-group">
										<label for="select111" class="col-md-2 control-label">限制人数
										</label>

										<div class="col-md-10">
											<select id="select111" class="form-control">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
											</select>
										</div>
									</div>





									<div class="form-group">
										<div class="col-md-10 col-md-offset-2">
											<a type="button" class="btn btn-default btn-raised">忘了密码？</a>

											<button type="submit" class="btn btn-primary btn-raised">提交</button>
										</div>
									</div>
								</fieldset>
							</form>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" onclick="toggleRegisterModal()">没有账号？点击注册</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div>
				<button id="test"
					class="btn btn-lg btn-block btn-raised btn-warning ">test</button>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="dist/js/jquery.min.js"></script>
	<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="dist/js/material.min.js"></script>
	<script type="text/javascript" src="dist/js/ripples.min.js"></script>
	<script type="text/javascript" src="dist/js/index.js"></script>
	<script>
$(document).ready(function(){
					$.ajax({
						type: "post",
						url: "<%=request.getContextPath()%>/ActivityServlet",
						data: {todo: "query", name: "*"},
						success: function(data){
							console.log(data);
							var objs=eval(data); //解析json对象  
			            	var obj = objs[0];  
			            	var activities = obj.activities;
			            	console.log(objs);
			            	console.log(obj);
			            	console.log(activities);
			
						},
						error: function(){
							alert("请求出错");
						}
				})
	

	function checkLogin()
	{
		
	}


});







	$('#LoginOff').click(function()
			{
				$.ajax({
		            type: "post",
		            url: "<%=request.getContextPath()%>/CheckServlet",
		            data: {todo: "LoginOff"},
		            
		            success: function(data){
		                 alert("注销成功！");
		                 console.log("<%=request.getSession().getAttribute("login")%>");
		                 //本来不想从缓存拉取的，想了想，万一访问的人很多呢是吧
		                 window.location.reload(false);
		                 
		            }, error: function(){
		                  alert("请求出错");
		            }
		      })
			});
	$('#test').click(function()
			{
				$.ajax({
		            type: "post",
		            url: "<%=request.getContextPath()%>/CheckServlet",
				data : {
					todo : "test"
				},

				success : function(data) {
					alert(data);

				},
				error : function() {
					alert("请求出错");
				}
			})
		});
	</script>

</body>

</html>