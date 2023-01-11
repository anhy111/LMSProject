package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Building;
import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Room;
import kr.or.ddit.domain.Subject;
import kr.or.ddit.domain.Weekplan;
import kr.or.ddit.service.ApprovalService;
import kr.or.ddit.service.BuildingService;
import kr.or.ddit.service.LectureApplyService;
import kr.or.ddit.service.RoomService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/professor")
@EnableTransactionManagement
public class LectureApplyController {
	
  @Autowired
  private LectureApplyService lectureApplyService;
  @Autowired
  private ApprovalService approvalService;
  @Autowired
  private BuildingService buildingService;
  @Autowired
  private RoomService roomService;
  
  	//강의계획서 조회 페이지
	@GetMapping("/lecApply/inquiry")
	public String inquiry(Model model) {
		
		model.addAttribute("bodyTitle", "강의계획서 관리");
		
		return "professor/lecApply/inquiry";
	}
	
	//강의계획서 신청 페이지
	@GetMapping("/lecApply/request")
	public String write() {
		
		return "professor/lecApply/request";
	}
	
	// 교수 개인정보
	@ResponseBody
	@PostMapping("/lecApply/proInfo")
	public Professor proInfo(HttpServletRequest request) {
		
		log.info("이쪽은 오나?");

		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("개인정보proNo : " + proNo);

		Professor professor = this.lectureApplyService.proInfo(proNo);
		log.info("교수개인professor : " + professor);

		return professor;
	}
	
	//년도 및 학기 불러오기
	@ResponseBody
	@PostMapping("/lecApply/getYrNSem")
	public List<LecApply> getYrNSem(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("년도/학기proNo : " + proNo);
		
		List<LecApply> list = this.lectureApplyService.getYrNSem(proNo);
		
		return list;
	}
	
	//제출한 강의계획서 리스트 불러오기
	@ResponseBody
	@PostMapping("/lecApply/list")
	public List<LecApply> list(HttpServletRequest request) {
		
		log.info("리스트 들어와라");
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("리스트proNo : " + proNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("proNo", proNo);
		
		List<LecApply> list = this.lectureApplyService.list(map);
		
		log.info("list : " + list);
		
		return list;
	}
	
	//강의계획서 리스트 년도/학기별 불러오기
	@ResponseBody
	@PostMapping("/lecApply/getListAgain")
	public List<LecApply> getListAgain(HttpServletRequest request,
			@RequestBody Map<String, Object> yrNsem) {
		
		log.info("어게인리스트 들어와라");
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("어게인리스트proNo : " + proNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("proNo", proNo);
		map.put("yrNsem", yrNsem.get("yrNsem"));
		
		List<LecApply> list = this.lectureApplyService.list(map);
		
		log.info("list : " + list);
		
		return list;
	}
	
	//제출한 강의계획서 개수 가져오기
	@ResponseBody
	@PostMapping("/lecApply/getCnt")
	public int getCnt(
			HttpServletRequest request,
			@RequestBody Map<String, Object> yrNsem) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo",""+ proNo);
		map.put("yrNsem", yrNsem.get("yrNsem"));
		
		log.info("getCnt map : " + map);
		
		int result = this.lectureApplyService.getCnt(map);
		
		log.info("getCnt result : " + result);
		
		return result;
	}
	
	//강의계획서 상세페이지 통합
	@GetMapping("/lecApplyForm/inquiryForm")
	public String inquiryForm(HttpServletRequest request, Model model, int lecaCd) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("상세proNo : " + proNo);
		log.info("상세 계획서 코드 : " + lecaCd);
		
		Professor professor = this.lectureApplyService.inquiryFormProInfo(proNo);
		List<LecApply> lecApplyList = this.lectureApplyService.inquiryFormLecApInfo(lecaCd);
		List<Weekplan> weekPlanList = this.lectureApplyService.inquiryWeekPlan(lecaCd);
		List<Building> buildingList = this.buildingService.buildingByProfessorList(proNo);
		
		model.addAttribute("professor", professor);
		model.addAttribute("lecApplyList", lecApplyList);
		model.addAttribute("weekPlanList", weekPlanList);
		model.addAttribute("buildingList",buildingList);
		
		log.info("상세professor : " + professor);
		log.info("상세lecApplyList : " + lecApplyList);
		log.info("상세weekPlanList : " + weekPlanList);
		
		return "professor/lecApplyForm/inquiryForm";
	}
	
	//강의계획서 작성 버튼 폼페이지
	@GetMapping("/lecApplyForm/requestForm")
	public String requestForm(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("신청proNo : " + proNo);
		
		Professor professor = this.lectureApplyService.inquiryFormProInfo(proNo);
		List<Building> buildingList = this.buildingService.buildingByProfessorList(proNo);
		
		model.addAttribute("professor", professor);
		model.addAttribute("buildingList",buildingList);
		
		log.info("신청professor : " + professor);

		return "professor/lecApplyForm/requestForm";
	}
	
	//강의계획서 작성 후 제출하기
	@ResponseBody
	@PostMapping("/lecApplyForm/lecApplySubmit")
	@Transactional
	public int lecApplySubmit(HttpServletRequest request
			, @RequestBody LecApply lecApply) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		lecApply.setProNo(proNo);
		lecApply.setLecaYn(0);
		log.info("제출 proNo : " + proNo);
		log.info("담긴값들은? : " + lecApply);
		
		//1. lecture 테이블에 값 넣기
		int lectureResult = this.lectureApplyService.lectureSubmit(lecApply);
		
		if (lectureResult < 0) {
			log.info("lecture실패");
			new RuntimeException();
		}
		//2. lec_apply 테이블에 값 넣기
		int lecApplyResult = this.lectureApplyService.lecApplySubmit(lecApply);

		if (lecApplyResult < 0) {
			log.info("lecApply실패");
			new RuntimeException();
		}
		//3. weekplan 테이블에 값 넣기
		List<Weekplan> weekPlanList = lecApply.getWeekPlanList();
		log.info("임시저장 weekPlan : " + weekPlanList);
		
		int weekPlanResult = this.lectureApplyService.weekPlanSubmit(weekPlanList);
		
		if (weekPlanResult < 0) {
			log.info("weekPlan실패");
			new RuntimeException();
		}
		
		Approval approval = new Approval();
		approval.setProNo(proNo);
		approval.setApprTagCd(lecApply.getLecaCd());
		approval.setApprCate("APC001");
		
		log.info("Approval : " + approval);
		int approvalResult = this.approvalService.insertApproval(approval);
		if(approvalResult <= 0) {
			log.info("approval실패");
			new RuntimeException();
		}
		
		return lectureResult + lecApplyResult ; //weekPlanResult;
	}
	
	//강의계획서 작성 도중 임시저장
	@ResponseBody
	@PostMapping("/lecApplyForm/temporarySubmit")
	@Transactional
	public int temporarySubmit(HttpServletRequest request
			, @RequestBody LecApply lecApply) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		lecApply.setProNo(proNo);
		lecApply.setLecaYn(3);
		log.info("제출 proNo : " + proNo);
		log.info("담긴값들은? : " + lecApply);
		
		//1. lecture 테이블에 값 넣기
		int lectureResult = this.lectureApplyService.lectureSubmit(lecApply);
		
		if (lectureResult < 0) {
			log.info("lecture실패");
			return 0;
		}
		//2. lec_apply 테이블에 값 넣기
		int lecApplyResult = this.lectureApplyService.lecApplyTempSubmit(lecApply);

		if (lecApplyResult < 0) {
			log.info("lecApply실패");
			return 0;
		}
		//3. weekplan 테이블에 값 넣기
		List<Weekplan> weekPlanList = lecApply.getWeekPlanList();
		log.info("임시저장 weekPlan : " + weekPlanList);
		
		int weekPlanResult = this.lectureApplyService.weekPlanSubmit(weekPlanList);
		
		if (weekPlanResult < 0) {
			log.info("weekPlan실패");
			return 0;
		}
		return lecApplyResult;
	}
	
	//임시저장 리스트
	@ResponseBody
	@PostMapping("/lecApply/getTempList")
	public List<LecApply> getTempList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("임시저장리스트proNo : " + proNo);
		
		List<LecApply> list = this.lectureApplyService.tempList(proNo);
		
		log.info("임시저장 리스트 : " + list);
		
		return list;
	}
	
	//임시저장 강의계획서 상세페이지 통합
	@GetMapping("/lecApplyForm/tempForm")
	public String tempForm(HttpServletRequest request, Model model, int lecaCd) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("임시저장 상세proNo : " + proNo);
		log.info("임시저장 상세 계획서 코드 : " + lecaCd);
		
		Professor professor = this.lectureApplyService.inquiryFormProInfo(proNo);
		List<LecApply> lecApplyList = this.lectureApplyService.tempFormLecApInfo(lecaCd);
		List<Weekplan> weekPlanList = this.lectureApplyService.inquiryWeekPlan(lecaCd);
		List<Building> buildingList = this.buildingService.buildingByProfessorList(proNo);
		
		model.addAttribute("professor", professor);
		model.addAttribute("lecApplyList", lecApplyList);
		model.addAttribute("weekPlanList", weekPlanList);
		model.addAttribute("buildingList", buildingList);
		
		log.info("임시저장 상세professor : " + professor);
		log.info("임시저장 상세lecApplyList : " + lecApplyList);
		log.info("임시저장 상세weekPlanList : " + weekPlanList);
		
		return "professor/lecApplyForm/tempForm";
	}
	
	//임시저장된 강의계획서 수정하기
	@ResponseBody
	@PostMapping("/lecApplyForm/temporaryUpdate")
	@Transactional
	public int temporaryUpdate(@RequestBody LecApply lecApply) {
		
		log.info("수정된 담긴값들은? : " + lecApply);
		
		//1. lecture 테이블에 값 넣기
		lecApply.setLecaYn(3);
		int lectureResult = this.lectureApplyService.lectureUpdate(lecApply);
		
		if (lectureResult < 0) {
			log.info("lecture실패");
			return 0;
		}
		//2. lec_apply 테이블에 값 넣기
		int lecApplyResult = this.lectureApplyService.lecApplyUpdate(lecApply);

		if (lecApplyResult < 0) {
			log.info("lecApply실패");
			return 0;
		}
		//3. weekplan 테이블에 값 넣기
		List<Weekplan> weekPlanList = lecApply.getWeekPlanList();
		log.info("임시저장 weekPlan : " + weekPlanList);
		
		int weekPlanResult = this.lectureApplyService.weekPlanUpdate(weekPlanList);
		
		if (weekPlanResult != -1) {
			log.info("weekPlanResult : " + weekPlanResult);
			log.info("weekPlan실패");
			return 0;
		}
		return lectureResult + lecApplyResult + weekPlanResult;
	}
	
	//임시저장된 강의계획서 삭제하기
	@ResponseBody
	@PostMapping("/lecApplyForm/temporaryDelete")
	@Transactional
	public int temporaryDelete(int lecaCd) {
		
		log.info("삭제코드 오나욘? : " + lecaCd);
		
		int deleteLecApplyResult = this.lectureApplyService.deleteLecApply(lecaCd);
		
		if(deleteLecApplyResult <= 0) {
			log.info("강의계획서 삭제 실패");
			new RuntimeException();
		}
		
		Approval approval = new Approval();
		approval.setApprCate("APC001");
		approval.setApprTagCd(lecaCd);
		return this.approvalService.deleteApproval(approval);
	}
	
	//임시저장된 강의계획서 제출하기
	@ResponseBody
	@PostMapping("/lecApplyForm/tempLecApplySubmit")
	@Transactional
	public int tempLecApplySubmit(@RequestBody LecApply lecApply, HttpServletRequest req) {
		
		log.info("수정된 담긴값들은? : " + lecApply);
		
		//1. lecture 테이블에 값 넣기
		lecApply.setLecaYn(0);
		int lectureResult = this.lectureApplyService.lectureUpdate(lecApply);
		
		if (lectureResult < 0) {
			log.info("lecture실패");
			return 0;
		}
		//2. lec_apply 테이블에 값 넣기
		int lecApplyResult = this.lectureApplyService.temporarySubmit(lecApply);

		if (lecApplyResult < 0) {
			log.info("lecApply실패");
			return 0;
		}
		//3. weekplan 테이블에 값 넣기
		List<Weekplan> weekPlanList = lecApply.getWeekPlanList();
		log.info("임시저장 weekPlan : " + weekPlanList);
		
		int weekPlanResult = this.lectureApplyService.weekPlanUpdate(weekPlanList);
		
		if (weekPlanResult != -1) {
			log.info("weekPlan실패");
			return 0;
		}
		
		int proNo = (int)req.getSession().getAttribute("no");
		
		Approval approval = new Approval();
		approval.setProNo(proNo);
		approval.setApprTagCd(lecApply.getLecaCd());
		approval.setApprCate("APC001");
		int approvalResult = this.approvalService.insertApproval(approval);
		if(approvalResult <= 0) {
			log.info("approval실패");
			return 0;
		}
		
		return lecApplyResult;
	}
	
	//과목명 리스트 불러오기
	@ResponseBody
	@PostMapping("/lecApplyForm/getSubList")
	public List<Subject> getSubList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("과목 proNo : " + proNo);
		
		List<Subject> list = this.lectureApplyService.subList(proNo);
		
		log.info("과목list : " + list);
		
		return list;
	}
	
	//과목번호 리스트 불러오기
	@ResponseBody
	@PostMapping("/lecApplyForm/getSubCdList")
	public int getSubCdList(HttpServletRequest request
			, @RequestBody String subNm) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		subNm = subNm.replaceAll("\"", "");
		
		log.info("subNm2 : 	" + subNm);
		
		log.info("type : " + subNm.getClass().getName());
		
		int subCd = this.lectureApplyService.getSubCdList(subNm);
		
		log.info("과목번호 subCd : " + subCd);
		
		return subCd;
	}
	
	@ResponseBody
	@GetMapping("/lecApplyForm/roomByBuildingList")
	public List<Room> lecApplyForm(int bldCd){
		return this.roomService.roomByBuildingList(bldCd);
	}
	
	@ResponseBody
	@GetMapping("/lecApplyForm/alreadyTimeTableList")
	public List<LecApply> alreadyTimeTableList(LecApply lecApply){
		log.info("alreadyTimeTableList.lecApply : " + lecApply);
		return this.lectureApplyService.alreadyTimeTableList(lecApply);
	}
	
}
