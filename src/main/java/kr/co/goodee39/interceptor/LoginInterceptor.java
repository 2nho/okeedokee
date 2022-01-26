package kr.co.goodee39.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		// account가 null이면 session을 초기화
		if(session.getAttribute("account") == null) {
			session.invalidate();	// 세션 초기화
			response.sendRedirect(request.getContextPath()); // home으로 이동한다.
			return false;
		}
		
		// preHandle 은 반환값 true가 아니라면 다음으로 이동하지 못하고 about:blank로 이동
		return true;
	}
}
