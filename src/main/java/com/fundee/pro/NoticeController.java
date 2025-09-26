package com.fundee.pro;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.management.MXBean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fundee.dao.NoticeDAO;
import com.fundee.dto.NoticeDTO;
import com.fundee.util.MyUtil;

import lombok.RequiredArgsConstructor;

@Controller
public class NoticeController {

	@Autowired
	NoticeDAO noticeDAO;
	
	@Autowired
	MyUtil myUtil;
	
	
	
	@RequestMapping(value = "notice.do", method = RequestMethod.GET)
	public String notice(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String cp = req.getContextPath();
		
		
		List<NoticeDTO> importantLists = noticeDAO.getImportantNotice();
		
		String pageNum = req.getParameter("pageNum");
		
		int currentPage = 1;
		
		if (pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		int dataCount = noticeDAO.getDataCount();
		
		int numPerPage = 6-importantLists.size();
		int totalPage = myUtil.getPagecount(numPerPage, dataCount);
		int numPerBlock = 5;
		
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		int start = (currentPage-1)*numPerPage+1;
		int end = start+numPerPage-1;
		
		String listUrl = cp + "/notice.do";
		
		List<NoticeDTO> allLists = noticeDAO.getAllNotice(start,end);
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, numPerBlock, listUrl);
		
		
		
		
		req.setAttribute("pageIndexList", pageIndexList);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("currentPage", currentPage);
		
		
		req.setAttribute("importantLists", importantLists);
		req.setAttribute("allLists", allLists);
		
		
		return "notice";
	}
	
	
	@RequestMapping(value = "notice_detail.do", method = RequestMethod.GET)
	public String notice_detail(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		String pageNum = req.getParameter("pageNum");
		
		int notice_num = Integer.parseInt(req.getParameter("notice_num"));
		
		noticeDAO.updateNoticeHitCount(notice_num);
		
		NoticeDTO dto = noticeDAO.getNoticeDetail(notice_num);
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("notice_num", notice_num);
		req.setAttribute("pageNum", pageNum);
		
		return "notice_detail";
	}
	
	
	
	@RequestMapping(value = "notice_write.do", method = RequestMethod.GET)
	public String notice_write(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		String pageNum = req.getParameter("pageNum");
		
		req.setAttribute("pageNum", pageNum);
		
		return "notice_write";
	}
	
	
	
	@RequestMapping(value = "notice_write_ok.do", method = RequestMethod.POST)
	public String notice_write_ok(NoticeDTO dto, HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		//NoticeDTO dto = new NoticeDTO();
		
		int maxNum = noticeDAO.getMaxNum();
		
		dto.setNotice_num(maxNum+1);
		dto.setId("yh"); //나중에 세션 완료되면 작성한 관리자 아이디를 받아오도록 수정해야함
//		dto.setTitle(req.getParameter("title"));
//		dto.setContent(req.getParameter("content"));
//		dto.setImportance(Integer.parseInt(req.getParameter("importance")));
		
		noticeDAO.insertNotice(dto);
		
		
		return "redirect:/notice.do";
	}
	
	
	
	@RequestMapping(value = "notice_delete_ok.do", method = RequestMethod.GET)
	public String notice_delete_ok(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		int num = Integer.parseInt(req.getParameter("notice_num"));
		String pageNum = req.getParameter("pageNum");
		
		noticeDAO.deleteNotice(num);
		
		return "redirect:/notice.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
