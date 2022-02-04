package com.us.uni.todo.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Todo {
	 private int todoNo;
	 private int userNo;
	 private String todoContent;
	 private String todoDel;
	 private String todoDate;
	 private String todoCheck;
}
