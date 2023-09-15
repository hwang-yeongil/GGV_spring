package com.ggv.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.ggv.admin.domain.AdminResvVO;
import com.ggv.admin.domain.SalesVO;
import com.ggv.admin.domain.TheaterVO;
import com.ggv.admin.mapper.AdminMapper;
import com.ggv.member.mapper.MemberMapper;
import com.ggv.member.service.MemberServiceImpl;
import com.ggv.reservation.domain.ScreeningVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{
	@Setter
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public List<SalesVO> getSalesByMovie() {
		// TODO Auto-generated method stub
		return adminMapper.getSalesByMovie();
	}

	@Override
	public Long getTotalSales() {
		// TODO Auto-generated method stub
		return adminMapper.getTotalSales();
	}

	@Override
	public List<AdminResvVO> getAdminResv() {
		// TODO Auto-generated method stub
		return adminMapper.getAdminResv();
	}

	@Override
	public Map<String, Integer> getTheater(TheaterVO theaterVO) {
		// TODO Auto-generated method stub
		return adminMapper.getTheater(theaterVO);
	}

	@Override
	public Integer getMtitle(String m_title) {
		// TODO Auto-generated method stub
		return adminMapper.getMtitle(m_title);
	}

	@Override
	public void insertScr(ScreeningVO screeningVO) {
		// TODO Auto-generated method stub
		adminMapper.insertScr(screeningVO);
	}

	@Override
	public int getCountScr(ScreeningVO screeningVO) {
		// TODO Auto-generated method stub
		return adminMapper.getCountScr(screeningVO);
	}
}
