package com.spring.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;
@WebAppConfiguration
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class TestControllerTest {

	@Autowired
	private WebApplicationContext ctx;
	 
	private MockMvc mocKMvc;
	
	@Before
	public void before() {
		this.mocKMvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
	}
	
	@Ignore @Test
	public void testString() throws Exception {
		log.info(
				mocKMvc.perform(
								MockMvcRequestBuilders.get("/test/")
									)
							.andReturn()
							.getModelAndView()
							.getModel()
							);

	}
}
