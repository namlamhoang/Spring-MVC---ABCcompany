package com.springmvc.config;


import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


@Component
@ComponentScan(value="com.springmvc")
public class ServiceConfiguartion {
	
	@Autowired
	ServletContext servletContext;
	
	
	@Bean(name="multipartResolver")
	public MultipartResolver multipartResolver (ServletContext servletContext) {
		CommonsMultipartResolver multipart = new CommonsMultipartResolver();
		/* multipart.setMaxUploadSizePerFile(1 * 1024 * 1024); */
		multipart.setMaxUploadSize(3 * 1024 * 1024);
		return multipart;
	}

//	
//	@Bean(name ="mailsender")
//	public JavaMailSenderImpl javaMailSenderImpl() {
//		JavaMailSenderImpl javamail = new JavaMailSenderImpl();
//		javamail.setHost("smtp.gmail.com");
//		javamail.setPort(587);
//		javamail.setUsername("testjavacore@gmail.com");
//		javamail.setPassword("baconheo");
//		javamail.setDefaultEncoding("utf-8");
//		Properties pros = new Properties();
//		pros.setProperty("mail.smtp.auth","true");
//		pros.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
//		pros.setProperty("mail.smtp.socketFactory.port","465");
//		pros.setProperty("mail.smtp.starttls.enable","false");
//		pros.setProperty("mail.debug","true");
//		javamail.setJavaMailProperties(pros);
//		return javamail;
//		
//	}

	
}
