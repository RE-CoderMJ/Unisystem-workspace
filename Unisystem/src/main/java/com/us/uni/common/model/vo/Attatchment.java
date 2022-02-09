package com.us.uni.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Attatchment {
	
	 private int attachNo;
	 private String refType;
	 private int refNo;
	 private String originName;
	 private String changeName;
	 private String path;
	 private String status;


}
