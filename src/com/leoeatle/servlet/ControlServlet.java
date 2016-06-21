package com.leoeatle.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.leoeatle.util.ConnectionFactory;
import java.sql.Connection;

/**
 * Servlet implementation class ControlServlet
 */

public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlServlet() {
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
		// TODO Auto-generated method stub
		Connection conn = null;

		try{
			conn = ConnectionFactory.getInstance().makeConnection();//从连接工厂产生了一个连接
			conn.setAutoCommit(false);
			
			
		}catch(Exception e)
		{
			e.getStackTrace();
			try{
				System.out.println("事务滚回啦！");
				conn.rollback();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}finally{
			try{
				conn.close();
			}catch(Exception e3){
				e3.printStackTrace();
			}
		}
	}

}
