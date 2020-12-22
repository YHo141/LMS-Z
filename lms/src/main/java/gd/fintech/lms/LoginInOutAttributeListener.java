package gd.fintech.lms;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class LoginInOutAttributeListener implements HttpSessionAttributeListener {
	
	public LoginInOutAttributeListener() {
	}
	/*
	//세션이 생길때
	@Override
    public void sessionCreated(HttpSessionEvent se)  { 
    	System.out.println("세션 created진입");
    	System.out.println(se.getSession().getAttribute("adminId"));
    }
	//세션이 삭제될때
	@Override
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	System.out.println("session Listener id 삭제");
    }
    => 사용했더니 created에 진입조차 하지 않고 로그아웃클릭하여 세션이 삭제될 때 session은 정상 삭제되고 그 다음에 created진입
    왜?/.... 
    */
	
	//세션 객체에 setAttribute()를 통해 새로운 객체가 등록되었을 때
	public void attributeAdded(HttpSessionBindingEvent sbe){
		System.out.println(sbe.getSession().getAttribute("adminId"));
	}
	
}