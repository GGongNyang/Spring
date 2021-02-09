package spring.jgh.dao.board;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.common.common.CommandMap;
import spring.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(CommandMap commandMap) throws Exception {
		return (List<Map<String, Object>>)selectList("board.selectBoardList", commandMap);
	}

	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("board.insertBoard", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception {
		insert("board.insertFile", map);
	}

	public void updateHit(Map<String, Object> map) throws Exception{
		update("board.updateHit", map); 
	} 
	
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectBoardView(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("board.selectBoardView", map); 
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("board.selectFileList", map);
	}
	
	public void updateBoard(Map<String, Object> map) throws Exception {
		update("board.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception {
		delete("board.deleteBoard", map);
		update("board.updateSUB_BNO", map);
	}
	
	public void deleteFileList(Map<String, Object> map) throws Exception {
		update("board.deleteFileList", map);
	}
	
	public void updateFile(Map<String, Object> map) throws Exception{
		update("board.updateFile", map);
	}

}
