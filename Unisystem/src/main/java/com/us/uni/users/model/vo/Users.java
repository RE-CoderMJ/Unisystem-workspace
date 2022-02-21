package com.us.uni.users.model.vo;


public class Users {
	 private int userNo;
	 private String userPwd;
	 private String korName;
	 private String engName;
	 private String birthday;
	 private String gender;
	 private String email;
	 private String phone;
	 private String address;
	 private String nation;
	 private String webMail;
	 private int userDiv;
	 private String profileImg;
	 
	 //학생
     private int studNo;
	 private int sprofNo; 
	 private String studUniv; 
	 private String studDepartment;
	 private String studMajor;
	 private String studMinor;
	 private String studInto;
	 private String studGrad;
	 private int studDivision;
	 private int studStatus; 
	 private int studSemester;
		
	 //교수
     private int profNo; 
     private int profRank; 
	 private String rankChange; 
	 private String profUniv; 
	 private String profDepartment;
	 private String profMajor; 
	 private String profInto; 
	 private String profResign; 
	 private String profLocation;  
	 private String profTel; 
	 private String profStatus; 
	 private String profAppDay; 
	 private String profAppTime; 
	 
	 public Users() {}

	public Users(int userNo, String userPwd, String korName, String engName, String birthday, String gender,
			String email, String phone, String address, String nation, String webMail, int userDiv, String profileImg,
			int studNo, int sprofNo, String studUniv, String studDepartment, String studMajor, String studMinor,
			String studInto, String studGrad, int studDivision, int studStatus, int studSemester, int profNo,
			int profRank, String rankChange, String profUniv, String profDepartment, String profMajor, String profInto,
			String profResign, String profLocation, String profTel, String profStatus, String profAppDay,
			String profAppTime) {
		super();
		this.userNo = userNo;
		this.userPwd = userPwd;
		this.korName = korName;
		this.engName = engName;
		this.birthday = birthday;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.nation = nation;
		this.webMail = webMail;
		this.userDiv = userDiv;
		this.profileImg = profileImg;
		this.studNo = studNo;
		this.sprofNo = sprofNo;
		this.studUniv = studUniv;
		this.studDepartment = studDepartment;
		this.studMajor = studMajor;
		this.studMinor = studMinor;
		this.studInto = studInto;
		this.studGrad = studGrad;
		this.studDivision = studDivision;
		this.studStatus = studStatus;
		this.studSemester = studSemester;
		this.profNo = profNo;
		this.profRank = profRank;
		this.rankChange = rankChange;
		this.profUniv = profUniv;
		this.profDepartment = profDepartment;
		this.profMajor = profMajor;
		this.profInto = profInto;
		this.profResign = profResign;
		this.profLocation = profLocation;
		this.profTel = profTel;
		this.profStatus = profStatus;
		this.profAppDay = profAppDay;
		this.profAppTime = profAppTime;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getEngName() {
		return engName;
	}

	public void setEngName(String engName) {
		this.engName = engName;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getWebMail() {
		return webMail;
	}

	public void setWebMail(String webMail) {
		this.webMail = webMail;
	}

	public int getUserDiv() {
		return userDiv;
	}

	public void setUserDiv(int userDiv) {
		this.userDiv = userDiv;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public int getStudNo() {
		return studNo;
	}

	public void setStudNo(int studNo) {
		this.studNo = studNo;
	}

	public int getSprofNo() {
		return sprofNo;
	}

	public void setSprofNo(int sprofNo) {
		this.sprofNo = sprofNo;
	}

	public String getStudUniv() {
		return studUniv;
	}

	public void setStudUniv(String studUniv) {
		this.studUniv = studUniv;
	}

	public String getStudDepartment() {
		return studDepartment;
	}

	public void setStudDepartment(String studDepartment) {
		this.studDepartment = studDepartment;
	}

	public String getStudMajor() {
		return studMajor;
	}

	public void setStudMajor(String studMajor) {
		this.studMajor = studMajor;
	}

	public String getStudMinor() {
		return studMinor;
	}

	public void setStudMinor(String studMinor) {
		this.studMinor = studMinor;
	}

	public String getStudInto() {
		return studInto;
	}

	public void setStudInto(String studInto) {
		this.studInto = studInto;
	}

	public String getStudGrad() {
		return studGrad;
	}

	public void setStudGrad(String studGrad) {
		this.studGrad = studGrad;
	}

	public int getStudDivision() {
		return studDivision;
	}

	public void setStudDivision(int studDivision) {
		this.studDivision = studDivision;
	}

	public int getStudStatus() {
		return studStatus;
	}

	public void setStudStatus(int studStatus) {
		this.studStatus = studStatus;
	}

	public int getStudSemester() {
		return studSemester;
	}

	public void setStudSemester(int studSemester) {
		this.studSemester = studSemester;
	}

	public int getProfNo() {
		return profNo;
	}

	public void setProfNo(int profNo) {
		this.profNo = profNo;
	}

	public int getProfRank() {
		return profRank;
	}

	public void setProfRank(int profRank) {
		this.profRank = profRank;
	}

	public String getRankChange() {
		return rankChange;
	}

	public void setRankChange(String rankChange) {
		this.rankChange = rankChange;
	}

	public String getProfUniv() {
		return profUniv;
	}

	public void setProfUniv(String profUniv) {
		this.profUniv = profUniv;
	}

	public String getProfDepartment() {
		return profDepartment;
	}

	public void setProfDepartment(String profDepartment) {
		this.profDepartment = profDepartment;
	}

	public String getProfMajor() {
		return profMajor;
	}

	public void setProfMajor(String profMajor) {
		this.profMajor = profMajor;
	}

	public String getProfInto() {
		return profInto;
	}

	public void setProfInto(String profInto) {
		this.profInto = profInto;
	}

	public String getProfResign() {
		return profResign;
	}

	public void setProfResign(String profResign) {
		this.profResign = profResign;
	}

	public String getProfLocation() {
		return profLocation;
	}

	public void setProfLocation(String profLocation) {
		this.profLocation = profLocation;
	}

	public String getProfTel() {
		return profTel;
	}

	public void setProfTel(String profTel) {
		this.profTel = profTel;
	}

	public String getProfStatus() {
		return profStatus;
	}

	public void setProfStatus(String profStatus) {
		this.profStatus = profStatus;
	}

	public String getProfAppDay() {
		return profAppDay;
	}

	public void setProfAppDay(String profAppDay) {
		this.profAppDay = profAppDay;
	}

	public String getProfAppTime() {
		return profAppTime;
	}

	public void setProfAppTime(String profAppTime) {
		this.profAppTime = profAppTime;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Users [userNo=");
		builder.append(userNo);
		builder.append(", userPwd=");
		builder.append(userPwd);
		builder.append(", korName=");
		builder.append(korName);
		builder.append(", engName=");
		builder.append(engName);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", email=");
		builder.append(email);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", address=");
		builder.append(address);
		builder.append(", nation=");
		builder.append(nation);
		builder.append(", webMail=");
		builder.append(webMail);
		builder.append(", userDiv=");
		builder.append(userDiv);
		builder.append(", profileImg=");
		builder.append(profileImg);
		builder.append(", studNo=");
		builder.append(studNo);
		builder.append(", sprofNo=");
		builder.append(sprofNo);
		builder.append(", studUniv=");
		builder.append(studUniv);
		builder.append(", studDepartment=");
		builder.append(studDepartment);
		builder.append(", studMajor=");
		builder.append(studMajor);
		builder.append(", studMinor=");
		builder.append(studMinor);
		builder.append(", studInto=");
		builder.append(studInto);
		builder.append(", studGrad=");
		builder.append(studGrad);
		builder.append(", studDivision=");
		builder.append(studDivision);
		builder.append(", studStatus=");
		builder.append(studStatus);
		builder.append(", studSemester=");
		builder.append(studSemester);
		builder.append(", profNo=");
		builder.append(profNo);
		builder.append(", profRank=");
		builder.append(profRank);
		builder.append(", rankChange=");
		builder.append(rankChange);
		builder.append(", profUniv=");
		builder.append(profUniv);
		builder.append(", profDepartment=");
		builder.append(profDepartment);
		builder.append(", profMajor=");
		builder.append(profMajor);
		builder.append(", profInto=");
		builder.append(profInto);
		builder.append(", profResign=");
		builder.append(profResign);
		builder.append(", profLocation=");
		builder.append(profLocation);
		builder.append(", profTel=");
		builder.append(profTel);
		builder.append(", profStatus=");
		builder.append(profStatus);
		builder.append(", profAppDay=");
		builder.append(profAppDay);
		builder.append(", profAppTime=");
		builder.append(profAppTime);
		builder.append(", getUserNo()=");
		builder.append(getUserNo());
		builder.append(", getUserPwd()=");
		builder.append(getUserPwd());
		builder.append(", getKorName()=");
		builder.append(getKorName());
		builder.append(", getEngName()=");
		builder.append(getEngName());
		builder.append(", getBirthday()=");
		builder.append(getBirthday());
		builder.append(", getGender()=");
		builder.append(getGender());
		builder.append(", getEmail()=");
		builder.append(getEmail());
		builder.append(", getPhone()=");
		builder.append(getPhone());
		builder.append(", getAddress()=");
		builder.append(getAddress());
		builder.append(", getNation()=");
		builder.append(getNation());
		builder.append(", getWebMail()=");
		builder.append(getWebMail());
		builder.append(", getUserDiv()=");
		builder.append(getUserDiv());
		builder.append(", getProfileImg()=");
		builder.append(getProfileImg());
		builder.append(", getStudNo()=");
		builder.append(getStudNo());
		builder.append(", getSprofNo()=");
		builder.append(getSprofNo());
		builder.append(", getStudUniv()=");
		builder.append(getStudUniv());
		builder.append(", getStudDepartment()=");
		builder.append(getStudDepartment());
		builder.append(", getStudMajor()=");
		builder.append(getStudMajor());
		builder.append(", getStudMinor()=");
		builder.append(getStudMinor());
		builder.append(", getStudInto()=");
		builder.append(getStudInto());
		builder.append(", getStudGrad()=");
		builder.append(getStudGrad());
		builder.append(", getStudDivision()=");
		builder.append(getStudDivision());
		builder.append(", getStudStatus()=");
		builder.append(getStudStatus());
		builder.append(", getStudSemester()=");
		builder.append(getStudSemester());
		builder.append(", getProfNo()=");
		builder.append(getProfNo());
		builder.append(", getProfRank()=");
		builder.append(getProfRank());
		builder.append(", getRankChange()=");
		builder.append(getRankChange());
		builder.append(", getProfUniv()=");
		builder.append(getProfUniv());
		builder.append(", getProfDepartment()=");
		builder.append(getProfDepartment());
		builder.append(", getProfMajor()=");
		builder.append(getProfMajor());
		builder.append(", getProfInto()=");
		builder.append(getProfInto());
		builder.append(", getProfResign()=");
		builder.append(getProfResign());
		builder.append(", getProfLocation()=");
		builder.append(getProfLocation());
		builder.append(", getProfTel()=");
		builder.append(getProfTel());
		builder.append(", getProfStatus()=");
		builder.append(getProfStatus());
		builder.append(", getProfAppDay()=");
		builder.append(getProfAppDay());
		builder.append(", getProfAppTime()=");
		builder.append(getProfAppTime());
		builder.append(", getClass()=");
		builder.append(getClass());
		builder.append(", hashCode()=");
		builder.append(hashCode());
		builder.append(", toString()=");
		builder.append(super.toString());
		builder.append("]");
		return builder.toString();
	}

	 
}
