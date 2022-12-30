package kr.or.ddit.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.domain.Attendence;
import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.LecData;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.Student;
import kr.or.ddit.domain.StudentLecture;
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
	// 학생 시험 리스트
	@GetMapping("/test/studentTest")
	public String studentTest(@RequestParam("lecaCd") String lecaCd, Model model, Principal cipal) {
		
		LecApply lec = this.lectureBoardService.lecApplySearch(lecaCd);
		List<Test> testList = this.lectureBoardService.testList(lecaCd);
		
		String memCd = cipal.getName();
		
		
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
			return "redirect:/lectureBoard/test/testResult?stCd="+stCd+"&&lecaCd="+lecaCd;
		}
		return "redirect:/lectureBoard/test/studentTestDetail?testCd="+ testCd+"&&lecaCd="+lecaCd;
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
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
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
	
	//출결
	@GetMapping("attendence/attendence")
	public String attendence(String lecaCd, Model model) {
		LecApply lecApplySearch = this.lectureBoardService.lecApplySearch(lecaCd);
		
		model.addAttribute("data", lecApplySearch);
		
		
		return "lectureBoard/attendence/attendence";
	}
	
	@ResponseBody
	@PostMapping("studentList")
	public List<Student> listStudent(String lecaCd){
		
		List<Student> a = this.lectureBoardService.studentList(lecaCd);
						
		return a;
	}
	
	
	@ResponseBody
	@PostMapping("attendDetail")
	public HashMap<String, Object> attendDetail(String lecaCd, String stuNo) {
		//출결 상태 카운트
		Attendence detail = this.lectureBoardService.attendenceDetail(lecaCd, stuNo);
		log.info("detail : "+detail.toString());
		
		//출결 학생 이름, 학번 조회
		Attendence studentDetail = this.lectureBoardService.attenStudentDetail(lecaCd, stuNo);
		log.info("studentDetail : " + studentDetail);
		
		//한 주에 몇 번 수업인지 체크?
		List<Attendence> attenDetail = this.lectureBoardService.attendStuDetail(lecaCd, stuNo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("attendence", detail);
		map.put("studentDetail",studentDetail);
		map.put("attenDetail", attenDetail);
		
		return map;
	}
	
	@ResponseBody
	@PostMapping("attenChkCnt")
	public int attenChkCntPost(@RequestBody Attendence a) {
		Map<String, Object> map = new HashMap<String, Object>();
		log.info( " lecaCd : "+a.getLecaCd()+" stuNo : "+a.getStuNo()+" atenWk : "+a.getAtenWk()+" atenHr : "+a.getAtenHr());
		map.put("lecaCd", a.getLecaCd());
		map.put("stuNo", a.getStuNo());
		map.put("atenWk", a.getAtenWk());
		map.put("atenHr", a.getAtenHr());
		
		int result = this.lectureBoardService.attenChkCnt(map);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("attendStuInsert")
	public int attendStuInsertPost(Attendence attendence) {
		int result = this.lectureBoardService.attendStuInsert(attendence);
		return result;
	}
	
	@ResponseBody
	@PostMapping("attendStuUpdate")
	public int attendStuUpdatePost(Attendence attendence) {
		int result = this.lectureBoardService.attendStuUpdate(attendence);
		return result;
	}
	
	@GetMapping("attendence/studentAttendence")
	public String stuAttend(String lecaCd, Model model,Principal cipal) {
		LecApply lecApplySearch = this.lectureBoardService.lecApplySearch(lecaCd);
		String stuNo = cipal.getName();
		model.addAttribute("data", lecApplySearch);
		model.addAttribute("stuNo", stuNo);
		return "lectureBoard/attendence/studentAttendence";
	}
	
	
	@GetMapping("score/totalScore")
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	public String stuAttend1(Model model, String lecaCd) {
		LecApply lecApplySearch = this.lectureBoardService.lecApplySearch(lecaCd);
		model.addAttribute("data", lecApplySearch);
		log.info("a");
		return "lectureBoard/score/totalScore";
	}

	@GetMapping("score/studentList")
	@PreAuthorize("hasRole('ROLE_PROFESSOR') or hasRole('ROLE_STUDENT')")
	public String stuAttend2(Model model, String lecaCd) {

		log.info(lecaCd);
		LecApply lecApplySearch = lectureBoardService.lecApplySearch(lecaCd);
		model.addAttribute("data", lecApplySearch);
		return "lectureBoard/score/totalScore2";
	}


	//학생 성적 전체 리스트
	@PreAuthorize("hasRole('ROLE_PROFESSOR') or hasRole('ROLE_STUDENT')")
	@ResponseBody
	@PostMapping("lecStuTotScore")
	public List<Student> lecStuTotScore (@RequestBody String lecaCd) {
		log.info("lecStuTotScore ajax 도착");
		String a = lecaCd.substring(7);
		int lecaCd1 = Integer.parseInt(a);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lecaCd", lecaCd);
		
		List<Student> list = this.lectureBoardService.getGradeList(lecaCd1);
		
		log.info("list : " + list);
		
		return list;
	}
		
	// 학생 성적 상세 리스트
	@ResponseBody
	@PostMapping("lecStuScoreDetail")
	public List<Student> lecStuScoreDetail(int lecaCd, int stuNo) {
		log.info("lecStuScoreDetail ajax 도착");
		
		log.info("lecaCd : " + lecaCd + " stuNo : " + stuNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lecaCd", lecaCd);
		map.put("stuNo", stuNo);
		
		List<Student> list = this.lectureBoardService.lecStuScoreDetail(map);
		
		return list;
	}
		
	// 학생 점수 및 총 점
	@ResponseBody
	@PostMapping("stuScoreandMaxScore")	
	public Student stuScoreandMaxScore(int lecaCd, int stuNo) {
		log.info("stuScoreandMaxScore ajax 도착");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lecaCd", lecaCd);
		map.put("stuNo", stuNo);
		
		Student vo = this.lectureBoardService.getStuScoreAndMaxScore(map);
		
		return vo;
	}
		
	// 성적 부여
	@ResponseBody
	@PostMapping("stuGradeUpdate")
	public int stuGradeUpdate(StudentLecture stuLec) {
		log.info("stuGradeUpdate ajax 도착");
		
		int result = this.lectureBoardService.stuGradeUpdate(stuLec);
		
		return result;
	}
		
	
	//학생 강의 성적 상세
	@GetMapping("score/stuLecScore")
	public String stuLecScoreGet(Model model, String lecaCd,Principal cipal) {
		String stuNo = cipal.getName();
		LecApply lecApplySearch = this.lectureBoardService.lecApplySearch(lecaCd);
		model.addAttribute("data", lecApplySearch);
		model.addAttribute("stuNo", stuNo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("lecaCd", lecaCd);
		map.put("stuNo", stuNo);

		StudentLecture stuLec = this.lectureBoardService.stuLecScoreSearch(lecaCd, stuNo);
		model.addAttribute("stuLec", stuLec);

		return "lectureBoard/score/stuLecScore";
	}


}
