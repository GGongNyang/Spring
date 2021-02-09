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
	
		//�α��� �������� �̵�
		@RequestMapping(value="/member/memberLogin.do")
		public ModelAndView memberLogin(CommandMap commandMap) throws Exception{
			
			ModelAndView mv = new ModelAndView("/member/login");
			
			return mv;
		}
		
		//�α��� �������� �̵�
		@RequestMapping(value="/member/memberJoin.do")
		public ModelAndView memberJoin(CommandMap commandMap) throws Exception{
			
			ModelAndView mv = new ModelAndView("/member/join");
			
			return mv;
		}
	
}
