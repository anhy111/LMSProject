package kr.or.ddit.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.LecData;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.StudentTest;
import kr.or.ddit.domain.StudentTestDetail;
import kr.or.ddit.domain.Test;
import kr.or.ddit.service.LectureBoardService;
import kr.or.ddit.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/lectureBoard")
public class LectureBoardController {
	@Autowired
	LectureBoardService lectureBoardService;
	@Autowired
	FileUploadUtil fileUploadUtil;

	//게시판 리스트
	@GetMapping("/data/lectureData")
	public ModelAndView dataList(ModelAndView mav, String keyWord, String category, String lecaCd) {
		Lecture lecture = this.lectureBoardService.dataList(keyWord, category, lecaCd);
		
		try {
			List<LecData> lecData = lecture.getLecDataList();
			mav.addObject("lecData", lecData);
			mav.addObject("lecture", lecture);
			mav.setViewName("lectureBoard/data/lectureData");
			
		}catch (Exception e) {
			mav.setViewName("lectureBoard/data/lectureData");
			return mav;
		}


		return mav;
	}
	//게시물 상세
	@GetMapping("/data/dataDetail")
	public ModelAndView dataDetail(ModelAndView mav,String ldtCd) {
		LecData lecData =  this.lectureBoardService.dataDetail(ldtCd);
		
		mav.addObject("lecData", lecData);
		mav.setViewName("lectureBoard/data/dataDetail");
		return mav;
	}
	
	//게시물 수정
	@PostMapping("data/dataUpdate")
	public String updateData(@RequestParam MultipartFile[] files, @ModelAttribute LecData lecData) {
		int result = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (files[0].getSize() > 0) {
			result = this.fileUploadUtil.fileUploadAction(files);
			if (result > 0) {
				map.put("result", result);
				map.put("ldtTtl",lecData.getLdtTtl());
				map.put("ldtCon",lecData.getLdtCon() );
				map.put("ldtWriter", lecData.getLdtWriter());
				map.put("ldtCd", lecData.getLdtCd());
				this.lectureBoardService.dataUpdate(map);
			}
			return "redirect:/lectureBoard/data/dataDetail?lecaCd=" + lecData.getLecaCd() + "&&ldtCd=" +lecData.getLdtCd();
		}
		map.put("result", result);
		map.put("result", result);
		map.put("ldtTtl",lecData.getLdtTtl());
		map.put("ldtCon",lecData.getLdtCon() );
		map.put("ldtWriter", lecData.getLdtWriter());
		map.put("ldtCd", lecData.getLdtCd());
		this.lectureBoardService.dataUpdate(map);

		return "redirect:/lectureBoard/data/dataDetail?lecaCd=" + lecData.getLecaCd() + "&&ldtCd=" +lecData.getLdtCd();
	}
	
	//게시물 삭제
	@GetMapping("data/dataDelete")
	public String deleteData(String ldtCd,String lecaCd) {
		this.lectureBoardService.dataDelete(ldtCd);
		return "redirect:/lectureBoard/data/lectureData?lecaCd=" + lecaCd;
	}

	@GetMapping("data/dataInsert")
	public String insertData(String lecaCd) {
		return "lectureBoard/data/dataInsert";
	}
	@PostMapping("data/dataInsert")
	public String insertData2(@RequestParam MultipartFile[] files,LecData lecData, Principal principal, String lecaCd) {

		String empNo = principal.getName();
		lecData.setLecaCd(Integer.parseInt(lecaCd));
		
		Map<String, Object> map =  new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("ldtTtl", lecData.getLdtTtl());
		map.put("ldtCon", lecData.getLdtCon());
		map.put("lecaCd", lecData.getLecaCd());
		
		if (files[0].getSize() > 0) {
			this.lectureBoardService.dataInsert1(map);
			this.fileUploadUtil.fileUploadAction(files);
		} else {
			this.lectureBoardService.dataInsert2(map);
		}
		Integer ldtCd = (Integer) map.get("ldtCd");

		return "redirect:/lectureBoard/data/dataDetail?lecaCd=" + lecData.getLecaCd() + "&&ldtCd=" +ldtCd;
	}
	
	//시험 홈
	@GetMapping("/test/test")
	public String testHome(Model model,String lecaCd) {
		List<Test> test = this.lectureBoardService.testList(lecaCd);
		LecApply lecApply = this.lectureBoardService.lecApplySearch(lecaCd);
		model.addAttribute("data", lecApply);
		model.addAttribute("list", test);
		
		return "lectureBoard/test/test";
	}
	// 학생 퀴즈 리스트
	@GetMapping("/test/studentTest")
	public String studentTest(@RequestParam("lecaCd") String lecaCd, Model model, Principal cipal) {
		
		LecApply lec = this.lectureBoardService.lecApplySearch(lecaCd);
		List<Test> testList = this.lectureBoardService.testList(lecaCd);
		
		String memCd = cipal.getName();
		log.info(memCd);
		
		
		log.info("testList : " + testList);
		for (Test test : testList) {
			log.info("하하하 : " + test );
		}
		model.addAttribute("memId", memCd);
		model.addAttribute("data", lec);
		model.addAttribute("list", testList);
		
		return "lectureBoard/test/studentTest";
	}
	//시험 제출 체크
	@GetMapping("test/submitCheck")
	public String checkSubmit(Principal cipal,String lecaCd,String testCd) {
		String stuNo = cipal.getName();
		if(this.lectureBoardService.submitCheck(stuNo, lecaCd, testCd) != null) {
			Test test = this.lectureBoardService.submitCheck(stuNo, lecaCd, testCd);
			int stCd = test.getStuTest().getStCd();
			return "redirect:/lectureBoard/test/testResult?stCd="+stCd;
		}
		return "redirect:/lectureBoard/test/studentTestDetail?testCd="+ testCd;
	}
	
	//시험 추가 페이지
	@PostMapping("/test/testRegistPage")
	public String testRegistPage() {
		return "lectureBoard/test/testRegistPage";
	}

	//시험 추가, 시험 문제 추가
	@PostMapping("test/testRegist")
	public String registTest(Model model, @ModelAttribute @Param("test") Test test) {
		
		this.lectureBoardService.testInsert(test);
		log.info(test.toString());
		
		return "redirect:/lectureBoard/test/test?lecaCd="+test.getLecaCd();
	}
	
	//시험 디테일(교수)
	@GetMapping("test/testDetail")
	public String DetailTest(Model model,String testCd, String lecaCd) {
		
		Test data = this.lectureBoardService.testDetail(testCd);
		log.info(data.toString());
		model.addAttribute("data", data);
		
		return "lectureBoard/test/testDetail";
	}
	//시험 디테일(학생)
	@GetMapping("test/studentTestDetail")
	public String DetailTest1(Model model,String testCd, String lecaCd,Principal cipal,HttpSession session,HttpServletRequest request) {
	
		Test data = this.lectureBoardService.testDetail(testCd);
		data.getStuTest().setStuNo(Integer.parseInt(cipal.getName()));
		
		log.info("Test : "+data.toString());
		
		model.addAttribute("data", data);
	
		return "lectureBoard/test/studentTestDetail";
	}
	
	//시험 삭제
	@PostMapping("test/testDelete")
	public String deleteTest(String testCd,String lecaCd) {
		this.lectureBoardService.testDelete(testCd);
		return "redirect:/lectureBoard/test/test?lecaCd="+lecaCd;
	}
	// 학생 시험 제출
	@PostMapping("test/testPost")
//	@GetMapping("test/testPost")
	public String stuTestInsertPost(int stuNo, StudentTest stuTest) {
		log.info("==============================================================");
		log.info("stuTest 인서트 전 >> " + stuTest.toString());
		this.lectureBoardService.stuTestInsert(stuTest);
		log.info("stuTest 인서트 후 >> "+stuTest.toString());
		log.info("==============================================================");
		List<StudentTestDetail> list = stuTest.getStdList();
		for(int i = 0; i <list.size();i++) {
			list.get(i).setStCd(stuTest.getStCd());
		}
		log.info("sdtList : "+list.toString());
		log.info("==============================================================");
		
		int result = this.lectureBoardService.insertStdList(list);
		
		
		return "redirect:/lectureBoard/test/testResult?stCd=" + stuTest.getStCd() + "&&lecaCd=" + stuTest.getLecaCd();
	}

	@GetMapping("test/testResult")
	public String testResultGet(String stCd, String lecaCd,Model model,Principal cipal) {
		
		Test data = this.lectureBoardService.stuTestDetail(stCd);
		log.info("데이터 : "+data.toString());
		
		
		model.addAttribute("data", data);
		
		return "lectureBoard/test/testResult";
	}
	
	
	
	

}
