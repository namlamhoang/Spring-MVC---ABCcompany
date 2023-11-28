package com.springmvc.dao;


import java.util.List;

import javax.persistence.Entity;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.model.record;



@Repository
@Transactional
public class statisticalDAO {
	
	
	
	@Autowired
	SessionFactory sessionFactory;

	Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public long totalStaff() {
		return (long) getCurrentSession().createQuery("SELECT COUNT(*) FROM staff").getSingleResult();
	}
	
	public double totalSalaryStaff() {
		return (double) getCurrentSession().createQuery("SELECT Sum(salary) FROM staff").getSingleResult();
	}
	
	public long totalDiscipline() {
		return (long) getCurrentSession().createQuery("SELECT COUNT(*) FROM record where type = 0").getSingleResult();
	}
	
	public long totalAchievement() {
		return (long) getCurrentSession().createQuery("SELECT COUNT(*) FROM record where type = 1").getSingleResult();
	}
	
	@Entity
	public class listTop {
		int id;
		String name;
		byte[] photo;
		String email;
		int achieve;
		int discipline;
		int total;
		String depart;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public byte[] getPhoto() {
			return photo;
		}
		public void setPhoto(byte[] photo) {
			this.photo = photo;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public int getAchieve() {
			return achieve;
		}
		public void setAchieve(int achieve) {
			this.achieve = achieve;
		}
		public int getDiscipline() {
			return discipline;
		}
		public void setDiscipline(int discipline) {
			this.discipline = discipline;
		}
		public int getTotal() {
			return total;
		}
		public void setTotal(int total) {
			this.total = total;
		}
		public String getDepart() {
			return depart;
		}
		public void setDepart(String depart) {
			this.depart = depart;
		}
		
		
		
	}
	
	public List getListTop10() {
		return getCurrentSession().createQuery("select s.staff_id,s.name,s.photo,s.email,count(*) as achievement,\r\n" + 
				"    CASE \r\n" + 
				"		WHEN  (select count(*) from record where type=0 and staff_id=s.staff_id) = null THEN 0\r\n" + 
				"		ELSE\r\n" + 
				"		(select count(*) from record where type=0 and staff_id=s.staff_id)\r\n" + 
				"	END as discipline,\r\n" + 
				"    CASE \r\n" + 
				"		WHEN  (select count(*) from record where type=0 and staff_id=s.staff_id) = null THEN 0\r\n" + 
				"		ELSE\r\n" + 
				"		(select count(*)- (select count(*) from record where type=0 and staff_id=s.staff_id) from record where type=1 and staff_id=s.staff_id) \r\n" + 
				"	END as total,\r\n" + 
				"    s.depart_id\r\n" + 
				"    from record as r inner join staff as s on r.staff.staff_id = s.staff_id \r\n" + 
				"	where type = 1 group by s.staff_id order by total desc").getResultList();
	}
	
	public List getListAllYear() {
		return getCurrentSession().createQuery(
				"SELECT  year(r.date) as y,\r\n" + 
				"(select count(*) from record where type = 0 and year(date) = year(r.date) ) as D,\r\n" + 
				"(select count(*) from record where type = 1 and year(date) = year(r.date) ) as A,\r\n" + 
				"CASE \r\n" + 
				"WHEN (SELECT count(*)  FROM record where type = 0 and year(date) = year(r.date)) = NULL THEN 0\r\n" + 
				"ELSE \r\n" + 
				"	(SELECT count(*) - (SELECT count(*)  FROM record where type = 0 and year(date) = year(r.date)) \r\n" + 
				"    FROM record where type = 1 and year(date) = year(r.date))\r\n" + 
				"END as AD\r\n" + 
				"FROM record as r where year(date) <= year(curdate()) group by year(r.date) order by year(r.date)").getResultList();
	}
	
	public List getListFollowYear(String year) {
		return getCurrentSession().createQuery(
				"SELECT  year(r.date) as y,\r\n" + 
				"(select count(*) from record where type = 0 and year(date) = year(r.date) ) as D,\r\n" + 
				"(select count(*) from record where type = 1 and year(date) = year(r.date) ) as A,\r\n" + 
				"CASE \r\n" + 
				"WHEN (SELECT count(*)  FROM record where type = 0 and year(date) = year(r.date)) = NULL THEN 0\r\n" + 
				"ELSE \r\n" + 
				"	(SELECT count(*) - (SELECT count(*)  FROM record where type = 0 and year(date) = year(r.date)) \r\n" + 
				"    FROM record where type = 1 and year(date) = year(r.date))\r\n" + 
				"END as AD\r\n" + 
				"FROM record as r where year(date) = "+year+" group by year(r.date) order by year(r.date)").getResultList();
	}
	
	
	
	public List getListFollowMonth(String year) {
		return getCurrentSession().createQuery(
				"SELECT  Month(r.date) as m,\r\n" + 
				"(select count(*) from record where type = 0 and Month(date) = Month(r.date) and year(date) ="+year+" ) as D,\r\n" + 
				"(select count(*) from record where type = 1 and Month(date) = Month(r.date) and year(date) ="+year+" ) as A,\r\n" + 
				"CASE \r\n" + 
				"WHEN (SELECT count(*)  FROM record where type = 0 and Month(date) = Month(r.date) and year(date) ="+year+" ) = NULL THEN 0\r\n" + 
				"ELSE \r\n" + 
				"	(SELECT count(*) - (SELECT count(*)  FROM record where type = 0 and Month(date) = Month(r.date) and year(date)="+year+" )\r\n" + 
				"    FROM record where type = 1 and Month(date) = Month(r.date) and year(date)="+year+" )\r\n" + 
				"END as AD\r\n" + 
				"FROM record as r where year(date) = "+year+" group by Month(r.date) order by Month(r.date)").getResultList();
	}
	
	public List getListLastMonth() {
		return getCurrentSession().createQuery(
				"SELECT  Month(r.date) as m,\r\n" + 
				"(select count(*) from record where type = 0 and Month(date) = Month(r.date) and year(date) =year(curdate()) ) as D,\r\n" + 
				"(select count(*) from record where type = 1 and Month(date) = Month(r.date) and year(date) =year(curdate()) ) as A,\r\n" + 
				"CASE \r\n" + 
				"WHEN (SELECT count(*)  FROM record where type = 0 and Month(date) = Month(r.date) and year(date) = year(curdate()) ) = NULL THEN 0\r\n" + 
				"ELSE \r\n" + 
				"	(SELECT count(*) - (SELECT count(*)  FROM record where type = 0 and Month(date) = Month(r.date) and year(date)=year(curdate()) )\r\n" + 
				"    FROM record where type = 1 and Month(date) = Month(r.date) and year(date)=year(curdate()) )\r\n" + 
				"END as AD\r\n" + 
				"FROM record as r where year(date) = year(curdate()) and month(date) = month(curdate())-1 group by Month(r.date) order by Month(r.date)").getResultList();
	}

	
	public long getNumAchieve() {
		return (long) getCurrentSession().createQuery("SELECT count(*) FROM record where date = current_date() and type = 1").getSingleResult();
	}
	
	public long getNumDiscipline() {
		return (long) getCurrentSession().createQuery("SELECT count(*) FROM record where date = current_date() and type = 0").getSingleResult();
	}

	
}
