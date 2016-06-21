package com.leoeatle.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.leoeatle.dao.UserDao;
import com.leoeatle.entity.User;
import com.leoeatle.service.CheckUserService;
import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;
import com.sun.corba.se.spi.protocol.ForwardException;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

/**
 * Servlet implementation class CheckServlet
 */
//@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CheckUserService cku = new CheckUserService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("todo"));
				
				if (request.getParameter("todo").equals("login") ) 
				//登录逻辑
				{
					//System.out.println("This is todo");
					String uname = request.getParameter("username");
					String passwd = request.getParameter("userpassword");
					String forward = "";
					System.out.println("用户名 ==》 " + uname);
					System.out.println("密码 ==》 " + passwd);
					
					//创建一个session
					HttpSession session=request.getSession(true);
					
					//通过CheckUserService来判断user是否存在数据库中
					User user =  new User();
					user.setName(uname);
					user.setPassword(passwd);
					//CheckUserService checkUserService = new CheckUserService();
					if (cku.check(user)) {
						//设置session
						session.setAttribute("login", "yes");
						session.setAttribute("username", uname);
						session.setAttribute("userpassword", passwd);
						
						forward = "Yuefou/success.jsp";	
					}
					else
					{
						session.setAttribute("login", "no");
						
						forward = "Yuefou/failed.jsp";
						
					}
					RequestDispatcher rd = null;
					rd = request.getRequestDispatcher(forward);
					rd.forward(request, response);		
				} 
				else if (request.getParameter("todo").equals("register"))
				//注册逻辑
				{
					String uname = request.getParameter("username");
					String passwd = request.getParameter("userpassword");
					String email = request.getParameter("email");
					String forward = "";
					System.out.println("用户名 ==》 " + uname);
					System.out.println("密码 ==》 " + passwd);
					System.out.println("邮箱" + email);
					
					HttpSession session = request.getSession(true);
					session.setAttribute("username", uname);
					session.setAttribute("userpassword", passwd);
					
					//用CheckUserService写入数据算了，不想重新写个service
					User user = new User();
					user.setName(uname);
					user.setPassword(passwd);
					user.setEmail(email);
					//CheckUserService checkUserService = new CheckUserService();
					if(cku.insert(user))
						{
							System.out.println("success input");
							session.setAttribute("login", "yes");
							
						}
					else {
							System.out.println("failed to input");
							session.setAttribute("login", "no");
					}
					forward = "Yuefou/index.jsp";
					RequestDispatcher rd = null;
					rd = request.getRequestDispatcher(forward);
					rd.forward(request, response);
					
				} 
				else if (request.getParameter("todo").equals("LoginOff"))
				{
					HttpSession session=request.getSession(true);
					session.invalidate();
					System.out.println("注销成功");
					
					//response.sendRedirect(request.getContextPath() + "/Yuefou/index.jsp");
				}
				else if (request.getParameter("todo").equals("test"))
				{
					PrintWriter out = response.getWriter();
					out.println("test");
				}
				


		
		
		
	}

}
