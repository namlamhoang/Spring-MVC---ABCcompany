package com.springmvc.config;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


@WebFilter(filterName = "charsetFilter",urlPatterns = "/*")
public class charsetFliter implements Filter {

	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// invoked when an instance of this filter is created by the container
        // used to initialize resources, read parameters...
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException { 
		request.setCharacterEncoding("UTF-8"); 
		// invoked when a matching request sent to the server
		// used to intercept the request and transform the response
		chain.doFilter(request, response); // invokes next filter in the chain
	}

	@Override
	public void destroy() {
		// invoked when the filter instance is being destroyed by the container
		// used clean up resources

	}
	
	
}