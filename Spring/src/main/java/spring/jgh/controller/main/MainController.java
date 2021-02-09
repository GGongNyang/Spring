package spring.jgh.controller.main;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.common.common.CommandMap;

@Controller
public class MainController {

	Logger log = Logger.getLogger(this.getClass());
	
	//메인으로 이동
		@RequestMapping(value = "/main/openMain.do")
		public ModelAndView openMain(CommandMap commandMap) throws Exception {
				
			ModelAndView mv = new ModelAndView("/main/main");
			
			return mv;

		}
	
}
