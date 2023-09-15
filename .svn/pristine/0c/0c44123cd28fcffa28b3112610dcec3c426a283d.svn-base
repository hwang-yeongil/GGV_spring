package com.ggv.admin.mapper;

import static org.junit.Assert.assertNotNull;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ggv.admin.domain.TheaterVO;
import com.ggv.member.mapper.MemberMapperTests;
import com.ggv.reservation.domain.ScreeningVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminMapperTests {
	@Setter
	@Autowired
	private AdminMapper adminmapper;
	
	@Test
	public void testExist() {
		assertNotNull(adminmapper);
	}
	
	@Test
	public void testGetSalesByMovie() {
		adminmapper.getSalesByMovie().forEach(log::info);
	}
	
	@Test
	public void testGetTotalSales() {
		log.info(adminmapper.getTotalSales());
	}
	
	@Test
	public void testGetTheater() {
		TheaterVO theaterVO = new TheaterVO("3관", 1);
		log.info(theaterVO);
		log.info(adminmapper.getTheater(theaterVO));
	}
	
	@Test
	public void testGetMtitle() {
		log.info(adminmapper.getMtitle("조커"));
	}
	
	@Test
	public void testInsertScr() {
		TheaterVO theaterVO = new TheaterVO("3관", 1);
		Map<String, Integer> map = new HashMap<>();
		map = adminmapper.getTheater(theaterVO);
		ScreeningVO screeningVO = new ScreeningVO();
		screeningVO.setScr_date("11/02/2019");
		screeningVO.setScr_time("09:00");
		screeningVO.setTheater_pk_no(map.get("theater_pk_no"));
		screeningVO.setAud_pk_no(map.get("aud_pk"));
		screeningVO.setMovie_pk_no(1);
		log.info(map);
		log.info(map.get("theater_pk_no"));
		log.info(screeningVO);
		adminmapper.insertScr(screeningVO);
	}
	
	@Test
	public void testGetCountScr() {
		TheaterVO theaterVO = new TheaterVO("3관", 1);
		Map<String, Integer> map = new HashMap<>();
		map = adminmapper.getTheater(theaterVO);
		ScreeningVO screeningVO = new ScreeningVO();
		screeningVO.setScr_date("11/02/2019");
		screeningVO.setScr_time("09:00");
		screeningVO.setTheater_pk_no(map.get("theater_pk_no"));
		screeningVO.setAud_pk_no(map.get("aud_pk"));
		screeningVO.setMovie_pk_no(1);
		adminmapper.getCountScr(screeningVO);
	}
}
