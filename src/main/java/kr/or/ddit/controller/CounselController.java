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
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String studentCounselApplyList(Model model, int stuNo) {
		
		List<Counsel> allList = this.counselService.studentApplyList(stuNo);
		List<Counsel> nonFaceCounselList = new ArrayList<Counsel>();
		List<Counsel> counselList = new ArrayList<Counsel>();
		for (Counsel counsel : allList) {
//			log.info("리스트보자 : " + counsel.toString());
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
	public String studentCounselApplyInsert(Model model,  int stuNo) {
//		HttpSession session = request.getSession();
//		int stuNo = (int)session.getAttribute("no");
		List<Counsel> professorList = this.counselService.listOfProfessor(stuNo);
		for(int i = 0; i < professorList.size(); i++) {
			for (Counsel counsel : professorList) {
//				log.info("교수목록 가온나: " + counsel.getEmpNm());
			}
		}
		model.addAttribute("professorList", professorList);
		//forwarding
		return "counsel/studentside/applyInsert";
	}
	
	@PostMapping("/studentside/applyInsert")
	public String studentCounselApplyInsertPost(@ModelAttribute Counsel counsel, HttpServletRequest request) {
		log.info("학번 : " + counsel.getStuNo());
		String[] proNoEmpNm = counsel.getEmpNm().split("_");
		int proNo = Integer.parseInt(proNoEmpNm[0]);
		counsel.setProNo(proNo);
//		log.info("어떻게들어왔는지 함보자 : " + counsel.toString());
		this.counselService.applyInsert(counsel);
		
		//forwarding
		return "redirect:/counsel/studentside/applyList?stuNo="+counsel.getStuNo();
	}
	
	@GetMapping("/studentside/applyModify")
		public String studentApplyModify(Long cnslCd, Model model) {
//		log.info("글번호 : " + cnslCd);
		Counsel answerDetail = this.counselService.answerDetail(cnslCd);
//		log.info("함보자 : ", answerDetail.getCnslRpl());
		model.addAttribute("answerDetail", answerDetail);
		return "counsel/studentside/applyModify";
	}
	
	@ResponseBody
	@PostMapping("/studentside/applyModify")
	public int studentApplyModifyPost(@RequestBody Counsel counsel) {
		log.info("아작스고고" + counsel.toString());
		int result = this.counselService.applyModify(counsel);
		log.info("result " + result);
		if(result < 0) {
			log.info("실패ㅜ");
			return 0;
		} else {
			log.info("성공!");
			return 1;
		}
	}
	
	
	@GetMapping("/studentside/checkAnswer")
	public String studentCheckAnswer(Long cnslCd, Model model) {
//		log.info("글번호 : " + cnslCd);
		Counsel answerDetail = this.counselService.answerDetail(cnslCd);
//		log.info("함보자 : ", answerDetail.getCnslRpl());
		model.addAttribute("answerDetail", answerDetail);
		return "counsel/studentside/checkAnswer";
		
	}
	
	@GetMapping("/studentside/answerNote")
	public String studentCheckAnswerNote(Long cnslCd, Model model) {
		Counsel answerDetail = this.counselService.answerNoteDetail(cnslCd);
		log.info("답변내용 : " + answerDetail.toString());
		model.addAttribute("answerDetail",answerDetail);
		return "counsel/studentside/answerNote";
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
//			   log.info("비대면 리스트 확인" + nonFaceCounselList);
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
//		log.info("글번호 : " + cnslCd);
		Counsel answerDetail = this.counselService.answerDetail(cnslCd);
//		log.info("함보자 : ", answerDetail.getCnslRpl());
		model.addAttribute("answerDetail", answerDetail);
		return "counsel/professorside/answer";
	}
	
	@GetMapping("/professorside/answerModify")
	public String professorCounselAnswerModify(Long cnslCd, Model model) {
//		log.info("글번호 : " + cnslCd);
		Counsel answerDetail = this.counselService.answerDetail(cnslCd);
//		log.info("함보자 : ", answerDetail.getCnslRpl());
		model.addAttribute("answerDetail", answerDetail);
		return "counsel/professorside/answerModify";
		
	}
	@ResponseBody
	@PostMapping("/professorside/answer")
	public String professorCounselAnswerPost(@RequestBody Counsel counsel, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		counsel.setProNo(proNo);
//		log.info("답변 세팅 어케됐누?: " + counsel.toString());
		this.counselService.applyAnswerUpdate(counsel);
//		log.info("업뎃성공했나여?");
		return "success";
	}
	
	@GetMapping("/professorside/answerNote")
	public String prefessorCounselAnswerNote(Model model, Long cnslCd) {
		Counsel answerNoteDetail = this.counselService.answerNoteDetail(cnslCd);
		log.info("교수의 대면 상담 상세 : " + answerNoteDetail.toString());
		model.addAttribute("answerNoteDetail", answerNoteDetail);
		return "counsel/professorside/answerNote";
	}
}
