package com.fundee.pro;

import java.io.File;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fundee.pro.dao.FundeeDAO;
import com.fundee.pro.dto.FundeeDTO;
import com.fundee.pro.util.MyUtil;

@Controller
public class FundeeController {

	@Autowired
	@Qualifier("fundeeDAO")
	private FundeeDAO fundeeDAO;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "/")
	public String home() {
		return "index";
	}

	@RequestMapping(value = "/menu")
	public String menu() {
		return "menu";
	}
	
	
	@RequestMapping(value = "/created.do" , method = RequestMethod.GET)	
	public String Fundee(HttpServletRequest req) throws Exception {
		return "posts_created";
	}
	

	// 상품 등록 처리
	@RequestMapping(value = "/created_ok.do", method = RequestMethod.POST)
	public String created_ok(FundeeDTO dto, @RequestParam(value = "upload", required = false) MultipartFile mf,
	        HttpServletRequest request) throws Exception {

		//상품등록시 목표금액과 현재모금액에 초기값이 필요하기때문에 1번 메소드가 필요함
		 // 1. 목표 금액과 현재 모금액 필드 처리
        String goalAmountStr = request.getParameter("goalAmount");
        String currentAmountStr = request.getParameter("currentAmount");
        
        // 빈 문자열이거나 null일 경우 0으로 변환
        int goalAmount = 0;
        int currentAmount = 0;
        
        try {
            if (goalAmountStr != null && !goalAmountStr.isEmpty()) {
                goalAmount = Integer.parseInt(goalAmountStr);
            }

            if (currentAmountStr != null && !currentAmountStr.isEmpty()) {
                currentAmount = Integer.parseInt(currentAmountStr);
            }
        } catch (NumberFormatException e) {
            // 숫자 변환 실패 시 예외 처리
            throw new IllegalArgumentException("목표 금액과 현재 모금액은 올바른 숫자 형식이어야 합니다.");
        }
        
        dto.setGoalAmount(goalAmount);
        dto.setCurrentAmount(currentAmount);		
		
	    // 서버 측 유효성 검사
	    if (dto.getTitle() == null || dto.getTitle().trim().isEmpty()) {
	        throw new IllegalArgumentException("상품 제목은 필수 입력 항목입니다.");
	    }
	    
	    
	    // 파일 업로드 메소드
	    String root = request.getSession().getServletContext().getRealPath("/");
	    String savePath = root + "resources" + File.separator + "uploads";

	    if (mf != null && !mf.isEmpty()) {
	        File saveFile = new File(savePath, mf.getOriginalFilename());
	        mf.transferTo(saveFile);
	        dto.setImageFile(mf.getOriginalFilename());
	    } else {
	        dto.setImageFile(""); // 파일이 없는 경우 빈 문자열로 설정
	    }

	    // DTO를 사용하여 데이터베이스에 데이터 삽입
	    fundeeDAO.insertData(dto);

	    // 성공 시 리스트 페이지로 이동
	    return "redirect:/posts_list.do";
	}

	@RequestMapping(value = {"/posts_list.do","list.do"})
	public ModelAndView getLists(HttpServletRequest req,
								@RequestParam(defaultValue = "") String searchKey,
								@RequestParam(defaultValue = "") String searchValue) throws Exception {
		
		String pageNum = req.getParameter("pageNum");
		
		int currentPage = (pageNum != null && !pageNum.equals("")) ?
				Integer.parseInt(pageNum) : 1;
				
		int dataCount = fundeeDAO.getDataCount(searchKey, searchValue);
		
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage) currentPage = totalPage;
		
		int start = (currentPage-1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<FundeeDTO> lists = fundeeDAO.getLists(start, end, searchKey, searchValue);
		
		String param = "";
		if(searchValue != null && !searchValue.equals("")){
			param = "searchKey=" + searchKey + "&searchValue=" + searchValue + "&";
		}

		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, "posts_list.do?"+ param);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.addObject("pageIndexList", pageIndexList);
		mav.addObject("pageNum", currentPage);
		
		mav.setViewName("posts_list");
		return mav;
	}

	// 게시물 상세 페이지
	@RequestMapping(value = "/article.do", method = RequestMethod.GET)
	public ModelAndView article(@RequestParam int postsNum) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		//조회수 증가
		fundeeDAO.updateHitCount(postsNum);
		
		// 상품 상세 데이터 가져오기
		FundeeDTO dto = fundeeDAO.getReadData(postsNum);
		
		// 모델에 데이터 추가
		if (dto != null) {
			fundeeDAO.updateHitCount(postsNum);
			mav.addObject("dto", dto);
			mav.setViewName("posts_article");
		} else {
			// 게시물이 없을 경우 처리
			mav.setViewName("redirect:/posts_list.do");
		}
		return mav;
	}

	// 수정 폼으로 이동
	@RequestMapping(value = "/updated.do", method = RequestMethod.GET)
	public ModelAndView updated(@RequestParam int postsNum) throws Exception {
		ModelAndView mav = new ModelAndView();
		FundeeDTO dto = fundeeDAO.getReadData(postsNum);
		mav.addObject("dto", dto);
		mav.setViewName("posts_updated");
		return mav;
	}
	
	// 수정 처리
	@RequestMapping(value = "/updated_ok.do", method = RequestMethod.POST)
	public String updated_ok(FundeeDTO dto, @RequestParam(value = "upload", required = false) MultipartFile mf, HttpServletRequest request) throws Exception {

	    // 1. 목표 금액과 현재 모금액 필드 처리
        String goalAmountStr = request.getParameter("goalAmount");
        String currentAmountStr = request.getParameter("currentAmount");
        
        // 빈 문자열이거나 null일 경우 0으로 변환
        int goalAmount = 0;
        int currentAmount = 0;
        
        try {
            if (goalAmountStr != null && !goalAmountStr.isEmpty()) {
                goalAmount = Integer.parseInt(goalAmountStr);
            }

            if (currentAmountStr != null && !currentAmountStr.isEmpty()) {
                currentAmount = Integer.parseInt(currentAmountStr);
            }
        } catch (NumberFormatException e) {
            // 숫자 변환 실패 시 예외 처리
            throw new IllegalArgumentException("목표 금액과 현재 모금액은 올바른 숫자 형식이어야 합니다.");
        }
        
        dto.setGoalAmount(goalAmount);
        dto.setCurrentAmount(currentAmount);
		
		
		//파일 수정 시 필요한 메소드
	    String root = request.getSession().getServletContext().getRealPath("/");
	    String savePath = root + "resources" + File.separator + "uploads";

	    if (mf != null && !mf.isEmpty()) {
	        // 기존 파일 삭제
	        String existingImageFile = request.getParameter("existingImageFile");
	        if (existingImageFile != null && !existingImageFile.isEmpty()) {
	            File oldFile = new File(savePath, existingImageFile);
	            if (oldFile.exists()) {
	                oldFile.delete();
	            }
	        }

	        // 새로운 파일 저장
	        String originalFileName = mf.getOriginalFilename();
	        String saveFileName = System.currentTimeMillis() + "_" + originalFileName;
	        File saveFile = new File(savePath, saveFileName);
	        mf.transferTo(saveFile);
	        dto.setImageFile(saveFileName);
	    } else {
	        // 새로운 파일이 없으면 기존 파일명 유지
	        dto.setImageFile(request.getParameter("existingImageFile"));
	    }

	    fundeeDAO.updateData(dto);

	    return "redirect:/article.do?postsNum=" + dto.getPostsNum();
	}

	// 게시물 삭제
	@RequestMapping(value = "/deleted.do", method = RequestMethod.GET)
	public String deleted(@RequestParam int postsNum, HttpServletRequest request) throws Exception {
	    
	    // 파일도 함께 삭제
	    FundeeDTO dto = fundeeDAO.getReadData(postsNum);
	    if (dto != null && dto.getImageFile() != null && !dto.getImageFile().isEmpty()) {
	        String root = request.getSession().getServletContext().getRealPath("/");
	        String savePath = root + "resources" + File.separator + "uploads";
	        File file = new File(savePath, dto.getImageFile());
	        if (file.exists()) {
	            file.delete();
	        }
	    }
	    
	    fundeeDAO.deleteData(postsNum);
	    
	    return "redirect:/posts_list.do";
	}
	
	@RequestMapping(value = "/deleted_ok.action", method = RequestMethod.GET)
	public String deleted_ok(@RequestParam int postsNum) throws Exception {
		
		fundeeDAO.deleteData(postsNum);
		
		return "redirect:/posts_list.do";
	}
}