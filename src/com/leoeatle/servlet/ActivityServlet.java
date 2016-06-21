package com.leoeatle.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.sql.Result;

import com.leoeatle.entity.Activity;
import com.leoeatle.entity.Address;
import com.leoeatle.service.ActivityService;
import com.mysql.jdbc.ResultSetInternalMethods;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ActivityServlet
 */

public class ActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ActivityService service = new ActivityService();
	private Activity new_a = new Activity();
	private Address new_addr = new Address();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ActivityServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// For dispatching the next Page
		String nextPage = "";
		String todo = request.getParameter("todo");

		RequestDispatcher rd = null;
		String forward = null;

		HttpSession session = request.getSession(true);

		
		if (todo.equals("add")) {
			// 往数据库添加新的activity
			// 创建新的activity实例

			new_a.setName(request.getParameter("name"));
			new_a.setDate(request.getParameter("date"));
			new_a.setContent(request.getParameter("name"));
			new_addr.setCity(request.getParameter("city"));
			new_addr.setCountry(request.getParameter("country"));
			new_a.setAddress(request.getParameter("address"));
			new_a.setOrganizer((String) session.getAttribute("username"));
			// new_a.setCreate_time(new Date());
			new_a.setLimit_number(Integer.parseInt(request.getParameter("limit_number")));

			// 通过ActivityService实现添加数据库数据
			// ActivityDao activityDao = new ActivityDaoImpl();
			try {
				service.add(new_a);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (todo.equals("remove")) {
			try {

				service.remove(new_a);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (todo.equals("update")) {
			new_a.setName(request.getParameter("name"));
			new_a.setDate(request.getParameter("date"));
			new_a.setContent(request.getParameter("content"));
			// new_addr.setCity(request.getParameter("city"));
			// new_addr.setCountry(request.getParameter("country"));
			new_a.setAddress(request.getParameter("address"));
			new_a.setOrganizer(request.getParameter("organizer"));
			new_a.setCreate_time(request.getParameter("create_time"));
			new_a.setLimit_number(Integer.parseInt(request.getParameter("limit_number")));
			try {

				service.update(new_a);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (todo.equals("query")) {
			String n = request.getParameter("name");
			try {

				Activity[] activities;
				activities = service.query(n);
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("activities", activities);//将activity array存入json

				JSONArray jsonArray = new JSONArray();
				jsonArray.add(jsonObject);
				System.out.println(jsonArray);
				PrintWriter out = response.getWriter();
				out.write(jsonArray.toString());

				// 不用request传递activities，改为用json打包返回给ajax
				// request.setAttribute("result", activities);
				//
				// forward = "showActivities.jsp";
				// rd = request.getRequestDispatcher(forward);
				// rd.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
