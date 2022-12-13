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
	public String stuManage(Model model, HttpServletRequest req) {

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
	public int updateStu(MultipartFile uploadFile, Student stu, HttpServletRequest req) {

		log.info("uploadFile : " + uploadFile + " 이렇게도 오나 혹싀 ~ㅎ " + stu.getStuNo());

		// 업로드 폴더 설정
		String uploadFolder = req.getRealPath("\\") + "\\resources\\upload" + "\\";

		// 연월일 폴더 생성
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload Path : " + uploadPath);

		// 만약 연/월/일 해당 폴더가 없으면 생성
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		// 원래 파일명
		String uploadFileName = "";

		// 파일 배열로부터 파일을 하나씩 가져와보자.
		// MultipartFile[] uploadFile
//		for (MultipartFile uploadFile : uploadFile) {
			log.info("-----------------");
			log.info("upload File Name : " + uploadFile.getOriginalFilename());
			log.info("upload File Size :" + uploadFile.getSize());
			// 개똥이.jpg
			uploadFileName = uploadFile.getOriginalFilename();

			// 같은 날 같은 이미지 업로드 시 파일 중복 방지 시작----------------
			// java.util.UUID => 랜덤값 생성
			UUID uuid = UUID.randomUUID();
			// 원래의 파일 이름과 구분하기 위해 _를 붙임(sdafjasdlfksadj_개똥이.jpg)
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			// 같은 날 같은 이미지 업로드 시 파일 중복 방지 끝----------------

			// File객체 설계(복사할 대상 경로, 파일명)
			// uploadPath : C:\\eGovFrameDev-3.10.0-64bit\\workspace
			// \\egovProj\\src\\main\\webapp\\resources\\upload\\2022\\11\\16
			File saveFile = new File(uploadPath, uploadFileName);

			try {
				// 파일 복사 실행
				uploadFile.transferTo(saveFile);

				// 썸네일 처리
				// 이미지인지 체킹
				if (checkImageType(saveFile)) {// 이미지라면
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					// 썸네일 생성
					Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}

				String filename = "/" + getFolder().replace("\\", "/") + "/" + uploadFileName;
				log.info("filename : " + filename);

				stu.setStuPic(filename);

			} catch (IllegalStateException e) {
				log.error(e.getMessage());
				return 0;
			} catch (IOException e) {
				log.error(e.getMessage());
				return 0;
			} // end try
//		} // end for

		int file = this.manageService.updateStu(stu);
		
		log.info("됐다고 해주라,, " + file);

		return file;
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

}
