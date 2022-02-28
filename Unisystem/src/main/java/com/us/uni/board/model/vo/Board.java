package com.us.uni.board.model.vo;
 

public class Board {
	 private int boardNo;
	 private String userNo;
	 private String boardTitle;
	 private String boardContent;
	 private int boCount;
	 private String createDate;
	 private String noticeYN;
	 private String deleteYN;
	 private int boCategory;
	 private int subCategory;
	 private String boardWriter;
	 private int userDiv;
	 
	 public Board() {}

	public Board(int boardNo, String userNo, String boardTitle, String boardContent, int boCount, String createDate,
			String noticeYN, String deleteYN, int boCategory, int subCategory, String boardWriter, int userDiv) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boCount = boCount;
		this.createDate = createDate;
		this.noticeYN = noticeYN;
		this.deleteYN = deleteYN;
		this.boCategory = boCategory;
		this.subCategory = subCategory;
		this.boardWriter = boardWriter;
		this.userDiv = userDiv;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoCount() {
		return boCount;
	}

	public void setBoCount(int boCount) {
		this.boCount = boCount;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getNoticeYN() {
		return noticeYN;
	}

	public void setNoticeYN(String noticeYN) {
		this.noticeYN = noticeYN;
	}

	public String getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}

	public int getBoCategory() {
		return boCategory;
	}

	public void setBoCategory(int boCategory) {
		this.boCategory = boCategory;
	}

	public int getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(int subCategory) {
		this.subCategory = subCategory;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getUserDiv() {
		return userDiv;
	}

	public void setUserDiv(int userDiv) {
		this.userDiv = userDiv;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Board [boardNo=");
		builder.append(boardNo);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", boardTitle=");
		builder.append(boardTitle);
		builder.append(", boardContent=");
		builder.append(boardContent);
		builder.append(", boCount=");
		builder.append(boCount);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append(", noticeYN=");
		builder.append(noticeYN);
		builder.append(", deleteYN=");
		builder.append(deleteYN);
		builder.append(", boCategory=");
		builder.append(boCategory);
		builder.append(", subCategory=");
		builder.append(subCategory);
		builder.append(", boardWriter=");
		builder.append(boardWriter);
		builder.append(", userDiv=");
		builder.append(userDiv);
		builder.append("]");
		return builder.toString();
	}
	 
	 
	 
	 
	
	 


}
