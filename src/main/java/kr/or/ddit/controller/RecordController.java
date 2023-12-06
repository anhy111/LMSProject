package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.CommonDetail;
import kr.or.ddit.domain.Record;
import kr.or.ddit.domain.Student;
import kr.or.ddit.service.CommonDetailService;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.RecordService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/record")
@PreAuthorize("hasAnyRole('ROLE_PROFESSOR', 'ROLE_STUDENT', 'ROLE_MANAGER')")
public class RecordController {

	@Autowired
	RecordService recordService;
	@Autowired
	CommonDetailService commonDetailService;
	@Autowired
	MemberService memberService;
	
	@GetMapping("/main")
	public String RecordList(Model model, int stuNo,HttpSession session) {
		int memNo = (int)session.getAttribute("no");
		Student student = this.memberService.readStudent(memNo);
		List<Record> recordsList = this.recordService.RecordList(stuNo);
		//공통 약속
		log.info("정보 봅시다 : " + student.toString());
		model.addAttribute("student", student);
		model.addAttribute("bodyTitle","학적 변동 내역");
		model.addAttribute("recordsList",recordsList);
		
		//forwarding
		return "record/main";
	}
	
	@PostMapping("/applyPost")
	public String RecordApplyPost(@ModelAttribute Record record) {
		
		List<CommonDetail> commonDetailList = this.commonDetailService.commonDetailList("APPROVAL");
		for (CommonDetail commonDetail : commonDetailList) {
			if(commonDetail.getComdNm().equals("승인대기")) {
				record.setRecYn(commonDetail.getComdCd());
			}
		}
		log.info("들어온 값 : " + record.toString());
		int result = this.recordService.RecordApply(record);
		if (result == 0 ) {
			log.info("등록실패");
		} else {
			log.info("등록성공");
		}
		return "redirect:/record/main?stuNo="+record.getStuNo();
	}
	
	@ResponseBody
	@PostMapping("/applyDetail")
	public Record RecordDetail(@RequestBody Record record) {
		Record resultRecord = new Record();
		resultRecord = this.recordService.detailRecord(record.getRecCd());
		return resultRecord; 
	}
	
	
	@ResponseBody
	@PostMapping("/applyModify")
	public int RecordApplyModify(@RequestBody Record record) {
		log.info("들어왔니? " + record.toString());
		int result = this.recordService.modifyRecordByStudent(record);
		if (result == 0 ) {
			log.info("등록실패");
		} else {
			log.info("등록성공");
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/applyDelete")
	public int RecordApplyDelete(@RequestBody Record record) {
		int result = this.recordService.deleteRecordByStudent(record.getRecCd());
		if (result == 0 ) {
			log.info("등록실패");
		} else {
			log.info("등록성공");
		}
		return result;
	}
	
	
	
	
	
	
	
}
