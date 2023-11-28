package com.springmvc.helper;

import java.util.Arrays;
import java.util.List;

public class regularExpression {
	 
	public List<String> contentTypes = Arrays.asList("image/png", "image/jpeg"); // file name extension , "image/gif"

	public List<String> contentTypesdocument = Arrays.asList("application/pdf");// , "application/docx"		
	
	
	
	
	public boolean validname(String text) {
		String pattern = ".{5,44}" ;
        return text.matches(pattern);
	}
	
	public boolean validnote(String text) {
		String pattern = ".{0,99}" ;
        return text.matches(pattern);
	}
	
	public boolean validphone (String text){ 
        String pattern = "0\\d{8,12}" ;
        return text.matches(pattern);
    }  
	
	public boolean validemail(String text){ 
        String pattern = "\\w+@\\w+(\\.\\w+){1,2}";       
        return text.trim().matches(pattern);
    }
	
	
	
}
