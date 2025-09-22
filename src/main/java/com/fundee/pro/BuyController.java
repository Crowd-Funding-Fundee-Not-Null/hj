package com.fundee.pro;

//JSP�����ϴ°��̾� �����

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

//���� get
//���Ŵ����� ����â �����°� DB���� �Ȱ� ��µǾ�� �ϴ� â, 
@RequestMapping(value = "/buyForm", method = RequestMethod.GET)
public String buyForm(@ModelAttribute BuyListDTO buyListDTO,
		Model model) {
	
	/* ���Ƿ� �ִ� �׽�Ʈ
	buyListDTO.setId("test");
	buyListDTO.setName("�׽�Ʈ");
	buyListDTO.setTitle("����");
	buyListDTO.setBuyPrice(15000);
	buyListDTO.setBuyNumber(0);
	
	buyListDTO.setTotalPrice(buyListDTO.getBuyPrice()*
			buyListDTO.getQty());
	*/
	
		
	model.addAttribute("dto",buyListDTO);
	return "buyForm";//buyForm.jsp(����â)���� �̵�
}


//���� post
//�����Ͻðڽ��ϱ� �������� ���� ����, ���� �޼���
@RequestMapping(value = "/buyForm", method = RequestMethod.POST)
public String buyData(@ModelAttribute BuyListDTO buyListDTO,
		Model model) {
	
	try {
		
		buyMapper.insertData(buyListDTO);//�μ�Ʈ ������ �۵� �� ����
		
		model.addAttribute("dto",buyListDTO); //�����ؾ��� ����
		
		return "redirect:/buyOk"; //buyOk.jsp(���ſϷ�) �������� �̵�
		
	} catch (Exception e) {
		e.printStackTrace();
		return "buyForm"; // ��ҽ� ������ �̵�����
	}
}
	

//���ſϷ� get
//���ſϷ�������(�������� �� ��ݱ����Ѱ� ������)
@RequestMapping(value = "/buyOk", method = RequestMethod.GET)
public String buyOk(@ModelAttribute("buyInfo") BuyListDTO dto,
						Model model) { //jsp�� �Ѱܾ� �ϴ°�

	model.addAttribute("dto",dto);	
	return "buyOk";
}


}

