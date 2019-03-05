package my.batis.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final String LOGIN = "authInfo";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
		
	@Override	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception { 
		
		HttpSession httpSession = request.getSession();

		Object authInfo = httpSession.getAttribute(LOGIN); 
		System.out.println("interceptor authInfo="+authInfo);
		if(authInfo == null) {
			response.sendRedirect("/admin/login"); 
			return false; 
		}
  
		return true;
			 	
	}
	 
	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}
