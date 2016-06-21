package com.leoeatle.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CountDownLatch;

import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;

import com.leoeatle.dao.ActivityDao;
import com.leoeatle.dao.impl.ActivityDaoImpl;
import com.leoeatle.entity.Activity;
import com.leoeatle.util.ConnectionFactory;

public class ActivityService {
	private ActivityDao activityDao = new ActivityDaoImpl();

	public void add(Activity activity) throws SQLException {
		Connection conn = null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();// 从连接工厂产生了一个连接
			conn.setAutoCommit(true);
			// 用dao的实现存储activity
			activityDao.save(conn, activity);
			// ResultSet resultSet = activityDao.get(conn,
			// activity);//从数据库查找相应的活动
			// System.out.println(resultSet.getRow());//打印查找到的活动
			// while(resultSet.next())
			// {
			// System.out.println("验证通过");
			// return true;
			// }
		} catch (Exception e) {
			e.getStackTrace();
			try {
				System.out.println("事务滚回啦！");
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (Exception e3) {
				e3.printStackTrace();
			}
		}

	}

	public void remove(Activity activity) throws SQLException {
		Connection conn = null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();// 从连接工厂产生了一个连接
			conn.setAutoCommit(true);
			// 用dao的实现存储activity
			activityDao.delete(conn, activity);

		} catch (Exception e) {
			e.getStackTrace();
			try {
				System.out.println("事务滚回啦！");
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (Exception e3) {
				e3.printStackTrace();
			}
		}
	}

	public void update(Activity activity) throws SQLException {
		Connection conn = null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();// 从连接工厂产生了一个连接
			conn.setAutoCommit(true);
			// 用dao的实现存储activity
			activityDao.update(conn, activity);

		} catch (Exception e) {
			e.getStackTrace();
			try {
				System.out.println("事务滚回啦！");
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (Exception e3) {
				e3.printStackTrace();
			}
		}
	}

	public Activity[] query(String name) throws SQLException {
		Connection conn = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();// 从连接工厂产生了一个连接
			conn.setAutoCommit(false);
			// 用dao的实现查询activity,返回activity数组
			Activity array[];
			List<Activity> activity_list = new ArrayList<Activity>();
			ResultSet rs;
			if (name.equals("*")) {
				//如果名字是"*"代表要获取的事全部信息流
				 rs = activityDao.getAll(conn);
				
			}
			else {
				 rs = activityDao.get(conn, name);
			}
			
			int count = 0;
			while (rs.next()) {
				count++;
				System.out.println("这是第" + count + "个");

				Activity new_a = new Activity();
				new_a.setName(rs.getString("activity_name"));
				new_a.setDate(rs.getString("activity_date"));
				new_a.setContent(rs.getString("activity_content"));
				new_a.setAddress(rs.getString("activity_address"));
				new_a.setOrganizer(rs.getString("organizer"));
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
				// new Date()为获取当前系统时间
				new_a.setCreate_time(df.format(new Date()));
				new_a.setLimit_number(rs.getInt("limit_number"));
				activity_list.add(new_a);
			}
			array = new Activity[activity_list.size()];
			System.out.println("这里是ActivityService，现在打印activity_array: " + activity_list.toString());

			return (Activity[]) activity_list.toArray(array);

		} catch (Exception e) {
			e.getStackTrace();
			try {
				System.out.println("事务滚回啦！");
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (Exception e3) {
				e3.printStackTrace();
			}
		}

		return null;

	}

}
