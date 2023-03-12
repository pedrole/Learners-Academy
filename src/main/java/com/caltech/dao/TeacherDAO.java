package com.caltech.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.caltech.dbconfig.DbUtil;
import com.caltech.pojo.Classe;
import com.caltech.pojo.Student;
import com.caltech.pojo.Subject;
import com.caltech.pojo.Teacher;


public class TeacherDAO {

	public int addTeacher(Teacher teacher) {
		DbUtil dbconn=new DbUtil();
		Session session=dbconn.dbConn();
		Transaction trans=session.beginTransaction();

		int value=(Integer) session.save(teacher);
		trans.commit();
		session.close();
		return value;
	}
	
//	public int editProduct(Product product) {
//		DbUtil dbUtil = new DbUtil();
//		Session session = dbUtil.dbConn();
//		Transaction transaction = session.beginTransaction();
//		Query q = session.createQuery("update Product set pname=:name where pid=:id");
//		q.setParameter("name", product.getPname());
//		q.setParameter("id", product.getPid());
//		int executeUpdate = q.executeUpdate();
//		transaction.commit();
//		session.close();
//		return executeUpdate;
//	
//		
//	}
	public Teacher retrieve(int id) {
		DbUtil dbconn=new DbUtil();
		Session session=dbconn.dbConn();
		Transaction trans=session.beginTransaction();
		Teacher tecacher = session.get(Teacher.class, id);
		trans.commit();
		session.close();
		return tecacher;
	}
	
	public List<Teacher> display(){
		DbUtil dbconn=new DbUtil();
		Session session=dbconn.dbConn();
		Transaction trans=session.beginTransaction();
		Query query=session.createQuery("from Teacher");
		List<Teacher> list=query.list();
		trans.commit();
		session.close();
		return list;
	}
	
}

