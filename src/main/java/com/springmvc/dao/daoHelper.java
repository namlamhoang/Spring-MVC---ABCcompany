package com.springmvc.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


public abstract class daoHelper<Entity> {
	
	Class<Entity> myclass; 
	
	daoHelper(Class<Entity> myclass) {
		this.myclass = myclass;
	}
	
	@Autowired
	SessionFactory sessionFactory;
	
	Connection conn = null;
	
	Statement st = null;
	
	ResultSet rs = null;
	

	
	void initJdbc() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/abcgroup";
			String username = "java";
			String password = "congchua0933";
			conn = DriverManager.getConnection(dbURL, username, password);
			System.out.println("Success!!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private List<Object> getPrimaryKeys(){ // lấy danh sách khoa chính của bảng
		List<Object> keys;
		initJdbc();
		try {
			keys = new ArrayList<>();
			String sql = "SELECT COLUMN_NAME FROM information_schema.columns WHERE TABLE_NAME = '"+ myclass.getSimpleName() +"' AND COLUMN_KEY = 'PRI'";
			st = (Statement) conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				keys.add(rs.getString("COLUMN_NAME"));
			}
			return keys;
		} catch (Exception e) {
			System.err.println("not found primary keys");
			return null;
		}
		
	}
	
	List<Entity> getListDAO() {
		//Hash getCurrentSession().createQuery("from "+myclass.getName()).getResultList()
		return getCurrentSession().createQuery("from "+myclass.getName()).getResultList();
	}

	Entity getEntityDAO(Entity e) {
		return getCurrentSession().find(myclass,e);
	}
		
	Entity getEntitybyIdDAO(int id) {
		return getCurrentSession().find(myclass, id);
	}
	
	Entity getEntitybyNameDAO(String name) {
		return getCurrentSession().find(myclass, name);
	}

    void saveDAO(Entity e) {
		getCurrentSession().save(e);
	}

	void updateDAO(Entity e) {
		getCurrentSession().update(e);
	}

	void deleteDAO(Entity e) {
		getCurrentSession().delete(e);
	}
	
	Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	
}
