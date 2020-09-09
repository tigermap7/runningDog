package com.kh.runningdog.dboard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.runningdog.common.ImageUtil.Image;
import com.kh.runningdog.common.ImageUtil.ImageLoader;
import com.kh.runningdog.dboard.model.service.DboardService;
import com.kh.runningdog.dboard.model.vo.Dboard;

@Controller
public class DboardController {
	private static final Logger logger = LoggerFactory.getLogger(DboardController.class);
	
	@Autowired
	private DboardService dboardService;
	
	@RequestMapping("dlistPage.do")
	public String moveDlistPage() {
		return "animal/chooseList";
	}
	
	@RequestMapping("dinsertPage.do")
	public String moveDinsertPage() {
		return "animal/chooseWrite";
	}
	
	@RequestMapping(value="dinsert.do", method=RequestMethod.POST)
	public String insertDboard(Dboard dboard, HttpServletRequest request, 
			@RequestParam(name="upfile", required=false) MultipartFile file) {
		logger.info("dinsert.do run..." + dboard + "Image file : " + file.getOriginalFilename());
		
		String viewImage = file.getOriginalFilename();
		dboard.setviewImage(viewImage);

        Image img = null;
		if(!(viewImage == null || viewImage.equals(" "))) {
			 String savePath = request.getSession().getServletContext().getRealPath("resources/dboard/dboardImage");
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	         String viewRename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
	         String listRename = viewRename + "l." + viewImage.substring(viewImage.lastIndexOf(".") + 1);
	         viewRename += "v." + viewImage.substring(viewImage.lastIndexOf(".") + 1);
	         String viewPath = savePath + "\\" + viewRename; //view 이미지 파일 경로
	         String listPath = savePath + "\\" + listRename; //list 이미지 파일 경로

			try {
				//하나의 스트림에 파일 연결은 하나 밖에 못함으로 
				//저장한 파일 복사해서 이미지 리사이징 처리
				file.transferTo(new File(savePath + "\\" + viewRename));
				FileInputStream fin = new FileInputStream(viewPath);
				FileOutputStream fout = new FileOutputStream(listPath);

				int data = -1;
				byte[] buffer = new byte[1024];
				while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
					fout.write(buffer, 0, buffer.length);
				}
				img = ImageLoader.fromFile(listPath);

				//너비 300으로 리사이징 처리 화질은 최대한 보정
				img.getResizedToWidth (400) .soften (0.0f) .writeToJPG (new File (listPath), 0.95f);

			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

	         dboard.setviewImage(viewRename);
	         dboard.setlistImage(listRename);
	      } 
	      
	      if(dboardService.insertDboard(dboard) > 0) {
	         return "redirect:dlistPage.do";
	      } else {
	         request.setAttribute("message", "새 공지사항 등록 처리 실패");
	         return "common/error";
	      }
		}
	
}
