package com.springmvc.config;



import java.util.Locale;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.MessageSourceSupport;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

@Configuration
public class multipleLanguage extends MessageSourceSupport{
	

	@Bean(name = "messageSource")
	public ReloadableResourceBundleMessageSource messageSource() {
	    ReloadableResourceBundleMessageSource messageBundle = new ReloadableResourceBundleMessageSource();
	    messageBundle.setBasenames("classpath:i18n/aside"
	    		,"classpath:i18n/header"
	    		,"classpath:i18n/contentData"
	    		,"classpath:i18n/validData");
	    messageBundle.setDefaultEncoding("UTF-8");
	    return messageBundle;
	}
	
	@Bean(name="localeResolver")
	public CookieLocaleResolver cookieLocaleResolver() {
		CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
		Locale defaultLocale = new Locale("en");
		cookieLocaleResolver.setDefaultLocale(defaultLocale);
		cookieLocaleResolver.setCookieMaxAge(43200);
		return cookieLocaleResolver;
		
	}
	
	

	
}
