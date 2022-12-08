package kr.or.ddit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.StudentLecture;
import kr.or.ddit.service.DepartmentService;
import kr.or.ddit.service.LectureApplyService;
import kr.or.ddit.service.LectureService;
import kr.or.ddit.service.StudentLectureApplyService;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/student/lectureApply")
@Slf4j
@Controller
public class StudentLectureApplyController {

	@Autowired
	LectureService lectureService;
	@Autowired
	DepartmentService departmentService;
	@Autowired
	StudentLectureApplyService studentLectureApplyService;
	
	
	@PreAuthorize("hasAnyRole('ROLE_STUDENT','ROLE_ADMIN')")
	@GetMapping("/list")
	public String lectureList(Model model, HttpServletRequest req) {
		
		List<Lecture> lectureList = this.lectureService.lectureSearch(null);
		List<Department> departmentList = this.departmentService.departmentList();
		Integer stuNo = (Integer)req.getSession().getAttribute("no");
		
		model.addAttribute("lectureList",lectureList);
		model.addAttribute("departmentList",departmentList);
		model.addAttribute("stuNo",stuNo.toString());
		
		return "student/lectureApply/lectureList";
	}
	
	@ResponseBody
	@PostMapping("/apply")
	public String lectureApply(@RequestBody StudentLecture studentLecture) {
		
		int result = this.studentLectureApplyService.apply(studentLecture);
		
		return result + "";
	}
	
	@ResponseBody
	@GetMapping("/completeApplyList")
	public List<Lecture> completeApplyList(StudentLecture studentLecture){
		
		  
		return null;
		
	}
	
	
} 
