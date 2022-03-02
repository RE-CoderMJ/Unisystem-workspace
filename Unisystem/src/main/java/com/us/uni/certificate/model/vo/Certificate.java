package com.us.uni.certificate.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Certificate {

	private int cerNo;
	private int studNo;
	private int cerType;
	private String cerTypeT; 
	private String useFor;
	private int toType;
	private String toTypeT;
	private String toWhom;
	private String paid;
	private String status;
	private String issueDate;
	private String studName;
	private String birthday;
	private String department;
	private String studInto;
	private String studGrad;
	private int grade;
	private String engName;
	
	public Certificate() {}

	public Certificate(int cerNo, int studNo, int cerType, String cerTypeT, String useFor, int toType, String toTypeT,
			String toWhom, String paid, String status, String issueDate, String studName, String birthday,
			String department, String studInto, String studGrad, int grade, String engName) {
		super();
		this.cerNo = cerNo;
		this.studNo = studNo;
		this.cerType = cerType;
		this.cerTypeT = cerTypeT;
		this.useFor = useFor;
		this.toType = toType;
		this.toTypeT = toTypeT;
		this.toWhom = toWhom;
		this.paid = paid;
		this.status = status;
		this.issueDate = issueDate;
		this.studName = studName;
		this.birthday = birthday;
		this.department = department;
		this.studInto = studInto;
		this.studGrad = studGrad;
		this.grade = grade;
		this.engName = engName;
	}

	public int getCerNo() {
		return cerNo;
	}

	public void setCerNo(int cerNo) {
		this.cerNo = cerNo;
	}

	public int getStudNo() {
		return studNo;
	}

	public void setStudNo(int studNo) {
		this.studNo = studNo;
	}

	public int getCerType() {
		return cerType;
	}

	public void setCerType(int cerType) {
		this.cerType = cerType;
	}

	public String getCerTypeT() {
		return cerTypeT;
	}

	public void setCerTypeT(String cerTypeT) {
		this.cerTypeT = cerTypeT;
	}

	public String getUseFor() {
		return useFor;
	}

	public void setUseFor(String useFor) {
		this.useFor = useFor;
	}

	public int getToType() {
		return toType;
	}

	public void setToType(int toType) {
		this.toType = toType;
	}

	public String getToTypeT() {
		return toTypeT;
	}

	public void setToTypeT(String toTypeT) {
		this.toTypeT = toTypeT;
	}

	public String getToWhom() {
		return toWhom;
	}

	public void setToWhom(String toWhom) {
		this.toWhom = toWhom;
	}

	public String getPaid() {
		return paid;
	}

	public void setPaid(String paid) {
		this.paid = paid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	public String getStudName() {
		return studName;
	}

	public void setStudName(String studName) {
		this.studName = studName;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getEngName() {
		return engName;
	}

	public void setEngName(String engName) {
		this.engName = engName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Certificate [cerNo=");
		builder.append(cerNo);
		builder.append(", studNo=");
		builder.append(studNo);
		builder.append(", cerType=");
		builder.append(cerType);
		builder.append(", cerTypeT=");
		builder.append(cerTypeT);
		builder.append(", useFor=");
		builder.append(useFor);
		builder.append(", toType=");
		builder.append(toType);
		builder.append(", toTypeT=");
		builder.append(toTypeT);
		builder.append(", toWhom=");
		builder.append(toWhom);
		builder.append(", paid=");
		builder.append(paid);
		builder.append(", status=");
		builder.append(status);
		builder.append(", issueDate=");
		builder.append(issueDate);
		builder.append(", studName=");
		builder.append(studName);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", department=");
		builder.append(department);
		builder.append(", studInto=");
		builder.append(studInto);
		builder.append(", studGrad=");
		builder.append(studGrad);
		builder.append(", grade=");
		builder.append(grade);
		builder.append(", engName=");
		builder.append(engName);
		builder.append("]");
		return builder.toString();
	}
	
	
}
