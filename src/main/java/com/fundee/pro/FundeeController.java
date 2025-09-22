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
	

	// ��ǰ ��� ó��
	@RequestMapping(value = "/created_ok.do", method = RequestMethod.POST)
	public String created_ok(FundeeDTO dto, @RequestParam(value = "upload", required = false) MultipartFile mf,
	        HttpServletRequest request) throws Exception {

		//��ǰ��Ͻ� ��ǥ�ݾװ� �����ݾ׿� �ʱⰪ�� �ʿ��ϱ⶧���� 1�� �޼ҵ尡 �ʿ���
		 // 1. ��ǥ �ݾװ� ���� ��ݾ� �ʵ� ó��
        String goalAmountStr = request.getParameter("goalAmount");
        String currentAmountStr = request.getParameter("currentAmount");
        
        // �� ���ڿ��̰ų� null�� ��� 0���� ��ȯ
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
            // ���� ��ȯ ���� �� ���� ó��
            throw new IllegalArgumentException("��ǥ �ݾװ� ���� ��ݾ��� �ùٸ� ���� �����̾�� �մϴ�.");
        }
        
        dto.setGoalAmount(goalAmount);
        dto.setCurrentAmount(currentAmount);		
		
	    // ���� �� ��ȿ�� �˻�
	    if (dto.getTitle() == null || dto.getTitle().trim().isEmpty()) {
	        throw new IllegalArgumentException("��ǰ ������ �ʼ� �Է� �׸��Դϴ�.");
	    }
	    
	    
	    // ���� ���ε� �޼ҵ�
	    String root = request.getSession().getServletContext().getRealPath("/");
	    String savePath = root + "resources" + File.separator + "uploads";

	    if (mf != null && !mf.isEmpty()) {
	        File saveFile = new File(savePath, mf.getOriginalFilename());
	        mf.transferTo(saveFile);
	        dto.setImageFile(mf.getOriginalFilename());
	    } else {
	        dto.setImageFile(""); // ������ ���� ��� �� ���ڿ��� ����
	    }

	    // DTO�� ����Ͽ� �����ͺ��̽��� ������ ����
	    fundeeDAO.insertData(dto);

	    // ���� �� ����Ʈ �������� �̵�
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

	// �Խù� �� ������
	@RequestMapping(value = "/article.do", method = RequestMethod.GET)
	public ModelAndView article(@RequestParam int postsNum) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		//��ȸ�� ����
		fundeeDAO.updateHitCount(postsNum);
		
		// ��ǰ �� ������ ��������
		FundeeDTO dto = fundeeDAO.getReadData(postsNum);
		
		// �𵨿� ������ �߰�
		if (dto != null) {
			fundeeDAO.updateHitCount(postsNum);
			mav.addObject("dto", dto);
			mav.setViewName("posts_article");
		} else {
			// �Խù��� ���� ��� ó��
			mav.setViewName("redirect:/posts_list.do");
		}
		return mav;
	}

	// ���� ������ �̵�
	@RequestMapping(value = "/updated.do", method = RequestMethod.GET)
	public ModelAndView updated(@RequestParam int postsNum) throws Exception {
		ModelAndView mav = new ModelAndView();
		FundeeDTO dto = fundeeDAO.getReadData(postsNum);
		mav.addObject("dto", dto);
		mav.setViewName("posts_updated");
		return mav;
	}
	
	// ���� ó��
	@RequestMapping(value = "/updated_ok.do", method = RequestMethod.POST)
	public String updated_ok(FundeeDTO dto, @RequestParam(value = "upload", required = false) MultipartFile mf, HttpServletRequest request) throws Exception {

	    // 1. ��ǥ �ݾװ� ���� ��ݾ� �ʵ� ó��
        String goalAmountStr = request.getParameter("goalAmount");
        String currentAmountStr = request.getParameter("currentAmount");
        
        // �� ���ڿ��̰ų� null�� ��� 0���� ��ȯ
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
            // ���� ��ȯ ���� �� ���� ó��
            throw new IllegalArgumentException("��ǥ �ݾװ� ���� ��ݾ��� �ùٸ� ���� �����̾�� �մϴ�.");
        }
        
        dto.setGoalAmount(goalAmount);
        dto.setCurrentAmount(currentAmount);
		
		
		//���� ���� �� �ʿ��� �޼ҵ�
	    String root = request.getSession().getServletContext().getRealPath("/");
	    String savePath = root + "resources" + File.separator + "uploads";

	    if (mf != null && !mf.isEmpty()) {
	        // ���� ���� ����
	        String existingImageFile = request.getParameter("existingImageFile");
	        if (existingImageFile != null && !existingImageFile.isEmpty()) {
	            File oldFile = new File(savePath, existingImageFile);
	            if (oldFile.exists()) {
	                oldFile.delete();
	            }
	        }

	        // ���ο� ���� ����
	        String originalFileName = mf.getOriginalFilename();
	        String saveFileName = System.currentTimeMillis() + "_" + originalFileName;
	        File saveFile = new File(savePath, saveFileName);
	        mf.transferTo(saveFile);
	        dto.setImageFile(saveFileName);
	    } else {
	        // ���ο� ������ ������ ���� ���ϸ� ����
	        dto.setImageFile(request.getParameter("existingImageFile"));
	    }

	    fundeeDAO.updateData(dto);

	    return "redirect:/article.do?postsNum=" + dto.getPostsNum();
	}

	// �Խù� ����
	@RequestMapping(value = "/deleted.do", method = RequestMethod.GET)
	public String deleted(@RequestParam int postsNum, HttpServletRequest request) throws Exception {
	    
	    // ���ϵ� �Բ� ����
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