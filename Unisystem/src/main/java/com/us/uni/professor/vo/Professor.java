package com.us.uni.professor.vo;

public class Professor {
	
	 private int profNo;
	 private int profAppTime;
	 private int profAppDay;
	 private String profInto;
	 private String profLocation;
	 private String profMajor;
	 private String profRank;
	 private int profResign;
	 private String profStatus;
	 private String profTel;
	 private String profUniv;
	 private String rankChange;
	 private String profDepartment;
	 
	 public Professor() {}
	 
	 public Professor(int profNo, int profAppTime, int profAppDay, String profInto, String profLocation,
			String profMajor, String profRank, int profResign, String profStatus, String profTel, String profUniv,
			String rankChange, String profDepartment) {
		super();
		this.profNo = profNo;
		this.profAppTime = profAppTime;
		this.profAppDay = profAppDay;
		this.profInto = profInto;
		this.profLocation = profLocation;
		this.profMajor = profMajor;
		this.profRank = profRank;
		this.profResign = profResign;
		this.profStatus = profStatus;
		this.profTel = profTel;
		this.profUniv = profUniv;
		this.rankChange = rankChange;
		this.profDepartment = profDepartment;
	}

	public int getProfNo() {
		return profNo;
	}

	public void setProfNo(int profNo) {
		this.profNo = profNo;
	}

	public int getProfAppTime() {
		return profAppTime;
	}

	public void setProfAppTime(int profAppTime) {
		this.profAppTime = profAppTime;
	}

	public int getProfAppDay() {
		return profAppDay;
	}

	public void setProfAppDay(int profAppDay) {
		this.profAppDay = profAppDay;
	}

	public String getProfInto() {
		return profInto;
	}

	public void setProfInto(String profInto) {
		this.profInto = profInto;
	}

	public String getProfLocation() {
		return profLocation;
	}

	public void setProfLocation(String profLocation) {
		this.profLocation = profLocation;
	}

	public String getProfMajor() {
		return profMajor;
	}

	public void setProfMajor(String profMajor) {
		this.profMajor = profMajor;
	}

	public String getProfRank() {
		return profRank;
	}

	public void setProfRank(String profRank) {
		this.profRank = profRank;
	}

	public int getProfResign() {
		return profResign;
	}

	public void setProfResign(int profResign) {
		this.profResign = profResign;
	}

	public String getProfStatus() {
		return profStatus;
	}

	public void setProfStatus(String profStatus) {
		this.profStatus = profStatus;
	}

	public String getProfTel() {
		return profTel;
	}

	public void setProfTel(String profTel) {
		this.profTel = profTel;
	}

	public String getProfUniv() {
		return profUniv;
	}

	public void setProfUniv(String profUniv) {
		this.profUniv = profUniv;
	}

	public String getRankChange() {
		return rankChange;
	}

	public void setRankChange(String rankChange) {
		this.rankChange = rankChange;
	}

	public String getProfDepartment() {
		return profDepartment;
	}

	public void setProfDepartment(String profDepartment) {
		this.profDepartment = profDepartment;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Professor [profNo=");
		builder.append(profNo);
		builder.append(", profAppTime=");
		builder.append(profAppTime);
		builder.append(", profAppDay=");
		builder.append(profAppDay);
		builder.append(", profInto=");
		builder.append(profInto);
		builder.append(", profLocation=");
		builder.append(profLocation);
		builder.append(", profMajor=");
		builder.append(profMajor);
		builder.append(", profRank=");
		builder.append(profRank);
		builder.append(", profResign=");
		builder.append(profResign);
		builder.append(", profStatus=");
		builder.append(profStatus);
		builder.append(", profTel=");
		builder.append(profTel);
		builder.append(", profUniv=");
		builder.append(profUniv);
		builder.append(", rankChange=");
		builder.append(rankChange);
		builder.append(", profDepartment=");
		builder.append(profDepartment);
		builder.append("]");
		return builder.toString();
	}
	 
	 
	 
	 
}
