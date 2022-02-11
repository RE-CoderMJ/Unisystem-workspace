package com.us.uni.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.us.uni.board.model.service.BoardService;
import com.us.uni.board.model.vo.Board;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage",defaultValue="1")int currentPage, ModelAndView mv) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectList(pi);
		
		//System.out.println(list);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("board/boardListView");
		
		return mv;
	}
	
	@RequestMapping("search.bo")
	public ModelAndView searchList(@RequestParam(value="cpage")int currentPage, String condition, String keyword, ModelAndView mv) {
			

		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
			
		int searchCount = bService.selectSearchCount(map); // 현재 검색결과에 맞는 게시글 총갯수 

		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectSearchList(map, pi);
			
			mv.addObject("pi", pi)
			  .addObject("list", list)
			  .addObject("condition", condition)
			  .addObject("keyword", keyword)
			  .setViewName("board/boardListView");
			
			return mv;
		}
	
	
	
	@RequestMapping("keyword.bo")
	public ModelAndView selectKeyword(@RequestParam(value="cpage",defaultValue="1")int currentPage,int bokeyword, ModelAndView mv) {
		
		int listCount = bService.selectKeywordListCount(bokeyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectKeyword(pi,bokeyword);
		
		//System.out.println(list);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("board/boardListView");
		
		return mv;
	}
	
	
	
	}
	
	

	
	
	
	

