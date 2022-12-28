package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.College;
import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.service.CollegeService;
import kr.or.ddit.service.DepartmentService;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/department")
@Slf4j
@Controller
public class DepartmentController {
	
	@Autowired
	CollegeService collegeService;
	@Autowired
	DepartmentService departmentService;
	
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@GetMapping("/list")
	public String list(Model model) {
		
		List<College> collegeList = this.collegeService.CollegeList();
		List<Department> departments = this.departmentService.departmentByCollegeList(0);
		model.addAttribute("collegeList",collegeList);
		model.addAttribute("departmentList",departments);
		model.addAttribute("bodyTitle","학과조회");
		
		return "department/departmentList";
	}
	
	@GetMapping("/professorList")
	public String professorList() {
		return "department/notile/professorList";
	}
	
	@GetMapping("/employeeList")
	public String employeeList() {
		return "department/notile/employeeList";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
		List<College> collegeList = this.collegeService.CollegeList();
		model.addAttribute("collegeList",collegeList);
		model.addAttribute("bodyTitle","학과등록");
		return "department/register";
	}
	
	@PostMapping("/register")
	public String registerPost(Department department) {
		
		log.info("department : " + department);
		this.departmentService.register(department);
		
		return "redirect:/department/list";
	}
	
	@ResponseBody
	@GetMapping("/departmentByCollege")
	public List<Department> departmentByCollege(int colCd){
		log.info("colCd : " + colCd);
		return this.departmentService.departmentByCollegeList(colCd);
	}
	
	@ResponseBody
	@GetMapping("/departmentDetail")
	public Department departmentDetail(Department department) {
		return this.departmentService.departmentDetail(department);
	}
	
	@ResponseBody
	@GetMapping("/delete")
	public String delete(Department department) {
		return "" +this.departmentService.delete(department);
	}
	
	@ResponseBody
	@PostMapping("/update")
	public String update(@RequestBody Department department) {
		log.info("department : " + department);
		return "" + this.departmentService.update(department);
	}
	
	@ResponseBody
	@GetMapping("/nameValidation")
	public String nameValidation(String depNm) {
		return ""+this.departmentService.validationDepartmentName(depNm);
	}
	
	@ResponseBody
	@GetMapping("/searchProfessor")
	public List<Professor> searchProfessor(Department department) {
		return this.departmentService.searchProfessor(department);
	}
	
	@ResponseBody
	@GetMapping("/searchEmployee")
	public List<Employee> searchEmployee(Department department) {
		return this.departmentService.searchEmployee(department);
	}
	
}
