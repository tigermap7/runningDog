package com.kh.runningdog.admin.sponsor.controller;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.TrueFileFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.sponsor.model.service.SponsorService;
import com.kh.runningdog.sponsor.model.vo.Sponsor;
import com.kh.runningdog.sponsor.model.vo.SponsorImage;

@Controller
public class AdminSponsorController {
	private Logger logger = LoggerFactory.getLogger(AdminSponsorController.class);
	
	@Autowired
	private SponsorService sponsorService;
	
	@RequestMapping("aslist.ad")
	public ModelAndView moveAdminSponsorList(ModelAndView mv, HttpServletRequest request) {
		int currentPage = 1;
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		int countList = 6;
		int countPage = 5;
		
		int totalList = sponsorService.selectListCount();
		int totalPage = (int)(((double)totalList / countList) + 0.9);
		
		if(totalPage < currentPage && totalPage != 0)
			currentPage = totalPage;
		
		int startPage = ((int)(((double)currentPage / countPage) + 0.9) - 1) * countPage + 1;
		int endPage = startPage + countPage - 1;
		if(endPage > totalPage)
			endPage = totalPage;
		
		ArrayList<Sponsor> list = sponsorService.selectList(currentPage, countList);
		
		if(list.size() > -1) {
			mv.addObject("list", list);
			mv.addObject("page", currentPage);
			mv.addObject("totalList", totalList);
			mv.addObject("totalPage", totalPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.setViewName("admin/userBoard/sponsorList");
		}
		return mv;
	}
    
    @RequestMapping("aswrite.ad")
	public String moveSponsorWrite() {
		return "admin/userBoard/sponsorWrite";
	}
    
    @RequestMapping("asdetial.ad")
	public ModelAndView moveAdminSponsorDetail(ModelAndView mv, @RequestParam() int page, @RequestParam() int sNum) {
    	Sponsor sponsor = sponsorService.selectOne(sNum);
    	
    	if(sponsor != null) {
    		mv.addObject("page", page);
    		mv.addObject("sponsor", sponsor);
    		mv.setViewName("admin/userBoard/sponsorView");
    	}
		return mv;
	}
	
    @RequestMapping("asupview.ad")
    public ModelAndView moveSponsorUpdateView(ModelAndView mv, Sponsor sponsor, HttpServletResponse response, @RequestParam() int page) {
    	sponsor = sponsorService.selectOne(sponsor.getsNum());
    	DecimalFormat formatter = new DecimalFormat("###,###");
    	String amount = formatter.format(sponsor.getsAmount());
    	
    	mv.addObject("page", page);
    	mv.addObject("amount", amount);
    	mv.addObject("sponsor", sponsor);
    	mv.setViewName("admin/userBoard/sponsorUpdateView");
    	return mv;
    }
    
    @RequestMapping("sfileDel.ad")
    public void sUpFileDelete(@RequestParam() int snum, HttpServletRequest request, Sponsor sponsor) {
    	String savePath = savePath(request) + "/thumbnail";
    	String[] sNum = new String[]{Integer.toString(snum)};
    	ArrayList<Sponsor> list = sponsorService.selectThumb(sNum);
    	new File(savePath + "\\" + list.get(0).getsOriginal()).delete();
    	new File(savePath + "\\" + list.get(0).getsRename()).delete();
    }
    
    @RequestMapping("supdate.ad")
    public String sUpdate(Sponsor sponsor, HttpServletRequest request, @RequestParam(name = "upfile", required = false) MultipartFile upfile) {
    	int sNum = sponsor.getsNum();
    	
    	sponsor.setsAmount(Integer.parseInt(request.getParameter("amount").replaceAll(",", "")));
    	
    	if(upfile != null) {
    		String savePath = savePath(request) + "/thumbnail";
    		String thumbName = upfile.getOriginalFilename();
    		sponsor.setsOriginal(thumbName);
    		File ofile = new File(savePath + "\\" + thumbName);

    		try {
    			upfile.transferTo(ofile);
    			sponsor.setsRename(makeThumnail(savePath, thumbName, ofile));
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    	}

    	int result = sponsorService.updateSponsor(sponsor);
    	
    	//--------------------------------------------------
    	//1. 사진이 변경되지 않은 경우 : 테이블, sContent 양쪽 다 존재
		//2. 사진이 변경된 경우
		//	- sContent에서 삭제 : 테이블에도 삭제해야함
		//	- sContent에서 추가된 경우 : 테이블에도 추가되어야함
    	String view = "";
    	if(result > 0) {
    		//스케쥴러를 이용하기 위해 컨텐츠 이미지 테이블에 저장
    		ArrayList<String> plist = new ArrayList<>(); //추가된 이미지 저장용
    		ArrayList<String> mlist = new ArrayList<>(); //삭제된 이미지 저장용
    		
    		Pattern pattern = Pattern.compile("t/(.*?)\\r");
    		Matcher matcher = pattern.matcher(sponsor.getsContent());
    		
    		//테이블에 저장되어 있는 내용 이미지 파일명
    		ArrayList<SponsorImage> keepImg = sponsorService.selectImageList(new String[]{Integer.toString(sNum)});
    		ArrayList<String> ilist = new ArrayList<>();
    		for(SponsorImage i : keepImg) {
    			ilist.add(i.getSiName());
    		}
    		//sContent 내용에 존재하는 이미지 파일명 읽어 저장
    		ArrayList<String> clist = new ArrayList<>();
    		while(matcher.find()) {
    			clist.add(matcher.group(1));
    		}
    		
    		if(ilist.containsAll(clist))
    			view = "redirect:asdetial.ad?sNum=" + sNum + "&page=1";
    		else {
    			for(String s : clist) {
    				if(!ilist.contains(s))
    					plist.add(s);
    			}
    			for(String s : ilist) {
    				if(!clist.contains(s))
    					mlist.add(s);
    			}
    		}
    		if(plist.size() > 0)
    			sponsorService.insertSContentImage(plist, sNum);
    		if(mlist.size() > 0)
    			sponsorService.deleteSponsorImage(mlist, sNum);
    	}
    	return view;
    }
    
    //파일 경로
    private String savePath(HttpServletRequest request) {
    	return request.getSession().getServletContext().getRealPath("resources/sponsor");
    }
    
    //썸네일 생성 & 저장
    private String makeThumnail(String savePath, String thumbName, File ofile) {
    	
    	SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
    	String ofileName = thumbName.substring(0, thumbName.lastIndexOf("."));
    	String fileExt = thumbName.substring(thumbName.lastIndexOf(".") + 1);
    	String refileName = ofileName + "-" + sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + fileExt;
    	
    	//변경할 파일 넒이, 높이
    	int newWidth = 560, newHeight = 400;
    	//W:넓이중싱, H:높이중심, X:설정한 수치로(비율무시)
    	String mainPosition = "X";
    	
    	Image image;
    	int imageWidth;
    	int imageHeight;
    	double ratio;
    	int w;
    	int h;
    	
    	try {
    		//원본 이미지 가져오기
    		image = ImageIO.read(ofile);
    		
    		//원본 이미지 사이즈 가져오기
    		imageWidth = image.getWidth(null);
    		imageHeight = image.getHeight(null);
    		
    		if(mainPosition.equals("W")){    // 넓이기준
    			 
                ratio = (double)newWidth/(double)imageWidth;
                w = (int)(imageWidth * ratio);
                h = (int)(imageHeight * ratio);
 
            }else if(mainPosition.equals("H")){ // 높이기준
 
                ratio = (double)newHeight/(double)imageHeight;
                w = (int)(imageWidth * ratio);
                h = (int)(imageHeight * ratio);
 
            }else{ //설정값 (비율무시) {
            	
            	w = newWidth;
            	h = newHeight;
            	
            }
    		
    		// 이미지 리사이즈
            // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
            // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
            // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
            // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
            // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
    		
    		Image resizeImage = image.getScaledInstance(w, h, Image.SCALE_SMOOTH);
    		
    		//새 이미지 저장하기
    		BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
    		Graphics g = newImage.getGraphics();
    		g.drawImage(resizeImage, 0, 0, null);
    		g.dispose();
    		ImageIO.write(newImage, fileExt, new File(savePath + "\\" + refileName));
    		
    		
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    	return refileName;
    	
    }
    
	@RequestMapping(value="sinsert.ad", method=RequestMethod.POST)
	public String insertSponsor(ModelAndView mv, Sponsor sponsor, 
			HttpServletRequest request, @RequestParam(name = "upfile", required = false) MultipartFile upfile) {
		sponsor.setsAmount(Integer.parseInt(request.getParameter("amount").replaceAll(",", "")));
		
		String savePath = savePath(request) + "/thumbnail";
		String thumbName = upfile.getOriginalFilename();
		sponsor.setsOriginal(thumbName);
		File ofile = new File(savePath + "\\" + thumbName);
		
		try {
			upfile.transferTo(ofile);
			sponsor.setsRename(makeThumnail(savePath, thumbName, ofile));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int result = sponsorService.insertSponsor(sponsor);
		int sNum = sponsorService.selectSNum();
		
		String view = "";
		if(result > 0) {
			//스케쥴러를 이용하기 위해 컨텐츠 이미지 테이블에 저장
			ArrayList<String> clist = new ArrayList<>();
			Pattern pattern = Pattern.compile("t/(.*?)\\r");
			Matcher matcher = pattern.matcher(sponsor.getsContent());
			while(matcher.find()) {
				clist.add(matcher.group(1));
			}
			sponsorService.insertSContentImage(clist, sNum);
			
			view = "redirect:asdetial.ad?sNum=" + sNum + "&page=1";
		}
		return view;
	}
	
	// 썸머노트 이미지 업로드 메서드
	@ResponseBody
	@RequestMapping(value="summer_image.ad", method=RequestMethod.POST)
	public void summer_image(MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		
		try {
		PrintWriter out = response.getWriter();
		String ofileName = file.getOriginalFilename();
		String savePath = savePath(request) + "/summernoteContent";
		
		Calendar c= Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int date = c.get(Calendar.DATE);
		
		int index = ofileName.lastIndexOf(".");
		String fileExt = ofileName.substring(index + 1).replaceAll("(\\p{Z}+|\\p{Z}+$)", "");
		ofileName = ofileName.substring(0, index);
		String refileName = ofileName + "-" + year + month + date + "." + fileExt;
		
		file.transferTo(new File(savePath + "/" + refileName));
		out.print("resources/sponsor/summernoteContent" + "/" + refileName);
		out.close();
		
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	//스케쥴러
	@Scheduled(cron="0 30 14 * 5 ?") //매주 금요일 오후 2시 30분
	public void checkContentFile() {
		String cFolder = "C:\\gaenasona_workspace\\runningdog\\src\\main\\webapp\\resources\\sponsor\\summernoteContent";
		
		ArrayList<String> list = sponsorService.selectImageList();
		ArrayList<String> del = new ArrayList<String>();
		
		//하위의 모든 파일
		for(File info : FileUtils.listFiles(new File(cFolder), TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE)) {
			String inFolder = info.getName(); //서버폴더에 저장된 파일명
			for(int i=0; i<list.size(); i++) {
				String realFile = list.get(i); //테이블에 저장된 파일명
				if(realFile.equals(inFolder))
					break;
				else if(!realFile.equals(inFolder) && i == list.size()-1)
					del.add(inFolder);
			}
		}
		
		for(String d : del) {
			if(new File(cFolder + "\\" + d).delete())
				logger.info(d + "파일 삭제 완료");
			else logger.info(d + "파일 삭제 실패");
		}
	}
	
	@RequestMapping("sdelete.ad")
	public String deleteSponsor(@RequestParam() int page, HttpServletRequest request, ArrayList<String> list, @RequestParam(value="ck", required=false) String ck) {
		
		String[] checkRow = null;
		if(ck == null)
			checkRow = request.getParameter("checkRow").split(",");
		else checkRow = request.getParameterValues("ck");
		
		ArrayList<Sponsor> delTh = sponsorService.selectThumb(checkRow);
		ArrayList<SponsorImage> delIm = sponsorService.selectImageList(checkRow);
		
		String savePathTh = savePath(request) + "\\thumbnail";
		String savePathIm = savePath(request) + "\\summernoteContent";
		
		int result = sponsorService.deleteSponsor(checkRow);
		
		String re = null;
		if(result > 0) {
			for(Sponsor image : delTh) {
				new File(savePathTh + "\\" + image.getsOriginal()).delete();
				new File(savePathTh + "\\" + image.getsRename()).delete();
			}
			for(SponsorImage image : delIm)
				new File(savePathIm + "\\" + image.getSiName()).delete();
			re = "redirect:aslist.ad?page=" + page;
		}
		return re;
	}
	
	@RequestMapping("ssearch.ad")
	public ModelAndView moveSponsorSearch(ModelAndView mv, HttpServletRequest request) {
		HashMap<String, String> key = new HashMap<>();
		key.put("selected", request.getParameter("selected"));
		key.put("keyword", request.getParameter("keyword"));
		
		ArrayList<Sponsor> list = sponsorService.selectSearch(key);
    	
		if(list.size() > -1) {
			mv.addObject("list", list);
			mv.addObject("page", 1);
			mv.addObject("totalList", list.size());
			mv.addObject("totalPage", 1);
			mv.addObject("startPage", 1);
			mv.addObject("endPage", 1);
			mv.setViewName("admin/userBoard/sponsorList");
		}
		return mv;
	}
	
	
	
	
	

//	admin.sponsor.controller	moveAdminSponsorList	aslist.ad	관리자용 후원 목록 출력
//	admin.sponsor.controller	moveAdminSponsorDetail	asdetial.ad	관리자용 후원 상세 뷰 출력
//	admin.sponsor.controller	moveSponsorWrite	aswrite.ad	관리자용 후원 글 쓰기 뷰 이동
//	admin.sponsor.controller	moveSponsorUpdateView	asupview.ad	관리자용 후원 글 수정 뷰 이동
//	admin.sponsor.controller	insertSponsor	sinsert.ad	관리자용 후원 글 쓰기
//	admin.sponsor.controller	updateSponsor	supdate.ad	관리자용 후원 글 수정
//	admin.sponsor.controller	deleteSponsor	sdelete.ad	관리자용 후원 글 삭제
	
	
	
	
	
	
	
	
}
