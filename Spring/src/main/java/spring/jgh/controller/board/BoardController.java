package spring.jgh.controller.board;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.common.common.CommandMap;
import spring.jgh.service.board.BoardService;

@Controller
public class BoardController {

	Logger log = Logger.getLogger(this.getClass());
	
	String pcode;
	String ptype;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	//메인으로 이동
	@RequestMapping(value = "/board/openBoardMain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView openBoardMain(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		//get방식과 post방식에서 값을 넣는게 다름
		if(request.getParameter("pcode") == null || request.getParameter("pcode").equals("")) {
			System.out.println("PCODE = " + commandMap.get("PCODE").toString());
			pcode = commandMap.get("PCODE").toString();
		} else {
			pcode = request.getParameter("pcode");
		}
		
		ModelAndView mv = new ModelAndView("/board/main");
		
		if (commandMap.isEmpty() == false) {
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		
		if(pcode.equals("000201")) {
			List<Map<String, Object>> list = boardService.selectBoardList(commandMap);
			
			mv.addObject("list", list);
			mv.addObject("pcode", pcode);
			mv.addObject("ptype", "gongji");
			mv.addObject("type", "list");
		} 
		else if(pcode.equals("000202")) {
			List<Map<String, Object>> list = boardService.selectBoardList(commandMap);
			
			mv.addObject("list", list);
			mv.addObject("pcode", pcode);
			mv.addObject("ptype", "board");
			mv.addObject("type", "list");
		} 
		else if(pcode.equals("000203")) {
			List<Map<String, Object>> list = boardService.selectBoardList(commandMap);
			
			mv.addObject("list", list);
			mv.addObject("pcode", pcode);
			mv.addObject("ptype", "image");
			mv.addObject("type", "list");
		}
		
		return mv;

	}
	
	//글쓰기로 이동
	@RequestMapping(value="/board/openBoardWrite.do", method = RequestMethod.POST)
	public ModelAndView openBoardWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		pcode = commandMap.get("PCODE").toString();
		ptype = commandMap.get("PTYPE").toString();
		
		ModelAndView mv = new ModelAndView("/board/main");
		
		mv.addObject("pcode", pcode);
		mv.addObject("ptype", ptype);
		mv.addObject("type", "write");
		
		return mv;
	}
	
	//글이 작성 됨
	@RequestMapping(value="/board/insertBoard.do", method = RequestMethod.POST)
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		pcode = commandMap.get("PCODE").toString();
		ptype = commandMap.get("PTYPE").toString();
		
		ModelAndView mv = new ModelAndView("/board/main");
		
		boardService.insertBoard(commandMap.getMap(), request);
		
		mv.addObject("pcode", pcode);
		mv.addObject("ptype", ptype);
		mv.addObject("type", "write_ok");
		
		request.setAttribute("att_pcode", pcode);
		
		return mv;
	}
	
	//뷰 페이지로 이동
	@RequestMapping(value="/board/openBoardView.do", method = RequestMethod.POST)
	public ModelAndView viewBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		pcode = commandMap.get("PCODE").toString();
		ptype = commandMap.get("PTYPE").toString();
		
		ModelAndView mv = new ModelAndView("/board/main");
		
		Map<String,Object> map = boardService.selectBoardView(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		mv.addObject("pcode", pcode);
		mv.addObject("ptype", ptype);
		mv.addObject("type", "view");
		
		return mv;
	}
	
	//수정 페이지로 이동
	@RequestMapping(value="/board/openBoardUpdate.do", method = RequestMethod.POST)
	public ModelAndView openBoardUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception{
		pcode = commandMap.get("PCODE").toString();
		ptype = commandMap.get("PTYPE").toString();
		
		ModelAndView mv = new ModelAndView("board/update");
		
		Map<String,Object> map = boardService.selectBoardView(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		mv.addObject("pcode", pcode);
		mv.addObject("ptype", ptype);
		mv.addObject("type", "update");
		return mv;
	}
	
	//수정이 됨
	@RequestMapping(value="/board/updateBoard.do", method = RequestMethod.POST)
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		pcode = commandMap.get("PCODE").toString();
		ptype = commandMap.get("PTYPE").toString();
		
		ModelAndView mv = new ModelAndView("/board/main");
		
		boardService.updateBoard(commandMap.getMap(), request);
		
		mv.addObject("BNO", commandMap.get("BNO"));
		mv.addObject("SUB_BNO", commandMap.get("SUB_BNO"));
		mv.addObject("pcode", pcode);
		mv.addObject("ptype", ptype);
		mv.addObject("type", "update_ok");
		
		request.setAttribute("att_pcode", pcode);
		
		return mv;
	}
	
	//게시글 삭제
	@RequestMapping(value="/board/deleteBoard.do", method = RequestMethod.POST)
	public ModelAndView deleteBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		pcode = commandMap.get("PCODE").toString();
		ptype = commandMap.get("PTYPE").toString();
		
		ModelAndView mv = new ModelAndView("/board/main");
		
		boardService.deleteBoard(commandMap.getMap());
		
		mv.addObject("pcode", pcode);
		mv.addObject("ptype", ptype);
		mv.addObject("type", "delete");
		
		request.setAttribute("att_pcode", pcode);
		
		return mv;
	}
	
	//게시글 삭제
		@RequestMapping(value="/board/openPop.do")
		public ModelAndView openPop(CommandMap commandMap) throws Exception{

			ModelAndView mv = new ModelAndView("/board/pop");
			
			return mv;
		}

}
