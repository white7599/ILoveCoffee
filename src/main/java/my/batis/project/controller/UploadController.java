package my.batis.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/upload/*")
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class); 
	private static final String UPLOAD_PATH = "D:\\DEVELOPE\\workspaceSpringMVCNew\\mybatis\\src\\main\\webapp\\resources\\uploadImg";
	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public void uploadGet() {
		logger.info("register get...");
	}
	
	@RequestMapping(value = "/upload",method = RequestMethod.POST)
	public void uploadPost(MultipartFile uploadfile, Model model){
	    logger.info("upload() POST 호출");
	    logger.info("파일 이름: {}", uploadfile.getOriginalFilename());
	    logger.info("파일 크기: {}", uploadfile.getSize());

	    String result = saveFile(uploadfile);
	    if(result != null) {
	    	model.addAttribute("result", result);
	    	
	    } else {
	    	model.addAttribute("result", "fail");
	    }

	}

	private String saveFile(MultipartFile file){
	    // 파일 이름 변경
	    UUID uuid = UUID.randomUUID();
	    String saveName = uuid + "_" + file.getOriginalFilename();

	    logger.info("saveName: {}",saveName);

	    // 저장할 File 객체를 생성(껍데기 파일)ㄴ
	    File saveFile = new File(UPLOAD_PATH,saveName); // 저장할 폴더 이름, 저장할 파일 이름

	    try {
	        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return saveName;
	} // end saveFile(
	
}
