package kr.or.ddit.controller;

import java.util.ArrayList;
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
import kr.or.ddit.domain.Record;
import kr.or.ddit.service.CounselService;
import kr.or.ddit.service.RecordService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/counsel")
public class CounselController {
	@Autowired
	CounselService counselService;
	@Autowired
	RecordService recordService;
	
	/*
	 *  학생 컨트롤러
	 */
	@GetMapping("/studentside/applyList")
	public String studentCounselApplyList(Model model, int stuNo) {
	List<Counsel> professorList = this.counselService.listOfProfessor(stuNo);
		List<Counsel> allList = this.counselService.studentApplyList(stuNo);
		List<Counsel> nonFaceCounselList = new ArrayList<Counsel>();
		List<Counsel> counselList = new ArrayList<Counsel>();
		List<Record> recordList = this.recordService.RecordList(stuNo);
		for (Counsel counsel : allList) {
			log.info("리스트보자 : " + counsel.toString());
			if(counsel.getCnslType().equals("비대면") || counsel.getCnslType().equals("반려")) {
				nonFaceCounselList.add(counsel);
				model.addAttribute("nonFaceCounselList", nonFaceCounselList);
			} else if(counsel.getCnslType().equals("대면")) {
				counselList.add(counsel);
				model.addAttribute("counselList", counselList);
			}
		}
		model.addAttribute("recordList", recordList);
		model.addAttribute("professorList", professorList);
		model.addAttribute("bodyTitle","상담 내역");
		//forwarding
		return "counsel/studentside/applyList";
	}
	
	@PostMapping("/studentside/applyInsert")
	public String studentCounselApplyInsertPost(@ModelAttribute Counsel counsel) {
		log.info("어떻게들어왔는지 함보자 : " + counsel.toString());
		this.counselService.applyInsert(counsel);
		
		//forwarding
		return "redirect:/counsel/studentside/applyList?stuNo="+counsel.getStuNo();
	}
	
	@ResponseBody
	@PostMapping("/studentside/applyDetail")
	public Counsel studentCounselApplyDetail(@RequestBody Counsel counsel) {
		 Counsel counselDetail = this.counselService.applyDetail(counsel.getCnslCd());
		return counselDetail;
	}
	
	@ResponseBody
	@PostMapping("/studentside/applyModify")
	public int studentCounselApplyModify(@RequestBody Counsel counsel) {
		
		int result = this.counselService.applyModify(counsel);
		if(result == 0) {
			log.info("업데이트 실패");
			return 0;
		} else { 
			log.info("업데이트 실패");
			return result;
		}
	}
	
	@GetMapping("/studentside/checkAnswer")
	public String studentCheckAnswer(int cnslCd, Model model) {
		Counsel answerDetail = this.counselService.answerDetail(cnslCd);
		model.addAttribute("answerDetail", answerDetail);
			return "counsel/studentside/checkAnswer";
	}
	
	@GetMapping("/studentside/checkReject")
	public String studentCheckrReject(int cnslCd, Model model) {
		Counsel answerDetail = this.counselService.answerDetail(cnslCd);
		model.addAttribute("answerDetail", answerDetail);
			return "counsel/studentside/checkReject";
	}
	
	@GetMapping("/studentside/answerNote")
	public String studentCheckAnswerNote(int cnslCd, Model model) {
		Counsel answerDetail = this.counselService.answerNoteDetail(cnslCd);
		log.info("답변내용 : " + answerDetail.toString());
		model.addAttribute("answerDetail",answerDetail);
		return "counsel/studentside/answerNote";
	}
	
	@ResponseBody
	@PostMapping("/studentside/deleteApply")
	public int studentApplyDelete(@RequestBody Counsel counsel ) {
		int result = this.counselService.applyDelete(counsel.getCnslCd());
		return result;
	}
	
	/*
	 *  교수 컨트롤러
	 */
	@GetMapping("/professorside/counselList")
	public String professorCounselList(Model model, int proNo) {
		String stuNm = "";
		
		List<Counsel> allList = this.counselService.professorCounselList(proNo);
		List<Counsel> nonFaceCounselList = new ArrayList<Counsel>();
		List<Counsel> counselList = new ArrayList<Counsel>();
		for (Counsel counsel : allList) {
			stuNm = this.counselService.studentNameByCounsels(counsel.getCnslCd());
			counsel.setStuNm(stuNm);
			if(counsel.getCnslType().equals("비대면") || counsel.getCnslType().equals("반려")) {
				nonFaceCounselList.add(counsel);
//			   log.info("비대면 리스트 확인" + nonFaceCounselList);
				model.addAttribute("nonFaceCounselList", nonFaceCounselList);
			} else if(counsel.getCnslType().equals("대면")) {
				counselList.add(counsel);
				model.addAttribute("counselList", counselList);
			}
		}
		model.addAttribute("bodyTitle","상담 내역");
		//forwarding
		return "counsel/professorside/counselList";
	}
	@ResponseBody
	@PostMapping("/professorside/answer")
	public Counsel professorCounselAnswer(@RequestBody Counsel counsel) {
		Counsel answerDetail = this.counselService.answerDetail(counsel.getCnslCd());
		return answerDetail;
	}
	
	@ResponseBody
	@PostMapping("/professorside/answerModify")
	public Counsel professorCounselAnswerModify(@RequestBody Counsel counsel) {
		Counsel answerDetail = this.counselService.answerDetail(counsel.getCnslCd());
		return answerDetail;
		
	}
	
	@GetMapping("/professorside/answerNoteWriteUpdate")
	public String prefessorCounselAnswerNote(Model model, int cnslCd) {
		Counsel answerNoteDetail = this.counselService.answerNoteDetail(cnslCd);
		log.info("교수의 대면 상담 상세 : " + answerNoteDetail.toString());
		model.addAttribute("answerNoteDetail", answerNoteDetail);
		return "counsel/professorside/answerNoteWriteUpdate";
	}
	
	@ResponseBody	
	@PostMapping("/professorside/answerNoteWriteUpdate")
	public int prefessorCounselAnswerNotePost(@RequestBody Counsel counsel) {
		log.info("들어온값 확인 : " + counsel.toString());
		int result = this.counselService.answerNoteWriteUpdate(counsel);
		if(result > 0) {
			return result;
		} else {
			log.info("실패");
			return 0;
		}
	}
}
