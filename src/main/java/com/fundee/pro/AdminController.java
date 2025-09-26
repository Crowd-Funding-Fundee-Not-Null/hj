package com.fundee.pro;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fundee.dao.AdminDAO;
import com.fundee.dto.LoginDTO;

@Controller
public class AdminController {

	@Autowired
	AdminDAO adminDAO;
	
	
	@RequestMapping(value = "admin.do", method = RequestMethod.GET)
	public String admin(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		List<LoginDTO> lists = adminDAO.getAllMember();
		
		req.setAttribute("lists", lists);
		
		return "admin";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
