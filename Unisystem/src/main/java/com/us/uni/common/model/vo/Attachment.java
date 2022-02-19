package com.us.uni.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Attachment {
	
	 private int attachNo;
	 private String refType;
	 private int refNo;
	 private String originName;
	 private String changeName;
	 private String path;
	 private String status;
	 
	 public Attachment() {}
	 
	 public Attachment(int attachNo, String refType, int refNo, String originName, String changeName, String path,
			String status) {
		super();
		this.attachNo = attachNo;
		this.refType = refType;
		this.refNo = refNo;
		this.originName = originName;
		this.changeName = changeName;
		this.path = path;
		this.status = status;
	}

	public int getAttachNo() {
		return attachNo;
	}

	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}

	public String getRefType() {
		return refType;
	}

	public void setRefType(String refType) {
		this.refType = refType;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Attachment [attachNo=");
		builder.append(attachNo);
		builder.append(", refType=");
		builder.append(refType);
		builder.append(", refNo=");
		builder.append(refNo);
		builder.append(", originName=");
		builder.append(originName);
		builder.append(", changeName=");
		builder.append(changeName);
		builder.append(", path=");
		builder.append(path);
		builder.append(", status=");
		builder.append(status);
		builder.append("]");
		return builder.toString();
	}
	 
	 
	


}
