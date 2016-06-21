package com.leoeatle.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.leoeatle.dao.UserDao;
import com.leoeatle.entity.User;
import com.mysql.jdbc.Statement;

public class UserDaoImpl implements UserDao {


	@Override
	public void save(Connection conn, User user) throws SQLException {
		//PreparedStatement ps = conn.prepareStatement("INSERT INTO tbl_user(name, password, email) values ("+user.getName()"+", user.getPassword()"+", "+"user.getEmail()"+")"");
		String sql = "INSERT INTO tbl_user(name, password, email) values ('"+user.getName()+"','"+ user.getPassword()+"', '" + user.getEmail() + "')";
		java.sql.Statement st = conn.createStatement();
		System.out.println("这里是daoimpl，用户名是"+ user.getName());
		System.out.println(sql);

		st.executeUpdate(sql);
		
//		ps.setString(1, user.getName());
//		ps.setString(2, user.getPassword());
//		ps.setString(3, user.getEmail());
//		ps.executeUpdate();
//		int a = ps.executeUpdate();
//		System.out.println(a);

	}

	/**
	 * id    准备更新的用户的ID
	 * user  新的用户信息
	 */
	@Override
	public void update(Connection conn, Long id, User user) throws SQLException {
		String updateSql = "UPDATE tbl_user SET name = ?, password = ?, email = ? WHERE id = ?";
		PreparedStatement ps = conn.prepareStatement(updateSql);
		ps.setString(1, user.getName());
		ps.setString(2, user.getPassword());
		ps.setString(3, user.getEmail());
		ps.setLong(4, id);
		ps.executeUpdate();
	}

	/**
	 * 根据用户ID删除指定用户
	 */
	@Override
	public void delete(Connection conn, User user) throws SQLException {
		PreparedStatement ps = conn.prepareStatement("DELETE FROM tbl_user WHERE id = ?");
		ps.setLong(1, user.getid());
		ps.executeUpdate();
	}

	@Override
	public ResultSet get(Connection conn,  User user) throws SQLException {
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM tbl_user WHERE name = ? AND password = ?");
		ps.setString(1, user.getName());
		ps.setString(2, user.getPassword());
		ResultSet rs = ps.executeQuery();
		//System.out.println("tbl_user: " + rs.getRow());
		return rs;
	}
	
	
	

}