package com.us.uni.todo.model.vo;


public class Todo {
	 private int todoNo;
	 private int tuserNo;
	 private String todoContent;
	 private String todoDel;
	 private String todoDate;
	 private String todoCheck;
	 
	 public Todo() {}

	public Todo(int todoNo, int tuserNo, String todoContent, String todoDel, String todoDate, String todoCheck) {
		super();
		this.todoNo = todoNo;
		this.tuserNo = tuserNo;
		this.todoContent = todoContent;
		this.todoDel = todoDel;
		this.todoDate = todoDate;
		this.todoCheck = todoCheck;
	}

	public int getTodoNo() {
		return todoNo;
	}

	public void setTodoNo(int todoNo) {
		this.todoNo = todoNo;
	}

	public int getTuserNo() {
		return tuserNo;
	}

	public void setTuserNo(int tuserNo) {
		this.tuserNo = tuserNo;
	}

	public String getTodoContent() {
		return todoContent;
	}

	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}

	public String getTodoDel() {
		return todoDel;
	}

	public void setTodoDel(String todoDel) {
		this.todoDel = todoDel;
	}

	public String getTodoDate() {
		return todoDate;
	}

	public void setTodoDate(String todoDate) {
		this.todoDate = todoDate;
	}

	public String getTodoCheck() {
		return todoCheck;
	}

	public void setTodoCheck(String todoCheck) {
		this.todoCheck = todoCheck;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Todo [todoNo=");
		builder.append(todoNo);
		builder.append(", tuserNo=");
		builder.append(tuserNo);
		builder.append(", todoContent=");
		builder.append(todoContent);
		builder.append(", todoDel=");
		builder.append(todoDel);
		builder.append(", todoDate=");
		builder.append(todoDate);
		builder.append(", todoCheck=");
		builder.append(todoCheck);
		builder.append("]");
		return builder.toString();
	}
	 
	 
}
