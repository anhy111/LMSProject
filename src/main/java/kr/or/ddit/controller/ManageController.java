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
import javax.servlet.http.HttpSession;

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
import kr.or.ddit.domain.Evaluation;
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
	public String stuManage(Model model, @RequestParam(value="viewPage", required = false, defaultValue = "1") int viewPage) {
		
		int stuPaging = this.manageService.stuPaging();
		int totalPage = (int) Math.ceil((double)stuPaging/10);
		model.addAttribute("totalPage", totalPage);

		List<Student> studentList = this.manageService.studentList(viewPage);
		List<CommonDetail> commonDetailList = this.commonDetailService.commonDetailList("BANK");
		log.info("list 잘 들어오나 ?! " + studentList);
		List<College> collegeList = this.collegeService.CollegeList();

		model.addAttribute("list", studentList);
		model.addAttribute("commonDetailList", commonDetailList);
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("bodyTitle", "학생 목록 조회");
		
		return "manage/stuManage";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_MANAGER', 'ROLE_PROFESSOR')")
	@PostMapping("/manage/stuSearch")
	@ResponseBody
	public List<Student> stuSearch(@RequestBody Map<String, String> map, Model model) {
		
		List<Student> stuSearch = this.manageService.stuSearch(map);
		log.info("휴 어떻게 온담" + stuSearch);
		
		int stuPaging = this.manageService.stuPaging();
		int totalPage = (int) Math.ceil((double)stuPaging/10);
		model.addAttribute("totalPage", totalPage);
		
		return stuSearch;
		
	}

	@PreAuthorize("hasAnyRole('ROLE_PROFESSOR', 'ROLE_MANAGER')")
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
		model.addAttribute("bodyTitle", "학생 등록");
		
		return "manage/insertStu";
	}
	
	
	@GetMapping("/manage/recordManage")
	public String recordManage(Model model) {
		
		model.addAttribute("bodyTitle", "학적 관리");
		
		return "manage/recordManage";
	}
	
	@PostMapping("/manage/recordSearch")
	@ResponseBody
	public List<Student> recordSearch(@RequestBody Map<String, String> map){
		
		List<Student> recordSearch = this.manageService.recordSearch(map);
		
		return recordSearch;
		
	}
	
	@PostMapping("/manage/recordManagePost")
	@ResponseBody
	public Student recordManagePost(@RequestBody Map<String, String> map) {
		
		log.info("데이터 넘어오나 ! " + map.get("recCd"));
		
		Student recordManagePost = this.manageService.recordManagePost(map);
		
		return recordManagePost;
	}
	
	@PostMapping("/manage/yesOrNo")
	@ResponseBody
	public Student approval(@RequestBody Map<String, String> map) {
//		log.info("학적코두 : " + map.get("rgbCd") + "학번 : "+ map.get("stuNo") );
		if(map.get("rgbCd") == "복학") map.put("rgbCd","재학");
		
		log.info("map 잘 넘어오나? " +map.get("rgbCd")+map.get("recCd")+ map.get("stuNo") + map.get("Yn") + map.get("recRej"));
		int yesOrNo = this.manageService.yesOrNo(map);
		int updateStudentRecord = this.manageService.updateStudentRecord(map);
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
		model.addAttribute("bodyTitle", "교직원 등록");
		
		
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
		
		return "redirect:/manage/empManage";
	}
	
	@GetMapping("/manage/empManage")
	public String empManage(Model model, @RequestParam(value="viewPage", required = false, defaultValue = "1") int viewPage) {
		
		int empPaging = this.manageService.empPaging();
		int totalPage = (int) Math.ceil((double)empPaging/10);
		model.addAttribute("totalPage", totalPage);
		
		List<Employee> employeeList = this.manageService.employeeList(viewPage);
		List<CommonDetail> bank = this.commonDetailService.commonDetailList("BANK");
		List<CommonDetail> division =this.commonDetailService.commonDetailList("DIVISION");
		List<CommonDetail> ePosition =this.commonDetailService.commonDetailList("E_POSITION");
		List<CommonDetail> pPosition =this.commonDetailService.commonDetailList("P_POSITION");
		List<College> collegeList = this.collegeService.CollegeList();
		
		log.info("employeeList?? " + employeeList);
		log.info("viewPage?? " + viewPage);
		
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("bank", bank);
		model.addAttribute("division", division);
		model.addAttribute("ePosition", ePosition);
		model.addAttribute("pPosition", pPosition);
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("bodyTitle", "교직원 목록 조회");
		
		return "manage/empManage";
	}
	
	@PostMapping("/manage/detailEmp")
	@ResponseBody
	public Employee detailEmp(@RequestBody Map<String, String> map) {
		
		log.info("empNo 넘어올까 " +  map.get("empNo"));
		
		Employee detailEmp = this.manageService.detailEmp(map);
		
		log.info("교수 상세 : " + detailEmp);
		
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
	
	@GetMapping("/manage/proEvaluation")
	public String proEvaluation(Model model) {
		
		List<Evaluation> evaluationList = this.manageService.evaluationList();
		
		model.addAttribute("evaluationList", evaluationList);
		model.addAttribute("bodyTitle", "강의 평가 조회");
		
		return "manage/proEvaluation";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_PROFESSOR', 'ROLE_MANAGER')")
	@PostMapping("/manage/evaluationCon")
	@ResponseBody
	public Evaluation evaluationCon(@RequestBody Map<String, String> map) {
		
		Evaluation evaluationCon = this.manageService.evaluationCon(map);
		log.info("잘들어오나 ㅠ " + evaluationCon.getEvlEtcList());
		
		return evaluationCon;
	}
	
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/professor/mineEvaluation")
	public String mineEvaluation(HttpSession session, Model model) {
		
		String no = String.valueOf(session.getAttribute("no"));
		log.info("memNo는 ?? " + no);
		
		List<Evaluation> mineEvlList = this.manageService.mineEvlList(no);
		
		model.addAttribute("mineEvlList", mineEvlList);
		model.addAttribute("bodyTitle", "강의 평가 조회");
		
		return "professor/mineEvaluation";
	}
	
}
