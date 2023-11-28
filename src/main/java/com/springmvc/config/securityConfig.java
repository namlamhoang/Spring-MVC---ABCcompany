package com.springmvc.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.security.web.session.HttpSessionEventPublisher;



@Configuration
@EnableWebSecurity
public class securityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;
	
	@Override
	protected AuthenticationManager authenticationManager() throws Exception {
		System.out.println("authenticationManager");
		return super.authenticationManager();
	}
	
	@Override	
	public void setTrustResolver(AuthenticationTrustResolver trustResolver) {
		System.out.println("setTrustResolver");
		super.setTrustResolver(trustResolver);
	}
	
	@Override
	protected UserDetailsService userDetailsService() {
		System.out.println("userDetailsService");
		return super.userDetailsService();
	}
	
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		System.out.println("authenticationManagerBean");
		return super.authenticationManagerBean();
	}
	
	@Override
	public void init(WebSecurity web) throws Exception {
		System.out.println("init");
		super.init(web);
	}
	
	@Override
	public UserDetailsService userDetailsServiceBean() throws Exception {
		System.out.println("userDetailsServiceBean");
		return super.userDetailsServiceBean();
	}

	@Bean
	public HttpSessionEventPublisher httpSessionEventPublisher() {
	    return new HttpSessionEventPublisher();
	}
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.sessionManagement()
		.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
		.maximumSessions(2);
		http.authorizeRequests()
		.antMatchers("/resources/**").permitAll()
		.antMatchers("/").hasAnyRole()
		.antMatchers("/home/**").hasRole("EMPLOYEE")
		.antMatchers("/chart/**").hasRole("EMPLOYEE")
		.antMatchers("/user/**").hasRole("EMPLOYEE")
		.antMatchers("/record/**").hasRole("MANAGER")
		.antMatchers("/staff/**").hasRole("MANAGER")
		.antMatchers("/user/system/**").hasRole("ADMIN")
		.antMatchers("/depart/**").hasRole("ADMIN")
		.antMatchers("/system/**").hasRole("ADMIN")
		
		.and()
		.formLogin()
		.loginPage("/pagelogin")
		.loginProcessingUrl("/pagelogin/loging")
		.defaultSuccessUrl("/home/index",true)
		.permitAll()
//		
//        .and()		
//        .logout().deleteCookies("JSESSIONID")
//        .permitAll()
        
        
		.and()
		.exceptionHandling().accessDeniedPage("/error/access-denied");
			
	}

//    .and().
//    rememberMe().key("uniqueAndSecret").tokenValiditySeconds(100000)
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource);
	}
	
	
}
