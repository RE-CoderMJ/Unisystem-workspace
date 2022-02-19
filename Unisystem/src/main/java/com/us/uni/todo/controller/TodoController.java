package com.us.uni.todo.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.us.uni.todo.model.service.TodoService;
import com.us.uni.todo.model.vo.Todo;

@Controller
public class TodoController {

	@Autowired
	private TodoService tService;
	
	
	@ResponseBody
	@RequestMapping(value="todoInsert", produces="application/json; charset=utf-8")
	public int ajaxTodoInsert(Todo a) {
		
		int result = tService.todoInsert(a);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="todoSelect", produces="application/json; charset=utf-8")
	public String ajaxTodoSelect(int tuserNo) {
		
		ArrayList<Todo> list = tService.todoSelect(tuserNo);
		//System.out.println(list);
		return new Gson().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="todoDelete", produces="application/json; charset=utf-8")
	public int ajaxTodoDelete(Todo a) {
		
		//System.out.println(a);
		int result = tService.todoDelete(a);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="todoCheck", produces="application/json; charset=utf-8")
	public int ajaxTodoCheck(Todo a) {
		
		//System.out.println(a);
		int result = tService.todoCheck(a);
		
		return result;
	}
	
	
}
