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
			System.out.println("���������ɹ�");
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("�������ݿ�ɹ�");
			// �A���gsql�Z��
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


//--------------------------------��ѯ���в�Ʒ����-���浽list���ό�����--------------------------------
	public static List<RecordBean> findAllRecord() {
		// ����һ���յļ��ό���
		List<RecordBean> list = new ArrayList<>();
		String sql = "select * from product";
		DbHelper dbHelper = new DbHelper(sql);
		ResultSet resultSet = null;
		try {
			// ���в�ԃ�Z��
			resultSet = dbHelper.preparedStatement.executeQuery();
			// ͨ�^while��v�����������еĔ���
			while (resultSet.next()) {
				RecordBean recordBean = new RecordBean();
				recordBean.setPid(resultSet.getInt("pid"));
				recordBean.setName(resultSet.getString("name"));
				recordBean.setRegion(resultSet.getString("region"));
				recordBean.setTime(resultSet.getString("time"));
				recordBean.setImgpath(resultSet.getString("imgpath"));
				recordBean.setCategory(resultSet.getString("category"));
				// ��ӵ������б������Д���
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
		// ����һ���յļ��ό���
		List<Category> list = new ArrayList<>();
		String sql = "select * from category";
		DbHelper dbHelper = new DbHelper(sql);
		ResultSet resultSet = null;
		try {
			// ���в�ԃ�Z��
			resultSet = dbHelper.preparedStatement.executeQuery();
			// ͨ�^while��v�����������еĔ���
			while (resultSet.next()) {
				Category category = new Category();
				category.setCid(resultSet.getInt("cid"));
				category.setCname(resultSet.getString("cname"));
				// ��ӵ������б������Д���
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
		// ����һ���յļ��ό���
		List<Users> list = new ArrayList<>();
		String sql = "select * from user,admin";
		DbHelper dbHelper = new DbHelper(sql);
		ResultSet resultSet = null;
		try {
			// ���в�ԃ�Z��
			resultSet = dbHelper.preparedStatement.executeQuery();
			// ͨ�^while��v�����������еĔ���
			while (resultSet.next()) {
				Users users = new Users();
				users.setName(resultSet.getString("name"));
				users.setPassword(resultSet.getString("password"));
				// ��ӵ������б������Д���
				list.add(users);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbHelper.close(resultSet);
		}
		return list;
	}
//-------��������
	public static RecordBean addRecord(RecordBean recordBean) {
		String sql = "insert into bmi(name,region,time,imgpath,category) values(?,?,?,?,?)";
		Object[] params = { recordBean.getName(), recordBean.getRegion(), recordBean.getTime(), recordBean.getImgpath(),recordBean.getCategory() };
		if (DbHelper.executeUpdate(sql, params) > 0) {
			return selectLastRecord();
		} else {
			return null;
		}
	}

//----��ѯ����һ������
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
	


//----------------��ɾ������
	public static int executeUpdate(String sql, Object... params) {
		DbHelper dbHelper = new DbHelper(sql);
		try {
			// ͨ��forѭ����ռλ������ֵ
			for (int i = 0; i < params.length; i++) {
				dbHelper.preparedStatement.setObject(i + 1, params[i]);
			}
			// ִ��sql���
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
	 * ����IDɾ�����ݿ��ж�Ӧ����������
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
