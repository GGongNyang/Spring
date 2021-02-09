package spring.jgh.controller.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.common.common.CommandMap;

@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	String pcode;
	String ptype;
	
		//������ �̵�
		@RequestMapping(value="/member/memberInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView memberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception{
			
			//get��İ� post��Ŀ��� ���� �ִ°� �ٸ�
			if(request.getParameter("pcode") == null || request.getParameter("pcode").equals("")) {
				//System.out.println("PCODE = " + commandMap.get("PCODE").toString());
				pcode = commandMap.get("PCODE").toString();
			} else {
				pcode = request.getParameter("pcode");
			}
			
			ModelAndView mv = null;
			
			//pcode�� ���� ���� �������� �������� �޶�����.
			if(pcode.equals("loginF")) {
				mv = new ModelAndView("/member/login");
			} else if(pcode.equals("memFind")) {
				mv = new ModelAndView("/member/memFind");
			} else if(pcode.equals("join")) {
				mv = new ModelAndView("/member/join");
			}
			
			mv.addObject("pcode", pcode);
			
			return mv;
		}
		
}