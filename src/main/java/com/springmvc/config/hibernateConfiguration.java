package com.springmvc.config;

import java.util.ArrayList;
import com.springmvc.model.depart;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan(basePackages = "com.springmvc")
@EnableWebMvc
@EnableTransactionManagement
public class hibernateConfiguration {

	@Autowired
	@Bean(name = "dataSource")
	public DataSource getDatasource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/abcgroup");
		dataSource.setUsername("java");
		dataSource.setPassword("123456");
		return dataSource;
	}

	@Autowired
	@Bean(name = "sessionFactory")
	public LocalSessionFactoryBean getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		sessionFactory.setPackagesToScan("com.springmvc.model");
		Properties pros = new Properties();
		pros.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
//		pros.put("hibernate.show_sql",true);
		pros.put("current_session_context_class", "org.springframework.orm.hibernate5.SpringSessionContext");
		sessionFactory.setHibernateProperties(pros);
		return sessionFactory;
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(LocalSessionFactoryBean sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory.getObject());
		return transactionManager;
	}

	public static <K, V> Map<K, V> createMap(Map<K, V> m) {
		Map<K, V> map = new HashMap<K, V>();
		Map<V, K> tmpMap = new HashMap<V, K>();
		for (Map.Entry<K, V> entry : m.entrySet()) {
			if (!tmpMap.containsKey(entry.getValue())) {
				tmpMap.put(entry.getValue(), entry.getKey());
			}
		}
		for (Map.Entry<V, K> entry : tmpMap.entrySet()) {
			map.put(entry.getValue(), entry.getKey());
		}
		return map;
	}

	public static void main(String[] args) {
		
		List<depart> departList1 = new ArrayList<depart>();
		
		List<depart> departList2 = new ArrayList<depart>();
		
		depart departs = new depart();
		
		departs.setDepart_id(0);
		
		departList2.add(departs);
		
		depart departs2 = new depart();
		
		departs2.setDepart_id(1);
		
		departList2.add(departs2);
		
		departList1.addAll(departList2);
		
		for (depart depart : departList1) {
			
			System.out.println(depart.getDepart_id());
		}
		
//		hibernateConfiguration test = new hibernateConfiguration();
//		try {
//			System.out.println("dataSourcesSuccess: "+test.getDatasource().getConnection());
//		} catch (Exception e) {
//			System.out.println("fail to connect");
//		}

//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("A", "1");
//		map.put("B", "2");
//		map.put("C", "2");
//		map.put("D", "3");
//		map.put("E", "3");
//		for (String key : createMap(map).keySet()) {
//			
//			System.out.println(key + " :" + createMap(map).get(key));
//			System.out.println(key.toString());
//		}
		
//		Set<String> keys = new HashSet<String>();
//		
//		keys.add("a");
//		keys.add("a");
//		keys.add("a");
//		keys.add("b");
//		for (String key : keys) {
//			key.toString();
//			System.out.println(key.toString());
//		}
//		System.out.println();

//		    Set<String> keys = new HashSet<String>(map.values()); //map.keySet(); // The set of keys in the map.
//		    HashMap<String, String> tmpMap = new HashMap<String, String>();
//		    for(Map.Entry<String, String> entry : m.entrySet()) {
//		        if (!tmpMap.containsKey(entry.getValue())) {
//		            tmpMap.put(entry.getValue(), entry.getKey());
//		        }
//		    }
//		    for(Map.Entry<V, K> entry : tmpMap.entrySet()) {
//		        map.put(entry.getValue(), entry.getKey());
//		    }

//		    Iterator<String> keyIter = keys.iterator();
//		    
//		    while (keyIter.hasNext()) {
//		        String key = keyIter.next();
//		        String value = map.get(key);
//		        System.out.println(key+value);
//		        
////		        map.put(value, key);
//		    }
//		    

	}
}
