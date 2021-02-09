package spring.jgh.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import spring.common.common.CommandMap;
import spring.common.util.FileUtils;
import spring.jgh.dao.board.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	
	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(CommandMap commandMap) throws Exception {
		return boardDAO.selectBoardList(commandMap);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		boardDAO.insertBoard(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
			
		for(int i=0, size = list.size(); i<size; i++) {
			boardDAO.insertFile(list.get(i));
		}
	}
	
	@Override
	public Map<String,Object> selectBoardView(Map<String, Object> map) throws Exception {
		boardDAO.updateHit(map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String,Object> tempMap = boardDAO.selectBoardView(map);
		resultMap.put("map", tempMap);
		
		List<Map<String, Object>> list = boardDAO.selectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}
	
	@Override
	public void updateBoard(Map<String,Object> map, HttpServletRequest request) throws Exception{
		boardDAO.updateBoard(map);
		boardDAO.deleteFileList(map);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String, Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				boardDAO.insertFile(tempMap);
			}else {
				boardDAO.updateFile(tempMap);
			}
		}
	}
	
	@Override
	public void deleteBoard(Map<String,Object> map) throws Exception{
		boardDAO.deleteBoard(map);
	}
	
}
