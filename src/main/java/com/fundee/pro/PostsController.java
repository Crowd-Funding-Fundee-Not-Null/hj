package com.fundee.pro;

import java.io.File;
import java.sql.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fundee.dao.PostsDAO;
import com.fundee.dto.LoginDTO;
import com.fundee.dto.PostsDTO;
import com.fundee.util.MyUtil;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class PostsController {

	@Autowired
	private PostsDAO postsDAO;

	@Autowired
	private MyUtil myUtil;
	// 상품 등록 메소드
	@RequestMapping(value = "/created.do" , method = RequestMethod.GET)
	public String Fundee(HttpServletRequest req, HttpSession session) throws Exception {
	    // 관리자만 상품 등록을 할 수 있게 체킹하는 코딩
	    LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
	    if (user == null || user.getRole() != 1) {
	        return "redirect:/posts_list.do"; // 관리자가 아니면 상품 리스트 창으로 돌아감
	    }
	    return "posts_created";
	}
	//상품 등록처리할 때 필요한 메소드 목록 이미지는 upload, 상세페이지 이미지는 detail_upload로 값 받음
	//MultipartFile을 사용함으로써 스프링에서 파일 업로드를 할 수 있게 함
	@RequestMapping(value = "/created_ok.do", method = RequestMethod.POST)
	public String created_ok(PostsDTO dto, 
	                        @RequestParam(value = "upload", required = false) MultipartFile listImageFile,
	                        @RequestParam(value = "detail_upload", required = false) MultipartFile detailImageFile,
	                        HttpServletRequest request,HttpSession session) throws Exception {
		
		//관리자 로그인했을 때 상품 등록후 목록창 띄우는 코딩
		LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
	    if (user == null || user.getRole() != 1) {
	        return "redirect:/posts_list.do";
	    }
		
	    // 이 코딩을 쓴 이유는 dto에 있는 MultipartFile로 선언된 upload와 detail_upload 가있기 때문에 dto에 연결하는
	    //과정에서 파일 데이터를 자동으로 채우려하는데 문제는 @RequestParam으로 파일을 이미 받아 충돌이 발생할 수 있음
	    //그래서 null로 초기화해줌
	    dto.setUpload(null);
	    dto.setDetail_upload(null);
	    
	    // 파일명 필드도 명시적으로 초기화
	    dto.setImage_file("");
	    dto.setDetail_imagefile("");
	    
	    // 목표금액 처리
	    String goal_amountStr = request.getParameter("goal_amount");
	    String current_amountStr = request.getParameter("current_amount");
	    //초기 금액 0으로 초기화
	    int goal_amount = 0;
	    int current_amount = 0;
	    
	    //목표 금액과 현재 모금액 잘못 입력 시 체킹하는 코딩 
	    try {
	        if (goal_amountStr != null && !goal_amountStr.isEmpty()) {
	            goal_amount = Integer.parseInt(goal_amountStr);
	        }
	        if (current_amountStr != null && !current_amountStr.isEmpty()) {
	            current_amount = Integer.parseInt(current_amountStr);
	        }
	    } catch (NumberFormatException e) {
	        throw new IllegalArgumentException("목표 금액과 현재 모금액은 올바른 숫자 형식이어야 합니다.");
	    }
	    
	    dto.setGoal_amount(goal_amount);
	    dto.setCurrent_amount(current_amount);
	    
	    //파일 경로 찾아서 파일 업로드 및 파일 디렉토리 형성
	    String root = request.getSession().getServletContext().getRealPath("/");
	    String savePath = root + "resources" + File.separator + "uploads";
	    File dir = new File(savePath);
	    if (!dir.exists()) dir.mkdirs();

	    // 목록 이미지 처리 (listImageFile → image_file)
	    if (listImageFile != null && !listImageFile.isEmpty()) {
	        String originalFileName = listImageFile.getOriginalFilename();
	        //다른 사용자가 파일 등록시 중복방지를 위한 파일업로드시간 +  _LIST_ 원래파일명 형식으로 나옴
	        String saveFileName = System.currentTimeMillis() + "_LIST_" + originalFileName;
	        File saveFile = new File(savePath, saveFileName);
	        listImageFile.transferTo(saveFile);
	        dto.setImage_file(saveFileName);
	    }

	    // 잠시 대기 (타임스탬프 중복 방지- 동시간대 들어오는 사용자들이 잇을 수 있으니 에러처리)
	    try { Thread.sleep(50); } catch (InterruptedException e) {}

	    // 상세 이미지 처리 (detailImageFile → detail_imagefile)
	    if (detailImageFile != null && !detailImageFile.isEmpty()) {
	        String originalDetailFileName = detailImageFile.getOriginalFilename();
	        String saveDetailFileName = System.currentTimeMillis() + "_DETAIL_" + originalDetailFileName;
	        File saveDetailFile = new File(savePath, saveDetailFileName);
	        detailImageFile.transferTo(saveDetailFile);
	        dto.setDetail_imagefile(saveDetailFileName);
	    }

	    // 파일 필드 검증-> 업로드된 파일이 없을 경우 발생하는 null값을 빈 문자열로 초기화
	    if (dto.getImage_file() == null) dto.setImage_file("");
	    if (dto.getDetail_imagefile() == null) dto.setDetail_imagefile("");
	    
	    postsDAO.insertData(dto);
	    
	    return "redirect:/posts_list.do";
	}
	// 상품 목록에서 페이징 처리
	// defaultValue = ""는 searchKey,searchValue값을 못가져올 경우 빈문자열로 처리함
	@RequestMapping(value = {"/posts_list.do","list.do"})
	public ModelAndView getLists(HttpServletRequest req,
								@RequestParam(defaultValue = "") String searchKey,
								@RequestParam(defaultValue = "") String searchValue) throws Exception {
		
		String pageNum = req.getParameter("pageNum");
		
		int currentPage = (pageNum != null && !pageNum.equals("")) ?
				Integer.parseInt(pageNum) : 1;
				
		int dataCount = postsDAO.getDataCount(searchKey, searchValue);
		// 상품 목록창에 한 페이지당 9개가 들어가게 설정함
		int numPerPage = 16;
		int numPerBlock = 5;
		
		int totalPage = myUtil.getPagecount(numPerPage, dataCount);
		
		if(currentPage > totalPage) currentPage = totalPage;
		
		int start = (currentPage-1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<PostsDTO> lists = postsDAO.getLists(start, end, searchKey, searchValue);
		
		String param = "";
		if(searchValue != null && !searchValue.equals("")){
			param = "searchKey=" + searchKey + "&searchValue=" + searchValue + "&";
		}

		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, numPerBlock, "posts_list.do?"+ param);
		//mav 객체에 페이징과 데이터가 담겨진 lists를 넘겨줌
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.addObject("pageIndexList", pageIndexList);
		mav.addObject("pageNum", currentPage);
		
		mav.setViewName("posts_list");
		return mav;
	}

	// 게시물 상세 페이지
	// 상품번호를 통해 상품 클릭시 그 상품에 대한 데이터 가져오는 메소드
	@RequestMapping(value = "/article.do", method = RequestMethod.GET)
	public ModelAndView article(@RequestParam int posts_num) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		PostsDTO dto = postsDAO.getReadData(posts_num);
		
		if (dto != null) {
			postsDAO.updateHitCount(posts_num);
			mav.addObject("dto", dto);
			mav.setViewName("posts_article");
		} else {
			mav.setViewName("redirect:/posts_list.do");
		}
		return mav;
	}

	// 수정 폼으로 이동
	@RequestMapping(value = "/updated.do", method = RequestMethod.GET)
	public ModelAndView updated(@RequestParam int posts_num, HttpSession session) throws Exception {
		
		 // 관리자 권한 확인
	    LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
	    if (user == null || user.getRole() != 1) {
	        // 권한이 없으면 목록 페이지로 리다이렉트
	        return new ModelAndView("redirect:/posts_list.do");
	    }

		ModelAndView mav = new ModelAndView();
		PostsDTO dto = postsDAO.getReadData(posts_num);
		mav.addObject("dto", dto);
		mav.setViewName("posts_updated");
		return mav;
	}
	
	// 수정 처리 부분에서 파일 업로드 코딩 
	@RequestMapping(value = "/updated_ok.do", method = RequestMethod.POST)
	public String updated_ok(PostsDTO dto, 
	                        @RequestParam(value = "upload", required = false) MultipartFile listImageFile,  // 변수명 통일
	                        @RequestParam(value = "detail_upload", required = false) MultipartFile detailImageFile,  // 변수명 통일
	                        HttpServletRequest request, HttpSession session) throws Exception {
		
		
				//관리자 로그인했을 때 상품 수정후 목록창 띄우는 코딩
				LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
			    if (user == null || user.getRole() != 1) {
			        // If not an admin, redirect them to the product list or a forbidden page
			        return "redirect:/posts_list.do";
			    }
		

	    // 1. 목표 금액, 현재 모금액 숫자 변환
	    String goal_amountStr = request.getParameter("goal_amount");
	    String current_amountStr = request.getParameter("current_amount");
	    
	    int goal_amount = 0;
	    int current_amount = 0;
	    
	    try {
	        if (goal_amountStr != null && !goal_amountStr.isEmpty()) {
	            goal_amount = Integer.parseInt(goal_amountStr);
	        }
	        if (current_amountStr != null && !current_amountStr.isEmpty()) {
	            current_amount = Integer.parseInt(current_amountStr);
	        }
	    } catch (NumberFormatException e) {
	        throw new IllegalArgumentException("목표 금액과 현재 모금액은 올바른 숫자 형식이어야 합니다.");
	    }
	    
	    dto.setGoal_amount(goal_amount);
	    dto.setCurrent_amount(current_amount);

	    // 2. 기존 데이터 가져오기 (기존 데이터를 검색 후 이전 이미지 파일의 이름을 저장하는 코딩)
	    PostsDTO existingDto = postsDAO.getReadData(dto.getPosts_num());
	    
	    // 3. 파일 저장 경로
	    String root = request.getSession().getServletContext().getRealPath("/");
	    String savePath = root + "resources" + File.separator + "uploads";
	    File dir = new File(savePath);
	    if (!dir.exists()) dir.mkdirs();

	    // 4. 목록 이미지 파일 처리 (listImageFile → image_file)
	    if (listImageFile != null && !listImageFile.isEmpty()) {
	        // 기존 파일 삭제
	        if (existingDto != null && existingDto.getImage_file() != null && !existingDto.getImage_file().isEmpty()) {
	            File oldFile = new File(savePath, existingDto.getImage_file());
	            if (oldFile.exists()) oldFile.delete();
	        }
	        
	        // 새 파일 저장 코딩
	        String originalFileName = listImageFile.getOriginalFilename();
	        String saveFileName = System.currentTimeMillis() + "_LIST_" + originalFileName;
	        File saveFile = new File(savePath, saveFileName);
	        listImageFile.transferTo(saveFile);
	        dto.setImage_file(saveFileName);
	    } else {
	        // 새 파일이 없으면 기존 파일명 유지
	        if (existingDto != null) {
	            dto.setImage_file(existingDto.getImage_file());
	        }
	    }

	    // 잠시 대기 (타임스탬프 중복 방지)
	    try { Thread.sleep(50); } catch (InterruptedException e) {}

	    // 5. 상세 이미지 파일 처리 (detailImageFile → detail_imagefile)
	    if (detailImageFile != null && !detailImageFile.isEmpty()) {
	        // 기존 상세 파일 삭제
	        if (existingDto != null && existingDto.getDetail_imagefile() != null && !existingDto.getDetail_imagefile().isEmpty()) {
	            File oldDetailFile = new File(savePath, existingDto.getDetail_imagefile());
	            if (oldDetailFile.exists()) oldDetailFile.delete();
	        }
	        
	        // 새 상세 파일 저장
	        String originalDetailFileName = detailImageFile.getOriginalFilename();
	        String saveDetailFileName = System.currentTimeMillis() + "_DETAIL_" + originalDetailFileName;
	        File saveDetailFile = new File(savePath, saveDetailFileName);
	        detailImageFile.transferTo(saveDetailFile);
	        dto.setDetail_imagefile(saveDetailFileName);
	       
	    } else {
	        // 새 파일이 없으면 기존 파일명 유지
	        if (existingDto != null) {
	            dto.setDetail_imagefile(existingDto.getDetail_imagefile());
	        }
	    }

	    // 6. DB 업데이트
	    postsDAO.updateData(dto);

	    // 7. 상세 페이지로 리다이렉트
	    return "redirect:/article.do?posts_num=" + dto.getPosts_num();
	}

	// 게시물 삭제
	@RequestMapping(value = "/deleted.do", method = RequestMethod.GET)
	public String deleted(@RequestParam int posts_num, HttpServletRequest request, HttpSession session) throws Exception {
		
		//관리자 로그인했을 때 상품 삭제후 목록창 띄우는 코딩
	    LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
	    if (user == null || user.getRole() != 1) {
	        // 관리자가 아니면 리다이렉트
	        return "redirect:/posts_list.do";
	    }
		//관리자면 원래 로직 수행		
		PostsDTO dto = postsDAO.getReadData(posts_num);
		
		// 메인 이미지 파일 삭제
		if (dto != null && dto.getImage_file() != null && !dto.getImage_file().isEmpty()) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "resources" + File.separator + "uploads";
			File file = new File(savePath, dto.getImage_file());
			if (file.exists()) {
				file.delete();
			}
		}
		
		// 상세 이미지 파일 삭제
		if (dto != null && dto.getDetail_imagefile() != null && !dto.getDetail_imagefile().isEmpty()) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "resources" + File.separator + "uploads";
			File file = new File(savePath, dto.getDetail_imagefile());
			if (file.exists()) {
				file.delete();
			}
		}
		
		postsDAO.deleteData(posts_num);
		
		return "redirect:/posts_list.do";
	}
	
	@RequestMapping(value = "/deleted_ok.action", method = RequestMethod.GET)
	public String deleted_ok(@RequestParam int posts_num) throws Exception {
		postsDAO.deleteData(posts_num);
		return "redirect:/posts_list.do";
	}
	
	@RequestMapping(value = {"/index.do", "/"})
	public ModelAndView index() throws Exception {
	    ModelAndView mav = new ModelAndView();

	    // 추천 상품 4개 조회
	    List<PostsDTO> recommendedProducts = postsDAO.getRecommendedProducts(); 

	    mav.addObject("recommendedProducts", recommendedProducts);
	    mav.setViewName("index");
	    return mav;
	}
	
	
}