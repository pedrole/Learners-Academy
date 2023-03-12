package com.caltech.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.caltech.dbconfig.DbUtil;
import com.caltech.pojo.Classe;
import com.caltech.pojo.Student;
import com.caltech.pojo.Subject;


public class StudentDAO {

	public int addStudent(Student student) {
		DbUtil dbconn=new DbUtil();
		Session session=dbconn.dbConn();
		Transaction trans=session.beginTransaction();

		int value=(Integer) session.save(student);
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
	public Student retrieve(int id) {
		DbUtil dbconn=new DbUtil();
		Session session=dbconn.dbConn();
		Transaction trans=session.beginTransaction();
		Student student = session.get(Student.class, id);
		trans.commit();
		session.close();
		return student;
	}
	
	public List<Student> display(){
		DbUtil dbconn=new DbUtil();
		Session session=dbconn.dbConn();
		Transaction trans=session.beginTransaction();
		Query query=session.createQuery("from Student");
		List<Student> list=query.list();
		trans.commit();
		session.close();
		return list;
	}
	
}

