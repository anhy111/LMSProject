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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.domain.College;
import kr.or.ddit.domain.CommonDetail;
import kr.or.ddit.domain.Student;
import kr.or.ddit.service.CollegeService;
import kr.or.ddit.service.CommonDetailService;
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

	// 연/월/일 폴더 생성
	public String getFolder() {
		// 2022-11-16 형식 (format) 지정
		// 간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 날짜 객체 생성
		Date date = new Date();
		// 2022-11-16
		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	// 이미지인지 판단. 썸네일은 이미지만 가능하므로,,
	public boolean checkImageType(File file) {

		// MINE 타입 알아냄..jpeg/.jpg의 MIME타입 : image/jpeg
		String contentType;

		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);
			// image/jpeg는 image로 시작함. -> true
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 이 파일이 이미지가 아닐 경우
		return false;
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
		
		List<Student> recordManage = this.manageService.recordManage();
		
		model.addAttribute("list", recordManage);
		
		return "manage/recordManage";
	}
	

}
