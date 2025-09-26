package com.fundee.pro;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//JSP�����ϴ°��̾� �����

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
	
	
	
	//���� get
	//���Ŵ����� ����â �����°� DB���� �Ȱ� ��µǾ�� �ϴ� â, 
	@RequestMapping(value = "/buyForm", method = RequestMethod.GET)
	public String buyForm(int posts_num, Model model, HttpServletRequest req) throws Exception {
		
		/* ���Ƿ� �ִ� �׽�Ʈ
		buyListDTO.setId("test");
		buyListDTO.setName("�׽�Ʈ");
		buyListDTO.setTitle("����");
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
		return "buyForm";//buyForm.jsp(����â)���� �̵�
	}
	
	
	//���� post
	//�����Ͻðڽ��ϱ� �������� ���� ����, ���� �޼���
	@RequestMapping(value = "/buyForm", method = RequestMethod.POST)
	public String buyData(@ModelAttribute BuyListDTO buyListDTO,
			Model model) {
		
		try {
			
			buyMapper.insertData(buyListDTO);//�μ�Ʈ ������ �۵� �� ����

			
//	------- posts�� ���̺� ������Ʈ ���� �߰� ---------
		
		PostsDTO postsDTO = postsDAO.getReadData(buyListDTO.getPosts_num());
		
		//�Ѹ�ݾ�
		int newCurrent = postsDTO.getCurrent_amount() + buyListDTO.getTotalPrice();
		int newStatus = 0;
		
		//status ���
		if(postsDTO.getGoal_amount()>0) {
			newStatus = (int)(((double)newCurrent/postsDTO
					.getGoal_amount())*100);
		} else {
			newStatus = 0;
		}
		
		//postsDTO�� ������ ������ �� ����
		postsDTO.setCurrent_amount(newCurrent);
		postsDTO.setStatus(String.valueOf(newStatus));
		
		
		//posts ���̺� ������
		postsDAO.updateData(postsDTO);
		
//		----------------  �迩����� �߰� --------------
			
			
			model.addAttribute("dto",buyListDTO); //�����ؾ��� ����
			
			//�����͸� �����Ͽ� �����ϱ� ���� ������ ������� ����
			//������ ��� : ���� �����͸� �޾ƿͼ� �����ϴ� ���
			return "buyOk"; //buyOk.jsp(���ſϷ�) �������� �̵�
			
		} catch (Exception e) {
			e.printStackTrace();
			return "buyForm"; // ��ҽ� ������ �̵�����
		}
	}
		
	
	/*���ſϷ� get
	//���ſϷ�������(�������� �� ��ݱ����Ѱ� ������)
	@RequestMapping(value = "/buyOk", method = RequestMethod.GET)
	public String buyOk(@ModelAttribute("dto") BuyListDTO dto,
							Model model) { //jsp�� �Ѱܾ� �ϴ°�
	
		model.addAttribute("dto",dto);
		return "buyOk";
	}
*/

	
	
	//��ü ���Ÿ���Ʈ
	//���� �������� Ȯ�� ������ �κ�
	//���ų����� ��ȸ�ϴ� ���� �����͸� �޾ƿ��� ���̱� ������ get�� �����
	//����ڰ� �������� �����ϱ� ���ؼ� get�� �Ἥ url ����
	@RequestMapping(value = "/buyListOk", method = RequestMethod.GET)
	public String buyOkAll(Model model, HttpServletRequest req)
	throws Exception{
		
		//���ǰ�����
		HttpSession session = req.getSession();
		
		//�α����� ���̵� �����ͼ� �α��� �ȵǾ� ������ �������ΰ�
		if(session.getAttribute("loginId")==null) {
			return "redirect:/posts_list.do";
		}
		
		String id = (String)session.getAttribute("loginId");
		
		//id�� ã�� ���ų����� list�� ������
		List<BuyListDTO> buyListOk = buyDAO.getBuyListAll(id);
				
		//�𵨿� ��Ƽ� jsp�� ������ ������
		model.addAttribute("buyListOk", buyListOk);			
		model.addAttribute("id", id);
				
		return "buyListOk";
	}
	

	@RequestMapping(value = "/buyListOk", method = RequestMethod.POST)
	public String buyListAll(Model model, HttpServletRequest req) 
	throws Exception{ //jsp�� �Ѱܾ� �ϴ°�

		
		HttpSession session = req.getSession();
		
		//���� ���ؼ� �α��� ���̵� �����ͼ�
		//�α����� �ȵǾ������ �α����������� �Ѿ
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
		
		//��ü �����ؼ� ����ϱ�
		MyUtil myUtil = new MyUtil();
		int totalPage = myUtil.getPagecount(numPerPage, dataCount);
		
		if(currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<BuyListDTO> buyListOk = buyDAO.getBuyListAll(id, start, end);
	*/	
		
		//�α��� ��� id ������
		String id = (String)session.getAttribute("loginId");
		List<BuyListDTO> buyListOk = buyDAO.getBuyListAll(id);
		
	//	String listUrl = req.getContextPath();
		
		model.addAttribute("buyListOk", buyListOk);
		model.addAttribute("id", id);
		
		return "buyListOk";
	} 
	
	

	
	
}
