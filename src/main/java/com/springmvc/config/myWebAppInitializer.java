package com.springmvc.config;



import javax.servlet.Filter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import org.springframework.context.annotation.Bean;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import org.springframework.web.filter.CharacterEncodingFilter;

public class myWebAppInitializer  extends AbstractAnnotationConfigDispatcherServletInitializer  implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		// Create the 'root' Spring application context
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		
		rootContext.register(hibernateConfiguration.class);
		
		// Manage the lifecycle of the root application context
		servletContext.addListener(new ContextLoaderListener(rootContext));
        
		// Create the dispatcher servlet's Spring application context
		AnnotationConfigWebApplicationContext dispatcherServlet = new AnnotationConfigWebApplicationContext();
        dispatcherServlet.register(webMvcConfiguration.class);
        
        // Register and map the dispatcher servlet
        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher", new DispatcherServlet(dispatcherServlet));
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("/"); 
        
	}
	

	
	
	@Override
    protected Filter[] getServletFilters() {
        return new Filter[] {characterEncodingFilter()};
    }
	
	@Bean
	public HttpSessionEventPublisher httpSessionEventPublisher() {
	    return new HttpSessionEventPublisher();
	}
	

	
	@Override
	protected Class<?>[] getRootConfigClasses() { 
		return new Class<?>[]{};//securityWebAppConfiguration.class,hibernateConfiguration.class,aopConfiguaration.class
	}

	@Override
	protected Class<?>[] getServletConfigClasses() { 
		return new Class<?>[]{webMvcConfiguration.class};
	}

	@Override
	protected String[] getServletMappings() { 
		return new String[]{"/"};
	}
	
	@Bean
	public Filter characterEncodingFilter() {
	  CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
	  characterEncodingFilter.setEncoding("UTF-8");
	  characterEncodingFilter.setForceEncoding(true);
	  return characterEncodingFilter;
	}
	
//	private int maxUploadSizeInMb = 5 * 1024 * 1024; // 5 MB	
//	@Override
//    protected Filter[] getServletFilters() {
//        return new Filter[]{new HiddenHttpMethodFilter(), new MultipartFilter(), new OpenEntityManagerInViewFilter()};
//    }
//
//    @Override
//    protected void registerDispatcherServlet(ServletContext servletContext) {
//        super.registerDispatcherServlet(servletContext);
//
//        servletContext.addListener(new HttpSessionEventPublisher());
//
//    }
//
//    @Override
//    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
//
//        File uploadDirectory = ServiceConfiguration.CRM_STORAGE_UPLOADS_DIRECTORY;
//
//        MultipartConfigElement multipartConfigElement = 
//            new MultipartConfigElement(uploadDirectory.getAbsolutePath(),
//                maxUploadSizeInMb, maxUploadSizeInMb * 2, maxUploadSizeInMb / 2);
//
//        registration.setMultipartConfig(multipartConfigElement);
//
//    }
}
