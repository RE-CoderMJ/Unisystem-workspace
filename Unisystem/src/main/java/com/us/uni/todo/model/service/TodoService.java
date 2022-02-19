package com.us.uni.todo.model.service;

import java.util.ArrayList;

import com.us.uni.todo.model.vo.Todo;

public interface TodoService {

	int todoInsert(Todo a);
	ArrayList<Todo> todoSelect(int tuserNo);
	int todoDelete(Todo a);
	int todoCheck(Todo a);

}
