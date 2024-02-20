 package com.spring.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.dto.DetailSearchDTO;
import com.spring.dto.EnterpriseDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WeddingMapperTest {
	@Setter(onMethod=@__({@Autowired}))
	WeddingMapper mapper;
	
	
	@Ignore @Test
	public void selectEntListAll() {
		List<EnterpriseDTO> list = new ArrayList<>();
		list = mapper.selectEntListAll();
		for(EnterpriseDTO dto : list) {
			log.info("업체이름"+dto.getEnt_name());
		}		
	}
	
	
	@Test
	public void detailSearchTest() {
		DetailSearchDTO dto = new DetailSearchDTO();
		dto.setRegion("");
		dto.setSeason("peak");
		dto.setMax("300");
		dto.setMin("10");
		dto.setEnt_code("dress");
		List<EnterpriseDTO> list = new ArrayList<>();
		list = 	mapper.returnEntSearchResult(dto);
		for(EnterpriseDTO dto1 : list) {
			log.info("업체이름"+dto1.getEnt_name());
		}		
	}
}
