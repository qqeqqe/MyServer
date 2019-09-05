package kr.korea.my.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UnauthInterceptor extends HandlerInterceptorAdapter {

	
	@Override
	public boolean preHandle(HttpServletRequest request, 
		HttpServletResponse response, 
		Object handler)
		throws Exception {
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		
		if(user != null) {
			response.sendRedirect(request.getContextPath()+"/board/list");
		}
		return true;
	}
}
