package com.leoeatle.biology_database;

import java.io.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;


import com.mysql.jdbc.*;

public class ConnectionUtils {
	private static String url;
	private static String dbUser;
	private static String dbPassword;

	public static void getParam(String filename){
		Properties propes = new Properties();
		File file = new File(filename);
		try {
			FileInputStream fis = new FileInputStream(file);

			propes.load(fis);

			url = propes.getProperty("dburl");
			dbUser = propes.getProperty("user");
			dbPassword = propes.getProperty("password");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection(){
		getParam("src/dbconfig.properties");
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url,dbUser,dbPassword);
			System.out.println("连接建立成功");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("连接出现错误");
		}
		return conn;
	}
	
	public static void close(Connection conn){
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(PreparedStatement stmt){
		if(stmt != null){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs){
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
