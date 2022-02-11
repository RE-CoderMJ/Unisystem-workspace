package com.us.uni.lecture.model.service;

import java.util.ArrayList;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.vo.HomeworkP;

public interface HomeworkService {
	
	// 학생 : 과제업로드 - 게시판 리스트 페이징
	int selectHomeworkListCount();
	// 학생 : 과제업로드 - 마감된 게시판 리스트 가져오기(조회)
	ArrayList<HomeworkP> selectHomeworkpList(PageInfo pi);
}
