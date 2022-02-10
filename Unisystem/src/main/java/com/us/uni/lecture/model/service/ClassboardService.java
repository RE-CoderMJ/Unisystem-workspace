package com.us.uni.lecture.model.service;

import java.util.ArrayList;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.vo.HomeworkP;

public interface ClassboardService {
	
	// 과제업로드 - 게시판 리스트 페이징
	int selectHomeworkListCount();
	ArrayList<HomeworkP> selectHomeworkpList(PageInfo pi);
}
