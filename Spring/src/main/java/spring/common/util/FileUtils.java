package spring.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	
	Logger log = Logger.getLogger(this.getClass());
	
	private static final String filePath = "D:\\ÄÚµù\\upfiles\\";

	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		String BNO = map.get("BNO").toString();
		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("BNO", BNO);
				listMap.put("ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				
				log.debug("BNO                = " + BNO);
				log.debug("ORIGINAL_FILE_NAME = " + originalFileName);
				log.debug("STORED_FILE_NAME   = " + storedFileName);
				log.debug("FILE_SIZE          = " + multipartFile.getSize());
				
				list.add(listMap);
			}
		}
		return list;
	}

	public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		String requestName = null;
		String BNO = null;
		String FNO = null;
		int boardNo = Integer.parseInt(map.get("BNO").toString());
		
		System.out.println("boardNo >>>>>>" + boardNo);
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				
				multipartFile.transferTo(new File(filePath + storedFileName));
				
				listMap = new HashMap<String, Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("BNO", boardNo);
				listMap.put("ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			} else {
				requestName = multipartFile.getName();
				BNO = "BNO_"+requestName.substring(requestName.indexOf("_")+1);
				FNO = "FNO_"+requestName.substring(requestName.indexOf("_")+1);
				
				System.out.println("BNO1313 >>>>>>>>>" + BNO);
				System.out.println("FNO1414 >>>>>>>>>" + FNO);
				
				if(map.containsKey(BNO) == true && map.get(BNO) != null) {
					listMap = new HashMap<String, Object>();
					listMap.put("IS_NEW", "N");
					listMap.put("FNO", Integer.parseInt(map.get(FNO).toString()));
					list.add(listMap);
				}
			}
		}
		
		return list;
	}
}
