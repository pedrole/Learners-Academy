package com.caltech.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.caltech.dbconfig.DbUtil;
import com.caltech.pojo.User;

public class UserDao {
	
	public String adduser(User user) {
		DbUtil dbconn=new DbUtil();
		Session session=dbconn.dbConn();
		Transaction trans=session.beginTransaction();
		User newuser=new User();
		newuser.setUser(user.getUser());
		newuser.setPassword(user.getPassword());
		String value=(String) session.save(newuser);
		trans.commit();
		session.close();
		return value;
	}
	
	public void addDefaultUser() {
		User user = new User();
		user.setUser("root");
		user.setPassword("user");
		if( validateuser(user) == null)
			adduser(user);
		
	}
	
	
	public User validateuser(User user) {
		DbUtil dbconn=new DbUtil();
		Session session=dbconn.dbConn();
		Transaction trans=session.beginTransaction();
		//better to use HQL
		User newuser=session.get(User.class, user.getUser());
		trans.commit();
		session.close();
		return newuser;
		
	}

}

