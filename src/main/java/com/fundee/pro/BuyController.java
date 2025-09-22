package com.fundee.pro;

//JSP연결하는곳이야 여기는

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fundee.pro.dto.BuyListDTO;
import com.fundee.pro.mapper.BuyMapper;

@Controller
@RequestMapping("/")
public class BuyController {
	
@Autowired
private BuyMapper buyMapper;

//구매 get
//구매누르면 결제창 나오는거 DB저장 된거 출력되어야 하는 창, 
@RequestMapping(value = "/buyForm", method = RequestMethod.GET)
public String buyForm(@ModelAttribute BuyListDTO buyListDTO,
		Model model) {
	
	/* 임의로 넣는 테스트
	buyListDTO.setId("test");
	buyListDTO.setName("테스트");
	buyListDTO.setTitle("국밥");
	buyListDTO.setBuyPrice(15000);
	buyListDTO.setBuyNumber(0);
	
	buyListDTO.setTotalPrice(buyListDTO.getBuyPrice()*
			buyListDTO.getQty());
	*/
	
		
	model.addAttribute("dto",buyListDTO);
	return "buyForm";//buyForm.jsp(결제창)으로 이동
}


//구매 post
//결제하시겠습니까 나왔을때 결제 성공, 실패 메세지
@RequestMapping(value = "/buyForm", method = RequestMethod.POST)
public String buyData(@ModelAttribute BuyListDTO buyListDTO,
		Model model) {
	
	try {
		
		buyMapper.insertData(buyListDTO);//인서트 데이터 작동 및 저장
		
		model.addAttribute("dto",buyListDTO); //전달해야할 내용
		
		return "redirect:/buyOk"; //buyOk.jsp(구매완료) 페이지로 이동
		
	} catch (Exception e) {
		e.printStackTrace();
		return "buyForm"; // 취소시 페이지 이동안함
	}
}
	

//구매완료 get
//구매완료페이지(수량저장 및 방금구매한건 보여줌)
@RequestMapping(value = "/buyOk", method = RequestMethod.GET)
public String buyOk(@ModelAttribute("buyInfo") BuyListDTO dto,
						Model model) { //jsp에 넘겨야 하는것

	model.addAttribute("dto",dto);	
	return "buyOk";
}


}

