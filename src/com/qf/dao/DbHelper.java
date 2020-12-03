package com.qf.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qf.bean.Category;
import com.qf.bean.RecordBean;
import com.qf.bean.Users;

public class DbHelper {
	private static final String name = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/movie?characterEncoding=utf-8";
	private static final String user = "root";
	private static final String password = "jdongbox";
	private Connection connection;
	private PreparedStatement preparedStatement;

	public DbHelper(String sql) {
		try {
			Class.forName(name);
			System.out.println("连接驱动成功");
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("连接数据库成功");
			// 預編譯sql語句
			preparedStatement = connection.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void close(ResultSet resultSet) {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


//--------------------------------查询所有产品数据-保存到list集合對象中--------------------------------
	public static List<RecordBean> findAllRecord() {
		// 創建一個空的集合對象
		List<RecordBean> list = new ArrayList<>();
		String sql = "select * from product";
		DbHelper dbHelper = new DbHelper(sql);
		ResultSet resultSet = null;
		try {
			// 執行查詢語句
			resultSet = dbHelper.preparedStatement.executeQuery();
			// 通過while遍歷數據庫中所有的數據
			while (resultSet.next()) {
				RecordBean recordBean = new RecordBean();
				recordBean.setPid(resultSet.getInt("pid"));
				recordBean.setName(resultSet.getString("name"));
				recordBean.setRegion(resultSet.getString("region"));
				recordBean.setTime(resultSet.getString("time"));
				recordBean.setImgpath(resultSet.getString("imgpath"));
				recordBean.setCategory(resultSet.getString("category"));
				// 添加到集合中保存所有數據
				list.add(recordBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbHelper.close(resultSet);
		}
		return list;
	}

	public static List<Category> findAllCategory() {
		// 創建一個空的集合對象
		List<Category> list = new ArrayList<>();
		String sql = "select * from category";
		DbHelper dbHelper = new DbHelper(sql);
		ResultSet resultSet = null;
		try {
			// 執行查詢語句
			resultSet = dbHelper.preparedStatement.executeQuery();
			// 通過while遍歷數據庫中所有的數據
			while (resultSet.next()) {
				Category category = new Category();
				category.setCid(resultSet.getInt("cid"));
				category.setCname(resultSet.getString("cname"));
				// 添加到集合中保存所有數據
				list.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbHelper.close(resultSet);
		}
		return list;
	}
	public static List<Users> findAllUsers() {
		// 創建一個空的集合對象
		List<Users> list = new ArrayList<>();
		String sql = "select * from user,admin";
		DbHelper dbHelper = new DbHelper(sql);
		ResultSet resultSet = null;
		try {
			// 執行查詢語句
			resultSet = dbHelper.preparedStatement.executeQuery();
			// 通過while遍歷數據庫中所有的數據
			while (resultSet.next()) {
				Users users = new Users();
				users.setName(resultSet.getString("name"));
				users.setPassword(resultSet.getString("password"));
				// 添加到集合中保存所有數據
				list.add(users);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbHelper.close(resultSet);
		}
		return list;
	}
//-------增加数据
	public static RecordBean addRecord(RecordBean recordBean) {
		String sql = "insert into bmi(name,region,time,imgpath,category) values(?,?,?,?,?)";
		Object[] params = { recordBean.getName(), recordBean.getRegion(), recordBean.getTime(), recordBean.getImgpath(),recordBean.getCategory() };
		if (DbHelper.executeUpdate(sql, params) > 0) {
			return selectLastRecord();
		} else {
			return null;
		}
	}

//----查询最新一条数据
	public static RecordBean selectLastRecord(){
		String sql="select * from product order by pid desc limit 1";
		DbHelper dbHelper=new DbHelper(sql);
		RecordBean recordBean=new RecordBean();
		ResultSet resultSet=null;
		try {
			resultSet=dbHelper.preparedStatement.executeQuery();
			while (resultSet.next()) {
				recordBean.setPid(resultSet.getInt("pid"));
				recordBean.setName(resultSet.getString("name"));
				recordBean.setRegion(resultSet.getString("region"));
				recordBean.setTime(resultSet.getString("time"));
				recordBean.setImgpath(resultSet.getString("imgpath"));
				recordBean.setCategory(resultSet.getString("category"));
			}
			return recordBean;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbHelper.close(resultSet);
		}
		return null;
	}
	


//----------------增删改数据
	public static int executeUpdate(String sql, Object... params) {
		DbHelper dbHelper = new DbHelper(sql);
		try {
			// 通过for循环给占位符设置值
			for (int i = 0; i < params.length; i++) {
				dbHelper.preparedStatement.setObject(i + 1, params[i]);
			}
			// 执行sql语句
			int result = dbHelper.preparedStatement.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbHelper.close(null);
		}
		return -1;
	}

	/**
	 * 根据ID删除数据库中对应的那条数据
	 * 
	 * @param id
	 * @return
	 */
	public static int deleteRecord(int id) {
		String sql = "delete from product where pid =?";
		Object[] params = { id };
		return DbHelper.executeUpdate(sql, params);
	}
}
