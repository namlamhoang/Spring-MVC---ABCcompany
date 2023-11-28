package com.springmvc.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyTagHandler extends TagSupport {
	
	private String mess = "somthing";
	
	public String getMess() {
		return mess;
	}

	public void setMess(String mess) {
		this.mess = mess;
	}

	@Override
	public int doStartTag() throws JspException {
		
		try {
			JspWriter jspWriter = pageContext.getOut();
			jspWriter.print(mess);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		// TODO Auto-generated method stub
		return SKIP_BODY;
	}
	
}
