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
	// ��ǰ ��� �޼ҵ�
	@RequestMapping(value = "/created.do" , method = RequestMethod.GET)
	public String Fundee(HttpServletRequest req, HttpSession session) throws Exception {
	    // �����ڸ� ��ǰ ����� �� �� �ְ� üŷ�ϴ� �ڵ�
	    LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
	    if (user == null || user.getRole() != 1) {
	        return "redirect:/posts_list.do"; // �����ڰ� �ƴϸ� ��ǰ ����Ʈ â���� ���ư�
	    }
	    return "posts_created";
	}
	//��ǰ ���ó���� �� �ʿ��� �޼ҵ� ��� �̹����� upload, �������� �̹����� detail_upload�� �� ����
	//MultipartFile�� ��������ν� ���������� ���� ���ε带 �� �� �ְ� ��
	@RequestMapping(value = "/created_ok.do", method = RequestMethod.POST)
	public String created_ok(PostsDTO dto, 
	                        @RequestParam(value = "upload", required = false) MultipartFile listImageFile,
	                        @RequestParam(value = "detail_upload", required = false) MultipartFile detailImageFile,
	                        HttpServletRequest request,HttpSession session) throws Exception {
		
		//������ �α������� �� ��ǰ ����� ���â ���� �ڵ�
		LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
	    if (user == null || user.getRole() != 1) {
	        return "redirect:/posts_list.do";
	    }
		
	    // �� �ڵ��� �� ������ dto�� �ִ� MultipartFile�� ����� upload�� detail_upload ���ֱ� ������ dto�� �����ϴ�
	    //�������� ���� �����͸� �ڵ����� ä����ϴµ� ������ @RequestParam���� ������ �̹� �޾� �浹�� �߻��� �� ����
	    //�׷��� null�� �ʱ�ȭ����
	    dto.setUpload(null);
	    dto.setDetail_upload(null);
	    
	    // ���ϸ� �ʵ嵵 ��������� �ʱ�ȭ
	    dto.setImage_file("");
	    dto.setDetail_imagefile("");
	    
	    // ��ǥ�ݾ� ó��
	    String goal_amountStr = request.getParameter("goal_amount");
	    String current_amountStr = request.getParameter("current_amount");
	    //�ʱ� �ݾ� 0���� �ʱ�ȭ
	    int goal_amount = 0;
	    int current_amount = 0;
	    
	    //��ǥ �ݾװ� ���� ��ݾ� �߸� �Է� �� üŷ�ϴ� �ڵ� 
	    try {
	        if (goal_amountStr != null && !goal_amountStr.isEmpty()) {
	            goal_amount = Integer.parseInt(goal_amountStr);
	        }
	        if (current_amountStr != null && !current_amountStr.isEmpty()) {
	            current_amount = Integer.parseInt(current_amountStr);
	        }
	    } catch (NumberFormatException e) {
	        throw new IllegalArgumentException("��ǥ �ݾװ� ���� ��ݾ��� �ùٸ� ���� �����̾�� �մϴ�.");
	    }
	    
	    dto.setGoal_amount(goal_amount);
	    dto.setCurrent_amount(current_amount);
	    
	    //���� ��� ã�Ƽ� ���� ���ε� �� ���� ���丮 ����
	    String root = request.getSession().getServletContext().getRealPath("/");
	    String savePath = root + "resources" + File.separator + "uploads";
	    File dir = new File(savePath);
	    if (!dir.exists()) dir.mkdirs();

	    // ��� �̹��� ó�� (listImageFile �� image_file)
	    if (listImageFile != null && !listImageFile.isEmpty()) {
	        String originalFileName = listImageFile.getOriginalFilename();
	        //�ٸ� ����ڰ� ���� ��Ͻ� �ߺ������� ���� ���Ͼ��ε�ð� +  _LIST_ �������ϸ� �������� ����
	        String saveFileName = System.currentTimeMillis() + "_LIST_" + originalFileName;
	        File saveFile = new File(savePath, saveFileName);
	        listImageFile.transferTo(saveFile);
	        dto.setImage_file(saveFileName);
	    }

	    // ��� ��� (Ÿ�ӽ����� �ߺ� ����- ���ð��� ������ ����ڵ��� ���� �� ������ ����ó��)
	    try { Thread.sleep(50); } catch (InterruptedException e) {}

	    // �� �̹��� ó�� (detailImageFile �� detail_imagefile)
	    if (detailImageFile != null && !detailImageFile.isEmpty()) {
	        String originalDetailFileName = detailImageFile.getOriginalFilename();
	        String saveDetailFileName = System.currentTimeMillis() + "_DETAIL_" + originalDetailFileName;
	        File saveDetailFile = new File(savePath, saveDetailFileName);
	        detailImageFile.transferTo(saveDetailFile);
	        dto.setDetail_imagefile(saveDetailFileName);
	    }

	    // ���� �ʵ� ����-> ���ε�� ������ ���� ��� �߻��ϴ� null���� �� ���ڿ��� �ʱ�ȭ
	    if (dto.getImage_file() == null) dto.setImage_file("");
	    if (dto.getDetail_imagefile() == null) dto.setDetail_imagefile("");
	    
	    postsDAO.insertData(dto);
	    
	    return "redirect:/posts_list.do";
	}
	// ��ǰ ��Ͽ��� ����¡ ó��
	// defaultValue = ""�� searchKey,searchValue���� �������� ��� ���ڿ��� ó����
	@RequestMapping(value = {"/posts_list.do","list.do"})
	public ModelAndView getLists(HttpServletRequest req,
								@RequestParam(defaultValue = "") String searchKey,
								@RequestParam(defaultValue = "") String searchValue) throws Exception {
		
		String pageNum = req.getParameter("pageNum");
		
		int currentPage = (pageNum != null && !pageNum.equals("")) ?
				Integer.parseInt(pageNum) : 1;
				
		int dataCount = postsDAO.getDataCount(searchKey, searchValue);
		// ��ǰ ���â�� �� �������� 9���� ���� ������
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
		//mav ��ü�� ����¡�� �����Ͱ� ����� lists�� �Ѱ���
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.addObject("pageIndexList", pageIndexList);
		mav.addObject("pageNum", currentPage);
		
		mav.setViewName("posts_list");
		return mav;
	}

	// �Խù� �� ������
	// ��ǰ��ȣ�� ���� ��ǰ Ŭ���� �� ��ǰ�� ���� ������ �������� �޼ҵ�
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

	// ���� ������ �̵�
	@RequestMapping(value = "/updated.do", method = RequestMethod.GET)
	public ModelAndView updated(@RequestParam int posts_num, HttpSession session) throws Exception {
		
		 // ������ ���� Ȯ��
	    LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
	    if (user == null || user.getRole() != 1) {
	        // ������ ������ ��� �������� �����̷�Ʈ
	        return new ModelAndView("redirect:/posts_list.do");
	    }

		ModelAndView mav = new ModelAndView();
		PostsDTO dto = postsDAO.getReadData(posts_num);
		mav.addObject("dto", dto);
		mav.setViewName("posts_updated");
		return mav;
	}
	
	// ���� ó�� �κп��� ���� ���ε� �ڵ� 
	@RequestMapping(value = "/updated_ok.do", method = RequestMethod.POST)
	public String updated_ok(PostsDTO dto, 
	                        @RequestParam(value = "upload", required = false) MultipartFile listImageFile,  // ������ ����
	                        @RequestParam(value = "detail_upload", required = false) MultipartFile detailImageFile,  // ������ ����
	                        HttpServletRequest request, HttpSession session) throws Exception {
		
		
				//������ �α������� �� ��ǰ ������ ���â ���� �ڵ�
				LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
			    if (user == null || user.getRole() != 1) {
			        // If not an admin, redirect them to the product list or a forbidden page
			        return "redirect:/posts_list.do";
			    }
		

	    // 1. ��ǥ �ݾ�, ���� ��ݾ� ���� ��ȯ
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
	        throw new IllegalArgumentException("��ǥ �ݾװ� ���� ��ݾ��� �ùٸ� ���� �����̾�� �մϴ�.");
	    }
	    
	    dto.setGoal_amount(goal_amount);
	    dto.setCurrent_amount(current_amount);

	    // 2. ���� ������ �������� (���� �����͸� �˻� �� ���� �̹��� ������ �̸��� �����ϴ� �ڵ�)
	    PostsDTO existingDto = postsDAO.getReadData(dto.getPosts_num());
	    
	    // 3. ���� ���� ���
	    String root = request.getSession().getServletContext().getRealPath("/");
	    String savePath = root + "resources" + File.separator + "uploads";
	    File dir = new File(savePath);
	    if (!dir.exists()) dir.mkdirs();

	    // 4. ��� �̹��� ���� ó�� (listImageFile �� image_file)
	    if (listImageFile != null && !listImageFile.isEmpty()) {
	        // ���� ���� ����
	        if (existingDto != null && existingDto.getImage_file() != null && !existingDto.getImage_file().isEmpty()) {
	            File oldFile = new File(savePath, existingDto.getImage_file());
	            if (oldFile.exists()) oldFile.delete();
	        }
	        
	        // �� ���� ���� �ڵ�
	        String originalFileName = listImageFile.getOriginalFilename();
	        String saveFileName = System.currentTimeMillis() + "_LIST_" + originalFileName;
	        File saveFile = new File(savePath, saveFileName);
	        listImageFile.transferTo(saveFile);
	        dto.setImage_file(saveFileName);
	    } else {
	        // �� ������ ������ ���� ���ϸ� ����
	        if (existingDto != null) {
	            dto.setImage_file(existingDto.getImage_file());
	        }
	    }

	    // ��� ��� (Ÿ�ӽ����� �ߺ� ����)
	    try { Thread.sleep(50); } catch (InterruptedException e) {}

	    // 5. �� �̹��� ���� ó�� (detailImageFile �� detail_imagefile)
	    if (detailImageFile != null && !detailImageFile.isEmpty()) {
	        // ���� �� ���� ����
	        if (existingDto != null && existingDto.getDetail_imagefile() != null && !existingDto.getDetail_imagefile().isEmpty()) {
	            File oldDetailFile = new File(savePath, existingDto.getDetail_imagefile());
	            if (oldDetailFile.exists()) oldDetailFile.delete();
	        }
	        
	        // �� �� ���� ����
	        String originalDetailFileName = detailImageFile.getOriginalFilename();
	        String saveDetailFileName = System.currentTimeMillis() + "_DETAIL_" + originalDetailFileName;
	        File saveDetailFile = new File(savePath, saveDetailFileName);
	        detailImageFile.transferTo(saveDetailFile);
	        dto.setDetail_imagefile(saveDetailFileName);
	       
	    } else {
	        // �� ������ ������ ���� ���ϸ� ����
	        if (existingDto != null) {
	            dto.setDetail_imagefile(existingDto.getDetail_imagefile());
	        }
	    }

	    // 6. DB ������Ʈ
	    postsDAO.updateData(dto);

	    // 7. �� �������� �����̷�Ʈ
	    return "redirect:/article.do?posts_num=" + dto.getPosts_num();
	}

	// �Խù� ����
	@RequestMapping(value = "/deleted.do", method = RequestMethod.GET)
	public String deleted(@RequestParam int posts_num, HttpServletRequest request, HttpSession session) throws Exception {
		
		//������ �α������� �� ��ǰ ������ ���â ���� �ڵ�
	    LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
	    if (user == null || user.getRole() != 1) {
	        // �����ڰ� �ƴϸ� �����̷�Ʈ
	        return "redirect:/posts_list.do";
	    }
		//�����ڸ� ���� ���� ����		
		PostsDTO dto = postsDAO.getReadData(posts_num);
		
		// ���� �̹��� ���� ����
		if (dto != null && dto.getImage_file() != null && !dto.getImage_file().isEmpty()) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "resources" + File.separator + "uploads";
			File file = new File(savePath, dto.getImage_file());
			if (file.exists()) {
				file.delete();
			}
		}
		
		// �� �̹��� ���� ����
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

	    // ��õ ��ǰ 4�� ��ȸ
	    List<PostsDTO> recommendedProducts = postsDAO.getRecommendedProducts(); 

	    mav.addObject("recommendedProducts", recommendedProducts);
	    mav.setViewName("index");
	    return mav;
	}
	
	
}