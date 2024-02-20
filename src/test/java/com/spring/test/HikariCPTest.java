package com.spring.test;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaxxer.hikari.HikariDataSource;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HikariCPTest {

	@Setter(onMethod=@__({@Autowired}))
	private HikariDataSource dataSource;
	
	@Ignore @Test
	public void test() {
		log.info("spring-test hikariCP dataSource - "+dataSource);
		try {
			
			java.sql.Connection conn = dataSource.getConnection();
			log.info("connection:"+conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
