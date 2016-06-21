package com.leoeatle.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.jstl.sql.Result;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

import com.mysql.jdbc.Statement;
import com.leoeatle.dao.ActivityDao;
import com.leoeatle.entity.Activity;

public class ActivityDaoImpl implements ActivityDao {

	//基本的增删改查
	@Override
	public void save(Connection conn, Activity activity) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("INSERT INTO activity_information(activity_name, activity_date, activity_content, activity_address, organizer, create_time, limit_number) values (?, ?, ?, ?, ?, now(), ?)");
		//ps.setInt(1, activity.getId());
		//这里不知道id 会不会自动增加
		ps.setString(1, activity.getName());
		ps.setString(2, activity.getDate());
		ps.setString(3, activity.getContent());
		ps.setString(4, activity.getAddress());
		ps.setString(5, activity.getOrganizer());
		//ps.setString(6, activity.getCreate_time());
		ps.setInt(6, activity.getLimit_number());
		
		ps.execute();
	}

	@Override
	public void update(Connection conn, Activity activity) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("UPDATE activity_information SET activity_name = ?, activity_date = ?, activity_content = ?, activity_address = ?, organizer = ?, create_time = ?, limit_number = ? WHERE id = ?");
		ps.setString(1, activity.getName());
		ps.setString(2, activity.getDate());
		ps.setString(3, activity.getContent());
		ps.setString(4, activity.getAddress());
		ps.setString(5, activity.getOrganizer());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		
		ps.setString(6, df.format(new Date()));
		
		ps.setInt(6, activity.getLimit_number());
		ps.setInt(7, activity.getId());
		
		ps.execute();
		

	}

	@Override
	public void delete(Connection conn, Activity activity) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("DELETE FROM activity_information WHERE id = ?");
		ps.setLong(1, activity.getId());
		ps.execute();
	}

	//根据活动的名字来查询相应的活动，返回结果集
	@Override
	public ResultSet get(Connection conn, String name) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM activity_information WHERE activity_name = ? ");
		ps.setString(1, name);
		
		return ps.executeQuery();
		//return null;
	}
	@Override
	public ResultSet getAll(Connection conn) throws SQLException {
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM activity_information");
		
		//ResultSet rs = ps.executeQuery();
		//System.out.println(rs.getRow());
		
		String sql = "SELECT * FROM activity_information";
		java.sql.Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
//		int count = 0;
//		System.out.println("循环打印：");
//		while (rs.next()) {
//			count++;
//			System.out.println(count);;
//			
//		}
		
		return rs;
	}

}
