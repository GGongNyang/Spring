package spring.jgh.service.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {

	void selectMember(Map<String, Object> map, HttpServletRequest request);


}
