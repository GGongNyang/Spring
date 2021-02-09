package spring.jgh.service.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import spring.common.common.CommandMap;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(CommandMap commandMap) throws Exception;

	void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectBoardView(Map<String, Object> map) throws Exception;

	void updateBoard(Map<String,Object> map, HttpServletRequest request) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;
	
}
