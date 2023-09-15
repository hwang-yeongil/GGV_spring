package com.ggv.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ggv.admin.domain.TheaterVO;
import com.ggv.admin.service.AdminService;
import com.ggv.member.controller.MemberController;
import com.ggv.member.service.MemberService;
import com.ggv.member.service.MemberServiceImpl;
import com.ggv.reservation.domain.ScreeningVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {
	@Setter
	@Autowired
	private MemberService service;
	@Setter @Autowired
	private AdminService adminService;
	
	@GetMapping("/sales")
	public String sales(Model model, HttpSession session) {
		if(session.getAttribute("loginStat") != null) {
			model.addAttribute("salesList", adminService.getSalesByMovie());
			model.addAttribute("totalSales", adminService.getTotalSales());
			return "admin/adminPageSales";
		}else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/resv")
	public String resv(Model model, HttpSession session) {
		if(session.getAttribute("loginStat") != null) {
			model.addAttribute("resvList", adminService.getAdminResv());
			return "admin/adminPageResv";
		} else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/users")
	public String users(Model model, HttpSession session) {
		if(session.getAttribute("loginStat") != null) {
			model.addAttribute("memberList", service.getMemberList());
			return "admin/adminPageUsers";
		} else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/regist")
	public String regist(Model model, HttpSession session) {
		if(session.getAttribute("loginStat") != null) {
			return "admin/adminPageRegist";
		} else {
			return "redirect:/";
		}
	}
	
	@PostMapping("/regist")
	public String registPost(Integer m_title, Integer theater_pk, String aud_name, String date, String time, Model model, HttpSession session) {
		if(session.getAttribute("loginStat") != null) {
			TheaterVO theaterVO = new TheaterVO(aud_name, theater_pk);
			Map<String, Integer> map = new HashMap<>();
			map = adminService.getTheater(theaterVO);
			ScreeningVO screeningVO = new ScreeningVO();
			screeningVO.setScr_date(date);
			screeningVO.setScr_time(time);
			screeningVO.setTheater_pk_no(map.get("theater_pk_no"));
			screeningVO.setAud_pk_no(map.get("aud_pk"));
			screeningVO.setMovie_pk_no(m_title);
			
			if(adminService.getCountScr(screeningVO) == 1) {
				log.info("중복존재");
				model.addAttribute("isScr", 1);
				return "admin/adminPageRegist";
			} else {
				adminService.insertScr(screeningVO);
				return "redirect:/admin/regist";
			}
		} else {
			return "redirect:/";
		}
	}
}
