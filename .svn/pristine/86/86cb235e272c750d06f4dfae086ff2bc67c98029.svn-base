package com.ggv.admin.service;

import java.util.List;
import java.util.Map;

import com.ggv.admin.domain.AdminResvVO;
import com.ggv.admin.domain.SalesVO;
import com.ggv.admin.domain.TheaterVO;
import com.ggv.reservation.domain.ScreeningVO;

public interface AdminService {
	public List<SalesVO> getSalesByMovie();
	
	public Long getTotalSales();
	
	public List<AdminResvVO> getAdminResv();
	
	public Map<String, Integer> getTheater(TheaterVO theaterVO);
	public Integer getMtitle(String m_title);
	public void insertScr(ScreeningVO screeningVO);
	public int getCountScr(ScreeningVO screeningVO);
}
