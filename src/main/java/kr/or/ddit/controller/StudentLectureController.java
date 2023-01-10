package kr.or.ddit.controller;

import java.security.Principal;
import java.util.List;

import kr.or.ddit.domain.*;
import kr.or.ddit.domain.student.StudentLectureForm;
import kr.or.ddit.service.LectureBoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.CollegeService;
import kr.or.ddit.service.LectureService;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@RequestMapping("/student/lecture")
@Slf4j
@Controller
public class StudentLectureController {
	
	@Autowired
	LectureService lectureService;
	@Autowired
	CollegeService collegeService;

	private final LectureBoardService lectureBoardService;


	@PreAuthorize("hasAnyRole('ROLE_STUDENT','ROLE_MANAGER')")
	@GetMapping("/list")
	public String list(Model model) {
		List<College> collegeList = this.collegeService.CollegeList();
		
		model.addAttribute("collegeList",collegeList);
		model.addAttribute("bodyTitle","수강편람");
		return "student/lecture/lectureList";
	}
	
	@ResponseBody
	@GetMapping("/searchList")
	public List<Lecture> searchList(StudentLecture studnLecture){
		log.info("studnLecture : " + studnLecture);
		
		return this.lectureService.searchList(studnLecture);
	}
	
	@ResponseBody
	@GetMapping("/departmentByCollege")
	public List<Department> departmentByCollege(int colCd){
		log.info("colCd : " + colCd);
		return this.collegeService.DepartmentByCollegeList(colCd);
	}

	@GetMapping("/myLecture")
	public String myLecture(Model model, Principal principal) {

		//로그인 아이디(세션) 가져오기.
		String studentId = principal.getName();
		List<StudentLectureForm> lectureList = lectureService.studentLectureSearchAll(studentId);
		log.info(lectureList.toString());

		model.addAttribute("lectureList", lectureList);

		return "student/lecture/myLecture";
	}

	@GetMapping("studentList")
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	public String stuAttend2(Model model, String lecaCd) {

		log.info(lecaCd);
		LecApply lecApplySearch = lectureBoardService.lecApplySearch(lecaCd);
		model.addAttribute("data", lecApplySearch);
		return "lectureBoard/score/totalScore2";
	}
}
