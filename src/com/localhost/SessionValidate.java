package com.localhost;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SessionValidate
 */
@WebFilter(
		dispatcherTypes = {
				DispatcherType.REQUEST, 
				DispatcherType.FORWARD, 
				DispatcherType.INCLUDE
		}
					, 
		urlPatterns = { 
				"/SessionValidate", 
				"/Login.jsp"
		})
public class SessionValidate implements Filter {

    	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
    	{
    		HttpServletRequest req = (HttpServletRequest)request;
    		HttpServletResponse res = (HttpServletResponse)response;
    		HttpSession session = req.getSession();
    		if(session.getAttribute("username")!=null)
    		{
    			System.out.println("%%%%%%%%%%%%%%%******%%%"+session.getAttribute("username"));
    			session.setAttribute("username",null);
    		}
    	
    			System.out.println("%%%%%%%%%%%%%%%%%%");
    			chain.doFilter(request, response);
    		
	}

		@Override
		public void destroy() {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void init(FilterConfig arg0) throws ServletException {
			// TODO Auto-generated method stub
			
		}

	
	

}
