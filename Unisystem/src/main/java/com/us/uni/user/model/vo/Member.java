package com.us.uni.user.model.vo;


public class Member {
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
	 
	 public Member() {}

	public Member(int userNo, String userPwd, String korName, String engName, String birthday, String gender,
			String email, String phone, String address, String nation, String webMail, int userDiv, String profileImg) {
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

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userPwd=" + userPwd + ", korName=" + korName + ", engName=" + engName
				+ ", birthday=" + birthday + ", gender=" + gender + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + ", nation=" + nation + ", webMail=" + webMail + ", userDiv=" + userDiv
				+ ", profileImg=" + profileImg + "]";
	}
	 
	 
}
