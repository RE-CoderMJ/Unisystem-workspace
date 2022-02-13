package com.us.uni.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.us.uni.board.model.service.BoardService;
import com.us.uni.board.model.vo.Board;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardService bService;
	
	// 커뮤니티 리스트
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
	
	//커뮤니티 검색
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
	
	
	//카테고리별 조회
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
	
	//커뮤니티 등록
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		
		return "board/boardForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
		
		Attachment at = new Attachment();
		 
		 // 첨부파일을 선택했든 안했든 생성된 객체임 (다만 filename에 원본명이 있냐, ""이냐)
		
		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버 업로드 => 원본명, 서버업로드된경로를 b에 이어서 담기
		if(!upfile.getOriginalFilename().equals("")) {
			
		
			String changeName = saveFile(upfile, session);
			
			// 원본명, 서버업로드된경로를 Attatchment 에 이어서 담기
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName(changeName);
			at.setPath("resources/uploadFiles/board");
		} 
		
		int result = bService.insertBoard(b, at);
		//System.out.println(b);
		
		if(result > 0) { // 성공 => 게시글 리스트페이지 (list.bo  url재요청)
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:list.bo";
		}else { // 실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "board/boardListView";
		}
		
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20220118103507"(년월일시분초)
		int ranNum = (int)(Math.random() * 90000 + 10000); // 23152 (5자리 랜덤값)
		String ext = originName.substring(originName.lastIndexOf(".")); // ".png"
		
		String changeName = currentTime + ranNum + ext;
				
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/board");
		
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		
		return changeName;
	}
	
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		// bno에는 상세조회하고자하는 해당 게시글 번호 담겨있음
		
		// 해당 게시글 조회수 증가용 서비스 호출 결과 받기 (update하고 옴)
		int result = bService.increaseCount(bno);	
		if(result > 0) {
		
			Board b = bService.selectBoard(bno);
			Attachment at = bService.selectAttachBoard(bno);
			
				mv.addObject("b", b)
				  .addObject("at",at)
				  .setViewName("board/boardDetailView");
				
			System.out.println("상세ctr:"+ at);
			
		}else {
		
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/boardListView");
		}
		
		return mv;
	}
	


	
	}
	
	

	
	
	
	

