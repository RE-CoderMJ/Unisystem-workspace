package com.us.uni.board.model.vo;


public class Reply {
	 private int replyNo;
	 private int ruserNo;
	 private int rboardNo;
	 private String replyContent;
	 private String createDate;
	 private String status;
	 private String replyWriter;
	 
	 
	 public Reply() {}


	public Reply(int replyNo, int ruserNo, int rboardNo, String replyContent, String createDate, String status,
			String replyWriter) {
		super();
		this.replyNo = replyNo;
		this.ruserNo = ruserNo;
		this.rboardNo = rboardNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.status = status;
		this.replyWriter = replyWriter;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Reply [replyNo=");
		builder.append(replyNo);
		builder.append(", ruserNo=");
		builder.append(ruserNo);
		builder.append(", rboardNo=");
		builder.append(rboardNo);
		builder.append(", replyContent=");
		builder.append(replyContent);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append(", status=");
		builder.append(status);
		builder.append(", replyWriter=");
		builder.append(replyWriter);
		builder.append("]");
		return builder.toString();
	}


	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public int getRuserNo() {
		return ruserNo;
	}


	public void setRuserNo(int ruserNo) {
		this.ruserNo = ruserNo;
	}


	public int getRboardNo() {
		return rboardNo;
	}


	public void setRboardNo(int rboardNo) {
		this.rboardNo = rboardNo;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public String getCreateDate() {
		return createDate;
	}


	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getReplyWriter() {
		return replyWriter;
	}


	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	
	 
	 
	
}
