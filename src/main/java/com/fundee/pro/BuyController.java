package com.fundee.pro;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//JSP연결하는곳이야 여기는

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fundee.dao.BuyDAO;
import com.fundee.dao.PostsDAO;
import com.fundee.dto.BuyListDTO;
import com.fundee.dto.PostsDTO;
import com.fundee.mapper.BuyMapper;
import com.fundee.util.MyUtil;


@Controller
@RequestMapping("/")
public class BuyController {
	
	@Autowired
	private BuyMapper buyMapper;
	
	@Autowired
	PostsDAO postsDAO;
	
	@Autowired
	BuyDAO buyDAO;
	
	
	
	//구매 get
	//구매누르면 결제창 나오는거 DB저장 된거 출력되어야 하는 창, 
	@RequestMapping(value = "/buyForm", method = RequestMethod.GET)
	public String buyForm(int posts_num, Model model, HttpServletRequest req) throws Exception {
		
		/* 임의로 넣는 테스트
		buyListDTO.setId("test");
		buyListDTO.setName("테스트");
		buyListDTO.setTitle("국밥");
		buyListDTO.setBuyPrice(15000);
		buyListDTO.setBuyNumber(0);
		
		buyListDTO.setTotalPrice(buyListDTO.getBuyPrice()*
				buyListDTO.getQty());
		*/
			
		HttpSession session = req.getSession();
		
		if (session.getAttribute("loginId")==null) {
			return "redirect:/posts_list.do";
		}
		
		
		model.addAttribute("dto",postsDAO.getReadData(posts_num));
		return "buyForm";//buyForm.jsp(결제창)으로 이동
	}
	
	
	//구매 post
	//결제하시겠습니까 나왔을때 결제 성공, 실패 메세지
	@RequestMapping(value = "/buyForm", method = RequestMethod.POST)
	public String buyData(@ModelAttribute BuyListDTO buyListDTO,
			Model model) {
		
		try {
			
			buyMapper.insertData(buyListDTO);//인서트 데이터 작동 및 저장

			
//	------- posts의 테이블 업데이트 로직 추가 ---------
		
		PostsDTO postsDTO = postsDAO.getReadData(buyListDTO.getPosts_num());
		
		//총모금액
		int newCurrent = postsDTO.getCurrent_amount() + buyListDTO.getTotalPrice();
		int newStatus = 0;
		
		//status 계싼
		if(postsDTO.getGoal_amount()>0) {
			newStatus = (int)(((double)newCurrent/postsDTO
					.getGoal_amount())*100);
		} else {
			newStatus = 0;
		}
		
		//postsDTO에 데이터 저장할 거 셋팅
		postsDTO.setCurrent_amount(newCurrent);
		postsDTO.setStatus(String.valueOf(newStatus));
		
		
		//posts 테이블에 저장해
		postsDAO.updateData(postsDTO);
		
//		----------------  ↑여기까지 추가 --------------
			
			
			model.addAttribute("dto",buyListDTO); //전달해야할 내용
			
			//데이터를 유지하여 공유하기 위해 포워드 방식으로 변경
			//포워드 방식 : 이전 데이터를 받아와서 유지하는 방식
			return "buyOk"; //buyOk.jsp(구매완료) 페이지로 이동
			
		} catch (Exception e) {
			e.printStackTrace();
			return "buyForm"; // 취소시 페이지 이동안함
		}
	}
		
	
	/*구매완료 get
	//구매완료페이지(수량저장 및 방금구매한건 보여줌)
	@RequestMapping(value = "/buyOk", method = RequestMethod.GET)
	public String buyOk(@ModelAttribute("dto") BuyListDTO dto,
							Model model) { //jsp에 넘겨야 하는것
	
		model.addAttribute("dto",dto);
		return "buyOk";
	}
*/

	
	
	//전체 구매리스트
	//나의 정보에서 확인 가능한 부분
	//구매내역을 조회하는 것은 데이터를 받아오는 것이기 때문에 get을 써야함
	//사용자가 페이지에 접근하기 위해서 get을 써서 url 접속
	@RequestMapping(value = "/buyListOk", method = RequestMethod.GET)
	public String buyOkAll(Model model, HttpServletRequest req)
	throws Exception{
		
		//세션가져와
		HttpSession session = req.getSession();
		
		//로그인한 아이디 가져와서 로그인 안되어 있으면 포스츠로가
		if(session.getAttribute("loginId")==null) {
			return "redirect:/posts_list.do";
		}
		
		String id = (String)session.getAttribute("loginId");
		
		//id로 찾은 구매내역을 list로 저장해
		List<BuyListDTO> buyListOk = buyDAO.getBuyListAll(id);
				
		//모델에 담아서 jsp로 전달할 데이터
		model.addAttribute("buyListOk", buyListOk);			
		model.addAttribute("id", id);
				
		return "buyListOk";
	}
	

	@RequestMapping(value = "/buyListOk", method = RequestMethod.POST)
	public String buyListAll(Model model, HttpServletRequest req) 
	throws Exception{ //jsp에 넘겨야 하는것

		
		HttpSession session = req.getSession();
		
		//세션 통해서 로그인 아이디 가져와서
		//로그인이 안되었을경우 로그인페이지로 넘어가
		if(session.getAttribute("loginId")==null) {
			return "redirect:/posts_list.do";
		}
		
/*		---------------------------------------------------
		String pageNumStr = req.getParameter("pageNum");
		
		int currentPage = 1;
		if(pageNumStr != null && !pageNumStr.isEmpty()) {
			currentPage = Integer.parseInt(pageNumStr);
		}
		
		String id = (String) session.getAttribute("loginId");
		
		int dataCount = buyDAO.getBuyDataCount(id);
		
		int numPerPage = 10;
		
		//객체 생성해서 사용하기
		MyUtil myUtil = new MyUtil();
		int totalPage = myUtil.getPagecount(numPerPage, dataCount);
		
		if(currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<BuyListDTO> buyListOk = buyDAO.getBuyListAll(id, start, end);
	*/	
		
		//로긴한 사람 id 가져와
		String id = (String)session.getAttribute("loginId");
		List<BuyListDTO> buyListOk = buyDAO.getBuyListAll(id);
		
	//	String listUrl = req.getContextPath();
		
		model.addAttribute("buyListOk", buyListOk);
		model.addAttribute("id", id);
		
		return "buyListOk";
	} 
	
	

	
	
}
