package com.us.uni.lecture.model.vo;

import java.sql.Date;

public class Classboard {
	
	private int classboardNo;            // 글번호
	private int classNo;                 // 강의번호
	private String classboardCategory;   // 공지사항(L) | 수업자료실(D) | 영상자료실(M)
	private String classboardTitle;      // 제목
	private String classboardContent;    // 내용
	private Date classboardEndDateTime;  // 최종작성일시
	private int count;                   // 조회수
	private String status;               // 게시여부(Y|N)
	private String korName;

public Classboard() {}

public Classboard(int classboardNo, int classNo, String classboardCategory, String classboardTitle,
		String classboardContent, Date classboardEndDateTime, int count, String status, String korName) {
	super();
	this.classboardNo = classboardNo;
	this.classNo = classNo;
	this.classboardCategory = classboardCategory;
	this.classboardTitle = classboardTitle;
	this.classboardContent = classboardContent;
	this.classboardEndDateTime = classboardEndDateTime;
	this.count = count;
	this.status = status;
	this.korName = korName;
}

public int getClassboardNo() {
	return classboardNo;
}

public void setClassboardNo(int classboardNo) {
	this.classboardNo = classboardNo;
}

public int getClassNo() {
	return classNo;
}

public void setClassNo(int classNo) {
	this.classNo = classNo;
}

public String getClassboardCategory() {
	return classboardCategory;
}

public void setClassboardCategory(String classboardCategory) {
	this.classboardCategory = classboardCategory;
}

public String getClassboardTitle() {
	return classboardTitle;
}

public void setClassboardTitle(String classboardTitle) {
	this.classboardTitle = classboardTitle;
}

public String getClassboardContent() {
	return classboardContent;
}

public void setClassboardContent(String classboardContent) {
	this.classboardContent = classboardContent;
}

public Date getClassboardEndDateTime() {
	return classboardEndDateTime;
}

public void setClassboardEndDateTime(Date classboardEndDateTime) {
	this.classboardEndDateTime = classboardEndDateTime;
}

public int getCount() {
	return count;
}

public void setCount(int count) {
	this.count = count;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public String getKorName() {
	return korName;
}

public void setKorName(String korName) {
	this.korName = korName;
}

@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("Classboard [classboardNo=");
	builder.append(classboardNo);
	builder.append(", classNo=");
	builder.append(classNo);
	builder.append(", classboardCategory=");
	builder.append(classboardCategory);
	builder.append(", classboardTitle=");
	builder.append(classboardTitle);
	builder.append(", classboardContent=");
	builder.append(classboardContent);
	builder.append(", classboardEndDateTime=");
	builder.append(classboardEndDateTime);
	builder.append(", count=");
	builder.append(count);
	builder.append(", status=");
	builder.append(status);
	builder.append(", korName=");
	builder.append(korName);
	builder.append("]");
	return builder.toString();
}




}

