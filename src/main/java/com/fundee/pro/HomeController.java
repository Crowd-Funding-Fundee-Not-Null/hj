package com.fundee.pro;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fundee.dao.AdminDAO;
import com.fundee.dao.PostsDAO;
import com.fundee.dto.PostsDTO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	PostsDAO postsDAO;
	
	@Autowired
	AdminDAO adminDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		int amount = 4;
		
		List<Integer> randomNumList = new ArrayList<Integer>();
		List<Integer> numList = adminDAO.getPostsNums();
		
		int size = numList.size();
		
		
		for (int i=0; i<size; i++) {
			int randomIndex = (int)(Math.random()*(size-i));
			int value = numList.get(randomIndex);
			numList.remove(randomIndex);
			numList.add(value);
		}
		
		for (int i=0; i<amount; i++) {
			if (i==size) break;
			randomNumList.add(numList.get(i));
		}

		List<PostsDTO> lists = adminDAO.get4randomPosts(randomNumList);
		
		Collections.shuffle(lists);
		
		
		req.setAttribute("lists", lists);
		
		return "index";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "getShuffledLists", method = RequestMethod.GET)
	public List<PostsDTO> getShuffledLists() throws Exception {
		
		int amount = 4;
		
		List<Integer> randomNumList = new ArrayList<Integer>();
		List<Integer> numList = adminDAO.getPostsNums();
		
		int size = numList.size();
		
		
		for (int i=0; i<size; i++) {
			int randomIndex = (int)(Math.random()*(size-i));
			int value = numList.get(randomIndex);
			numList.remove(randomIndex);
			numList.add(value);
		}
		
		for (int i=0; i<amount; i++) {
			if (i==size) break;
			randomNumList.add(numList.get(i));
		}

		List<PostsDTO> lists = adminDAO.get4randomPosts(randomNumList);
		
		Collections.shuffle(lists);
		
		
		return lists;
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index(Model model) {
		
		return "redirect:/";
	}
	
	
	
	@RequestMapping(value = "menu.do", method = RequestMethod.GET)
	public String menu(Model model) {
		
		return "menu";
	}
	
	
	
	@RequestMapping(value = "about.do", method = RequestMethod.GET)
	public String about(Model model) {
		
		return "about";
	}
	
	
	@RequestMapping(value = "book.do", method = RequestMethod.GET)
	public String book(Model model) {
		
		return "book";
	}
	
	
}
