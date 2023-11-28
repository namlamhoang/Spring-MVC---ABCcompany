package com.springmvc.dao;

public class test {
	public static void main(String args[]) {
//		departDAO d = new departDAO();
//		
//		
//		System.out.println(d.getCurrentSession());
//		d.initJdbc();
		String [] arr = {"a","b","c"};
	
		String str = String.join("'", arr);
		System.out.println(str);
	}
}
