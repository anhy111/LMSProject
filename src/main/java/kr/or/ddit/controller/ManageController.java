package kr.or.ddit.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.domain.College;
import kr.or.ddit.domain.CommonDetail;
import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.Student;
import kr.or.ddit.service.CollegeService;
import kr.or.ddit.service.CommonDetailService;
import kr.or.ddit.service.DepartmentService;
import kr.or.ddit.service.ManageService;
import kr.or.ddit.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@PreAuthorize("hasRole('ROLE_MANAGER')")
@Controller
public class ManageController {

	@Autowired
	ManageService manageService;
	@Autowired
	CommonDetailService commonDetailService;
	@Autowired
	CollegeService collegeService;
	@Autowired
	FileUploadUtil fileUploadUtil;
	@Autowired
	DepartmentService departmentService;

	@GetMapping("/manage/stuManage")
	public String stuManage(Model model) {

		List<Student> studentList = this.manageService.studentList();
		List<CommonDetail> commonDetailList = this.commonDetailService.commonDetailList("BANK");
		log.info("list 잘 들어오나 ?! " + studentList);
		List<College> collegeList = this.collegeService.CollegeList();

		model.addAttribute("list", studentList);
		model.addAttribute("commonDetailList", commonDetailList);
		model.addAttribute("collegeList", collegeList);

		return "manage/stuManage";
	}

	@PostMapping("/manage/detailStu")
	@ResponseBody
	public Student detailStu(@RequestBody Map<String, String> map) {

		log.info("detailStu는?? " + map.get("detailStu"));

		Student detailStu = this.manageService.detailStu(map);

		log.info("다시온 detailStu!! " + detailStu);

		return detailStu;
	}

	@PostMapping("/manage/deleteStu")
	@ResponseBody
	public int deleteStu(@RequestBody Map<String, String> map) {

		log.info("delete의 stuNo는?? " + map.get("stuNo"));

		int deleteStu = this.manageService.deleteStu(map);
		this.manageService.deleteMemStu(map);

		log.info("삭제되었을 거라고 믿어의심치 않는다 . " + deleteStu);

		return deleteStu;
	}

	@PostMapping("/manage/updateStu")
	@ResponseBody
	public Student updateStu(MultipartFile uploadFile, Student stu, HttpServletRequest req, Map<String, String> map) {

		log.info("uploadFile : " + uploadFile + " 이렇게도 오나 혹싀 ~ㅎ " + stu.getStuNo());

		this.fileUploadUtil.stuFileUpload(uploadFile, req, stu);
		
		map.put("detailStu", stu.getStuNo()+"");
		Student detailStu = this.manageService.detailStu(map);

		return detailStu;
	}

	
	@GetMapping("/manage/insertStu")
	public String insertStu(Model model) {
		
		List<CommonDetail> commonDetailList = this.commonDetailService.commonDetailList("BANK");
		List<College> collegeList = this.collegeService.CollegeList();
		
		model.addAttribute("commonDetailList", commonDetailList);
		model.addAttribute("collegeList", collegeList);
		
		return "manage/insertStu";
	}
	
	
	
	@GetMapping("/manage/recordManage")
	public String academicStatus(Model model) {
		
		return "manage/recordManage";
	}
	
	@GetMapping("/manage/recordList")
	@ResponseBody
	public List<Student> list(){
		
		List<Student> recordManage = this.manageService.recordManage();
		
		return recordManage;
	}
	
	@PostMapping("/manage/recordManagePost")
	@ResponseBody
	public Student recordManagePost(@RequestBody Map<String, String> map) {
		
		log.info("데이터 넘어오나 ! " + map.get("stuNo"));
		
		Student recordManagePost = this.manageService.recordManagePost(map);
		
		return recordManagePost;
	}
	
	@PostMapping("/manage/yesOrNo")
	@ResponseBody
	public Student approval(@RequestBody Map<String, String> map) {
		
		log.info("map 잘 넘어오나? " + map.get("stuNo") + map.get("Yn") + map.get("recRej"));
		int yesOrNo = this.manageService.yesOrNo(map);
		
		Student recordManagePost = this.manageService.recordManagePost(map);
		
		return recordManagePost;
	}
	
	//교수관리 시작헌다...
	
	@GetMapping("/manage/insertEmp")
	public String insertEmp(Model model) {
		
		List<CommonDetail> bank = this.commonDetailService.commonDetailList("BANK");
		List<CommonDetail> division =this.commonDetailService.commonDetailList("DIVISION");
		List<CommonDetail> ePosition =this.commonDetailService.commonDetailList("E_POSITION");
		List<CommonDetail> pPosition =this.commonDetailService.commonDetailList("P_POSITION");
		List<College> collegeList = this.collegeService.CollegeList();
		Member createEmpId = this.manageService.createEmpId();
		
		log.info("memId 만들어졌나 ?!" + createEmpId.getMemNo());
		
		model.addAttribute("bank", bank);
		model.addAttribute("division", division);
		model.addAttribute("ePosition", ePosition);
		model.addAttribute("pPosition", pPosition);
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("empId", createEmpId);
		
		
		return"manage/insertEmp";
	}
	
	@PostMapping("/manage/insertEmpPost")
	public String insertEmpPost(MultipartFile file, HttpServletRequest req, @ModelAttribute Employee employee) {
		
		log.info("employee 들어오낫 ? " + employee.toString());
		log.info("이게 아닌가효 ? "+ employee.getEmpPos());
		log.info("multipartFiles 넘어와라" + file);
		
		this.manageService.createMember(employee);
		this.fileUploadUtil.empFileUpload(file, req, employee);
		
		if(employee.getEmpPos().equals("E_POS007") || employee.getEmpPos().equals("E_POS008")) {
			log.info("실행되는고냐");
			this.manageService.createProfessor(employee);
		}
		
		return "redirect:/manage/insertEmp";
	}
	
	@GetMapping("/manage/empManage")
	public String empManage(Model model) {
		
		List<Employee> employeeList = this.manageService.employeeList();
		List<CommonDetail> bank = this.commonDetailService.commonDetailList("BANK");
		List<CommonDetail> division =this.commonDetailService.commonDetailList("DIVISION");
		List<CommonDetail> ePosition =this.commonDetailService.commonDetailList("E_POSITION");
		List<CommonDetail> pPosition =this.commonDetailService.commonDetailList("P_POSITION");
		List<College> collegeList = this.collegeService.CollegeList();
		
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("bank", bank);
		model.addAttribute("division", division);
		model.addAttribute("ePosition", ePosition);
		model.addAttribute("pPosition", pPosition);
		model.addAttribute("collegeList", collegeList);
		
		return "manage/empManage";
	}
	
	@PostMapping("/manage/detailEmp")
	@ResponseBody
	public Employee detailEmp(@RequestBody Map<String, String> map) {
		
		log.info("empNo 넘어올까 " +  map.get("empNo"));
		
		Employee detailEmp = this.manageService.detailEmp(map);
		
		return detailEmp;
	}
	
	@PostMapping("/manage/deleteEmp")
	@ResponseBody
	public int deleteEmp(@RequestBody Map<String, String> map) {
		
		log.info("교번 넘어오냐? " + map.get("empNo"));
		
		this.manageService.deletePro(map);
		int deleteEmp = this.manageService.deleteEmp(map);
		this.manageService.deleteMemEmp(map);
		
		return deleteEmp;
	}
	
	@PostMapping("/manage/updateEmp")
	@ResponseBody
	public Employee updateEmp(MultipartFile uploadFile, Employee emp, HttpServletRequest req, Map<String, String> map) {

		log.info("uploadFile : " + uploadFile + " 이렇게도 오나 혹싀 ~ㅎ " + emp.getEmpNo());
		log.info("emp : " + emp + "req : " + req + "map : " + map);
		this.fileUploadUtil.empFileUpdate(uploadFile, req, emp);
		
		map.put("empNo", emp.getEmpNo()+"");
		
		Employee detailEmp = this.manageService.detailEmp(map);

		return detailEmp;
	}
	

}
