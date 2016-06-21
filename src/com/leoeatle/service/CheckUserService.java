package com.leoeatle.service;

import java.sql.Connection;
import java.sql.ResultSet;

import com.leoeatle.dao.UserDao;
import com.leoeatle.dao.impl.UserDaoImpl;
import com.leoeatle.entity.User;
import com.leoeatle.util.ConnectionFactory;


//检查是否能够查找到该用户，属于Service逻辑层

public class CheckUserService {
	
	private UserDao userDao = new UserDaoImpl();
	
	public boolean check(User user)
	{
		Connection conn = null;
		try{
			
			
			conn = ConnectionFactory.getInstance().makeConnection();//从连接工厂产生了一个连接
			conn.setAutoCommit(false);
			
			ResultSet resultSet = userDao.get(conn, user);//从数据库查找相应的用户
			System.out.println(resultSet.getRow());
			while(resultSet.next())//存在一个就可以说是存在？好像也的确如此
			{
				System.out.println("验证通过");
				return true;
			}
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
			
		
		return false;
	}
	
	
	public boolean insert(User user)
	{
		Connection conn = null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();//从连接工厂产生了一个连接
			conn.setAutoCommit(true);
			userDao.save(conn, user);
			return true;
		} catch(Exception e)
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
		
	
	return false;
	}
	

}
