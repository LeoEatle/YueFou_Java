package com.leoeatle.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.leoeatle.entity.Activity;
import com.leoeatle.entity.User;

public interface ActivityDao {
	public void save(Connection conn, Activity activity) throws SQLException;

	public void update(Connection conn, Activity activity) throws SQLException;

	public void delete(Connection conn, Activity activity) throws SQLException;

	public ResultSet get(Connection conn, String name) throws SQLException;
	
	public ResultSet getAll(Connection conn) throws SQLException;

}
