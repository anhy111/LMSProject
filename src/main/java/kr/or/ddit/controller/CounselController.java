package kr.or.ddit.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.Counsel;
import kr.or.ddit.service.CounselService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/counsel")
public class CounselController {
	@Autowired
	CounselService counselService;
	
	/*
	 *  학생 컨트롤러
	 */
	
	@GetMapping("/studentside/applyList")
	public String studentCounselApplyList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int stuNo = (int)session.getAttribute("no");
		List<Counsel> allList = this.counselService.studentApplyList(stuNo);
		List<Counsel> nonFaceCounselList = new ArrayList<Counsel>();
		List<Counsel> counselList = new ArrayList<Counsel>();
		for (Counsel counsel : allList) {
			log.info("리스트보자 : " + counsel.toString());
			if(counsel.getCnslType().equals("비대면")) {
				nonFaceCounselList.add(counsel);
				model.addAttribute("nonFaceCounselList", nonFaceCounselList);
			} else if(counsel.getCnslType().equals("대면")) {
				counselList.add(counsel);
				model.addAttribute("counselList", counselList);
			}
		}
		//forwarding
		return "counsel/studentside/applyList";
	}
	
	@GetMapping("/studentside/applyInsert")
	public String studentCounselApplyInsert(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int stuNo = (int)session.getAttribute("no");
		List<Counsel> professorList = this.counselService.listOfProfessor(stuNo);
		for(int i = 0; i < professorList.size(); i++) {
			for (Counsel counsel : professorList) {
				log.info("교수목록 가온나: " + counsel.getEmpNm());
			}
		}
		model.addAttribute("professorList", professorList);
		//forwarding
		return "counsel/studentside/applyInsert";
	}
	
	@PostMapping("/studentside/applyInsert")
	public String studentCounselApplyInsertPost(@ModelAttribute Counsel counsel, HttpServletRequest request) throws ParseException {
		HttpSession session = request.getSession();
		int stuNo = (int)session.getAttribute("no");
		counsel.setStuNo(stuNo);
		
		String[] proNoEmpNm = counsel.getEmpNm().split("_");
		int proNo = Integer.parseInt(proNoEmpNm[0]);
		String empNm = proNoEmpNm[1];
		counsel.setProNo(proNo);
		counsel.setEmpNm(empNm);
		log.info("어떻게들어왔는지 함보자 : " + counsel.toString());
		this.counselService.applyInsert(counsel);
		
		//forwarding
		return "redirect:/counsel/studentside/applyList";
	}
	
	/*
	 *  교수 컨트롤러
	 */
	@GetMapping("/professorside/counselList")
	public String professorCounselList(Model model, HttpServletRequest request) {
		String stuNm = "";
		HttpSession session = request.getSession();
		
		int proNo = (int)session.getAttribute("no");
		List<Counsel> allList = this.counselService.professorCounselList(proNo);
		List<Counsel> nonFaceCounselList = new ArrayList<Counsel>();
		List<Counsel> counselList = new ArrayList<Counsel>();
		for (Counsel counsel : allList) {
			stuNm = this.counselService.studentNameByCounsels(counsel.getCnslCd());
			counsel.setStuNm(stuNm);
			if(counsel.getCnslType().equals("비대면")) {
				nonFaceCounselList.add(counsel);
			   log.info("비대면 리스트 확인" + nonFaceCounselList);
				model.addAttribute("nonFaceCounselList", nonFaceCounselList);
			} else if(counsel.getCnslType().equals("대면")) {
				counselList.add(counsel);
				model.addAttribute("counselList", counselList);
			}
		}
		//forwarding
		return "counsel/professorside/counselList";
	}
	@GetMapping("/professorside/answer")
	public String professorCounselAnswer(Long cnslCd, Model model) {
		log.info("글번호 : " + cnslCd);
		Counsel answerDetail = this.counselService.answerDetail(cnslCd);
		log.info("함보자 : ", answerDetail.getCnslRpl());
		model.addAttribute("answerDetail", answerDetail);
		return "counsel/professorside/answer";
	}
	
	@GetMapping("/professorside/answerModify")
	public String professorCounselAnswerModify(Long cnslCd, Model model) {
		log.info("글번호 : " + cnslCd);
		Counsel answerDetail = this.counselService.answerDetail(cnslCd);
		log.info("함보자 : ", answerDetail.getCnslRpl());
		model.addAttribute("answerDetail", answerDetail);
		return "counsel/professorside/answerModify";
		
	}
	
	@PostMapping("/professorside/answer")
	public String professorCounselAnswerPost(@RequestBody Counsel counsel, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		counsel.setProNo(proNo);
		log.info("답변 세팅 어케됐누?: " + counsel.toString());
		this.counselService.applyAnswerUpdate(counsel);
		
		return "success";
	}
}
