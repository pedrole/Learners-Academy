package com.caltech.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.caltech.dbconfig.DbUtil;
import com.caltech.pojo.Classe;



public class ClasseDAO {

	public int addClasse(Classe classe) {
		DbUtil dbconn=new DbUtil();
		Session session=dbconn.dbConn();
		Transaction trans=session.beginTransaction();

		int value=(Integer) session.save(classe);
		trans.commit();
		session.close();
		return value;
	}
	
	public String editClasse(Classe classe) {
		DbUtil dbUtil = new DbUtil();
		Session session = dbUtil.dbConn();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(classe);
		transaction.commit();
		session.close();
		return "updated";
	}
	
		

	public Classe retrieve(int id) {
		DbUtil dbconn=new DbUtil();
		Session session=dbconn.dbConn();
		Transaction trans=session.beginTransaction();
		Classe classe = session.get(Classe.class, id);
		trans.commit();
		session.close();
		return classe;
	}
	
	public List<Classe> display(){
		DbUtil dbconn=new DbUtil();
		Session session=dbconn.dbConn();
		Transaction trans=session.beginTransaction();
		Query query=session.createQuery("from Classe");
		List<Classe> list=query.list();
		trans.commit();
		session.close();
		return list;
	}
	
}

