package com.spring.test;

import org.junit.Ignore;
import org.junit.Test;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import lombok.extern.log4j.Log4j;

@Log4j
public class JsonTest {

	
	@Ignore @Test 
	public void jsonMade() {
		log.info("jsonMade()");
		//갈아껴짐..
		JsonObject student = new JsonObject();
		JsonArray studentList = new JsonArray();
		JsonObject jsonClass = new JsonObject();
		
		student.addProperty("name", "정윤");
		student.addProperty("age", 27);
		studentList.add(student);
		System.out.println(student);
		
		student.addProperty("name", "정윤");
		student.addProperty("age", 26);
		studentList.add(student);
		System.out.println(student);

		System.out.println(new Gson().toJson(studentList));

		for(int i=0; i<studentList.size(); i++) {
			//System.out.println(student);
		}
		
	}
	public JsonObject getStudent(int index, JsonArray studentList) {
		return studentList.get(index).getAsJsonObject();
	}
	

}
