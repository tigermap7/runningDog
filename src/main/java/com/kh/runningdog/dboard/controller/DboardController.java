package com.kh.runningdog.dboard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
//	@RequestMapping("dlistPage.do")
//	public String moveDlistPage() {
//		return "animal/chooseList";
//	}

	@RequestMapping("dinsertPage.do")
	public String moveDinsertPage() {
		return "animal/chooseWrite";
	}
	
	@RequestMapping(value = "dinsert.do", method = RequestMethod.POST)
	public String insertDboard(Dboard dboard, HttpServletRequest request,
				@RequestParam(name = "upfile", required = false) MultipartFile file, Model model) {
		logger.info("dinsert.do run..." + dboard + "Image file : " + file.getOriginalFilename());

		String viewImage = file.getOriginalFilename();
		dboard.setviewImage(viewImage);
		dboard.setdContent(dboard.getdContent().replace("\r\n", "<br>"));
		Image viewImg = null;
		Image listImg = null;
		// viewImage 가 null아니거나 viewImage크기가 0 이 아니라면
		// viewImage가 공백이 들어온다면 byte 크기가 0이기때문에 byte로 비교
		if (!(viewImage == null || viewImage.getBytes().length == 0)) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/dboard/dboardImage");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String viewRename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			String listRename = viewRename + "l." + viewImage.substring(viewImage.lastIndexOf(".") + 1);
			viewRename += "v." + viewImage.substring(viewImage.lastIndexOf(".") + 1);
			String viewPath = savePath + "\\" + viewRename; // view 이미지 파일 경로
			String listPath = savePath + "\\" + listRename; // list 이미지 파일 경로

			try {
				// 하나의 스트림에 파일 연결은 하나 밖에 못함으로
				// 저장한 파일 복사해서 이미지 리사이징 처리
				file.transferTo(new File(savePath + "\\" + viewRename));
				FileInputStream fin = new FileInputStream(viewPath);
				FileOutputStream fout = new FileOutputStream(listPath);

				int data = -1;
				byte[] buffer = new byte[1024];
				while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
					fout.write(buffer, 0, buffer.length);
				}
				viewImg = ImageLoader.fromFile(viewPath);
				listImg = ImageLoader.fromFile(listPath);

				// 너비 300으로 리사이징 처리 화질은 최대한 보정
				// 원본 파일을 저장하니 용량이 너무 많아져서 viewImg도 리사이징
				viewImg.getResizedToWidth(800).soften(0.0f).writeToJPG(new File(viewPath), 0.95f);
				listImg.getResizedToWidth(300).soften(0.0f).writeToJPG(new File(listPath), 0.95f);


			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			dboard.setviewImage(viewRename);
			dboard.setlistImage(listRename);
		}
		// 리턴은 한번 하기 위해 url 값 받고 리턴
		String url = "";
		if (dboardService.insertDboard(dboard) > 0) {
			url = "redirect:/dboardList.do";
		} else {
			model.addAttribute("msg", "게시글 등록 실패 다시 확인해 주세요");
			model.addAttribute("url", "dboardList.do");
			url = "common/errorDboard";
		}
		return url;
	}

	@RequestMapping(value = "dboardList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String dboardList(HttpServletRequest request, Model model, @ModelAttribute("Dboard") Dboard dboard) {

		dboard.setSearchFiled(request.getParameter("searchFiled"));
		dboard.setSearchValue(request.getParameter("searchValue"));
		dboard.setdCategory(request.getParameter("dCategory"));
		dboard.setdLocal(request.getParameter("dLocal"));
		logger.info("SearchFiled : " + dboard.getSearchFiled());
		logger.info("SearchValue : " + dboard.getSearchValue());
		int totalCount = dboardService.selectListCount(dboard); // 게시물 총갯수를 구한다

		dboard.setTotalCount(totalCount); // 페이징 처리를 위한 setter 호출

		model.addAttribute("pageVO", dboard);
		logger.info("PageSize // 한 페이지에 보여줄 게시글 수 : " + dboard.getPageSize());
		logger.info("PageNo // 페이지 번호 : " + dboard.getPageNo());
		logger.info("StartRowNo //조회 시작 row 번호 : " + dboard.getStartRowNo());
		logger.info("EndRowNo //조회 마지막 now 번호 : " + dboard.getEndRowNo());
		logger.info("FirstPageNo // 첫 번째 페이지 번호 : " + dboard.getFirstPageNo());
		logger.info("FinalPageNo // 마지막 페이지 번호 : " + dboard.getFinalPageNo());
		logger.info("PrevPageNo // 이전 페이지 번호 : " + dboard.getPrevPageNo());
		logger.info("NextPageNo // 다음 페이지 번호 : " + dboard.getNextPageNo());
		logger.info("StartPageNo // 시작 페이지 (페이징 네비 기준) : " + dboard.getStartPageNo());
		logger.info("EndPageNo // 끝 페이지 (페이징 네비 기준) : " + dboard.getEndPageNo());
		logger.info("totalCount // 게시 글 전체 수 : " + totalCount);

		ArrayList<Dboard> dboardList = dboardService.selectList(dboard);
		
		
		model.addAttribute("dLocal", dboard.getdLocal());
		model.addAttribute("dCategory", dboard.getdCategory());
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("dboardList", dboardList);
		// 리턴은 한번 하기 위해 url 값 받고 리턴
		String url = "";
		if (totalCount > 0) {
			url = "animal/chooseList";
		} else {
			model.addAttribute("msg", "검색 결과가 존재 하지 않습니다");
			model.addAttribute("url", "dboardList.do");
			url = "common/errorDboard";
		}
		return url;
	}

	@RequestMapping("dboardView.do")
	public String selectOne(@RequestParam("dNum") int dNum,Model model) {
		Dboard dboard = dboardService.selectOne(dNum);
		logger.info("dboard View게시글 번호" + dNum);
		// 리턴은 한번 하기 위해 url 값 받고 리턴
		String url = "";
		if (dboard != null) {
			model.addAttribute("dboard", dboard);
			url = "animal/chooseView";
		} else {
			model.addAttribute("msg", "게시글 보기 실패");
			model.addAttribute("url", "dboardList.do");
			url = "common/errorDboard";
		}
		return url;
	}
	
	@RequestMapping("dupView.do")
	public String dboardUpdateView(@RequestParam("dNum") int dNum, Model model) {
		Dboard dboard = dboardService.selectOne(dNum);
		
		dboard.setdContent(dboard.getdContent().replaceAll("<br>", "\r\n"));
		logger.info("업데이트 view board 값 :" + dboard);
		logger.info("업데이트 view dNum 값 :" + dNum);
		// 리턴은 한번 하기 위해 url 값 받고 리턴
		String url = "";
		if (dboard != null) {
			model.addAttribute("dboard", dboard);
			url = "animal/chooseUpdate";
		} else {
			model.addAttribute("msg", "수정 게시글 이동 실패");
			model.addAttribute("url", "dboarView.do");
			url = "common/errorDboard";
		}
		return url;
	}

	@RequestMapping(value = "dupdate.do", method = RequestMethod.POST)
	public String updateDboard(Dboard dboard, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile file, Model model) throws IOException {
		logger.info("dupdate.do run..." + dboard + "Image file : " + file.getOriginalFilename());
		// 상세설명에 엔터키와 띄어쓰기 적용
		dboard.setdContent(dboard.getdContent().replace("\r\n", "<br>"));
		// 새로운 이미지를 업로드 했을 경우
		if (file != null && file.getBytes().length > 0) {
			String viewImage = file.getOriginalFilename();
			dboard.setviewImage(viewImage);
			
			Image viewImg = null;
			Image listImg = null;
			// viewImage 가 null아니거나 viewImage크기가 0 이 아니라면
			// viewImage가 공백이 들어온다면 byte 크기가 0이기때문에 byte로 비교
			if (!(viewImage == null || viewImage.getBytes().length == 0)) {
				String savePath = request.getSession().getServletContext().getRealPath("resources/dboard/dboardImage");
				// update 페이지에 파일을 업로드 했을경우 기존에 있던 파일 삭제
				new File(savePath + "\\" + dboard.getviewImage()).delete();
				new File(savePath + "\\" + dboard.getlistImage()).delete();

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String viewRename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
				String listRename = viewRename + "l." + viewImage.substring(viewImage.lastIndexOf(".") + 1);
				viewRename += "v." + viewImage.substring(viewImage.lastIndexOf(".") + 1);
				String viewPath = savePath + "\\" + viewRename; // view 이미지 파일 경로
				String listPath = savePath + "\\" + listRename; // list 이미지 파일 경로

				try {
					// 하나의 스트림에 파일 연결은 하나 밖에 못함으로
					// 저장한 파일 복사해서 이미지 리사이징 처리
					file.transferTo(new File(savePath + "\\" + viewRename));
					FileInputStream fin = new FileInputStream(viewPath);
					FileOutputStream fout = new FileOutputStream(listPath);

					int data = -1;
					byte[] buffer = new byte[1024];
					while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
						fout.write(buffer, 0, buffer.length);
					}
					viewImg = ImageLoader.fromFile(viewPath);
					listImg = ImageLoader.fromFile(listPath);

					// 너비 300으로 리사이징 처리 화질은 최대한 보정
					// 원본 파일을 저장하니 용량이 너무 많아져서 viewImg도 리사이징
					viewImg.getResizedToWidth(800).soften(0.0f).writeToJPG(new File(viewPath), 0.95f);
					listImg.getResizedToWidth(300).soften(0.0f).writeToJPG(new File(listPath), 0.95f);

				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}

				dboard.setviewImage(viewRename);
				dboard.setlistImage(listRename);
			}
		}
		
		// 리턴은 한번 하기 위해 url 값 받고 리턴
		String url = "";
		if (dboardService.updateDboard(dboard) > 0) {
			model.addAttribute("dNum", dboard.getdNum());
			url = "redirect:/dboardView.do";
		} else {
			model.addAttribute("msg", "게시글 수정 실패 다시 확인해 주세요");
			model.addAttribute("url", "dboardView.do");
			url = "common/errorDboard";
		}
		return url;
	}
	
	@RequestMapping("dHide.do")
	public String updateDboardHide(@RequestParam("dNum") int dNum, Dboard dboard,Model model) {
		//게시물을 삭제 하지 않고 표시 여부에 업데이트 하여
		//3개월 후 프로시저 등록 후 스케줄러 이용하여 게시물 삭제
		int result = dboardService.updateDboardHide(dboard);
		
		// 리턴은 한번 하기 위해 url 값 받고 리턴
		String url ="";
		if (result > 0) {
			model.addAttribute("msg", "게시물을 삭제 했습니다.");
			model.addAttribute("url", "dboardList.do");
			url = "common/errorDboard";
		} else {
			model.addAttribute("msg", "게시물 삭제에 실패 했습니다.");
			model.addAttribute("url", "dboardList.do");
			url = "common/errorDboard";
		}
		return url;
	}
	
	@RequestMapping("dUpSuccess.do")
	public String updateDboardSuc(@RequestParam("dNum") int dNum,@RequestParam("dSuccess") String dSuccess,
								Dboard dboard,Model model) {
		dboard.setdSuccess(dSuccess);
		logger.info("게시물 분양 여부 체크 : "+dboard.getdSuccess());
		int result = dboardService.updateDboardSuc(dboard);
		
		
		String url="";
		if (result > 0) {
			model.addAttribute("msg", "분양 여부를 업데이트 했습니다");
			model.addAttribute("url", "dboardView.do"+"?dNum="+dboard.getdNum());
			url = "common/errorDboard";
		} else {
			model.addAttribute("dNum", dboard.getdNum());
			model.addAttribute("msg", "분양 여부 업데이트 실패");
			model.addAttribute("url", "dboardView.do"+"?dNum="+dboard.getdNum());
			url = "common/errorDboard";
		}
		return url;
	}
	
	@RequestMapping("dboardnext.do")
	public String dboardNext(Model model,@ModelAttribute("Dboard") Dboard dboard) {
		//다음글 번호조회
		int dboardNextNum = dboardService.selectNext(dboard);
		//다음글번호를 받고 다음글로 조회
		Dboard dboardNext = dboardService.selectOne(dboardNextNum);
		// 리턴은 한번 하기 위해 url 값 받고 리턴
		
		String url = "";
		if (dboard.getdNum() != dboardNextNum) {
			model.addAttribute("dboard", dboardNext);
			url = "animal/chooseView";
		} else {
			model.addAttribute("dboard",dboard);
			model.addAttribute("msg", "현재 글이 마지막 글 입니다.");
			model.addAttribute("url", "dboardView.do?dNum="+dboard.getdNum());
			url = "common/errorDboard";
		}
		return url;
	}
	
	@RequestMapping("dboardprev.do")
	public String dboardPrev(Model model,@ModelAttribute("Dboard") Dboard dboard) {
		//다음글 번호조회
		int dboardPrevNum = dboardService.selectPrevNum(dboard);
		//다음글번호를 받고 다음글로 조회
		Dboard dboardPrev = dboardService.selectOne(dboardPrevNum);
		// 리턴은 한번 하기 위해 url 값 받고 리턴
		String url = "";
		if ( dboard.getdNum() != dboardPrevNum) {
			model.addAttribute("dboard", dboardPrev);
			url = "animal/chooseView";
		} else {
			model.addAttribute("dboard",dboard);
			model.addAttribute("msg", "현재 글이 마지막 글 입니다.");
			model.addAttribute("url", "dboardView.do?dNum="+dboard.getdNum());
			url = "common/errorDboard";
		}
		return url;
	}
}
