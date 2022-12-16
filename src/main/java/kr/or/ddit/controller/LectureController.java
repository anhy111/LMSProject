package kr.or.ddit.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.LectureService;
import kr.or.ddit.util.FileUploadUtil;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.Task;
import kr.or.ddit.domain.TaskSubmit;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {

	@Autowired
	LectureService lectureservice;

	@Autowired
	FileUploadUtil fileUploadUtil;

	@GetMapping("/lecture/list")
	public ModelAndView lectureList(ModelAndView mav, @ModelAttribute Lecture lecture, String keyword) {

		List<Lecture> list = this.lectureservice.lectureSearch(keyword);
		log.info("====================================================");
		log.info("====================================================");
		log.info("====================================================");
		log.info("====================================================");
		log.info("====================================================");
		log.info("====================================================");
		log.info("====================================================");
		log.info("====================================================");
		log.info("====================================================");
		log.info("====================================================");
		for (Lecture lecture2 : list) {
			log.info(lecture2.toString());
		}
		mav.setViewName("lecture/list");
		mav.addObject("lecture", list);

		return mav;
	}

	@GetMapping("/lecture/myLecture")
	public ModelAndView myLecture(ModelAndView mav, @ModelAttribute Lecture lecture, String keyword,
			Principal principal) {
		String professorId = principal.getName(); // 로그인한 아이디 (세션) 가져오기
		List<Lecture> list = this.lectureservice.professorLecture(professorId);
		log.info("====================================================");
		log.info("====================================================");
		for (Lecture lecture2 : list) {
			log.info(lecture2.toString());
		}

		mav.addObject("lecture", list);
		mav.setViewName("lecture/myLecture");

		return mav;
	}

	@GetMapping("/lectureBoard/lectureBoard")
	public String test2() {
		return "lectureBoard/lectureBoard";
	}

	@GetMapping("/lectureBoard/subjectList")
	public ModelAndView subjectList(ModelAndView mav, @RequestParam String lecaCd) {
		Lecture lecture = this.lectureservice.searchTask(lecaCd);
		if (lecture != null) {
			log.info(lecture.toString());
			List<Task> taskList = lecture.getTaskList();
			for (Task task : taskList) {
				log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + task.toString());

				mav.addObject("task", task);
			}

			mav.addObject("lecture", lecture);
			mav.addObject("taskList", taskList);
		}
		mav.setViewName("lectureBoard/subjectList");
		return mav;
	}

	@GetMapping("/lectureBoard/registTask")
	public String registTask() {
		return "lectureBoard/registTask";
	}

	@PostMapping("/lectureBoard/registTask")
	public String registTask2(@RequestParam MultipartFile[] files, Task task) {
		if (files[0].getSize() > 0) {
			this.fileUploadUtil.fileUploadAction(files);

			this.lectureservice.insertTask(task);
		} else {
			log.info("첨부파일 없어용");
			this.lectureservice.insertTask2(task);
		}
		log.info(task.toString());

		return "redirect:/lectureBoard/taskDetail?lecaCd=" + task.getLecaCd() + "&&taskCd=" + task.getTaskCd();
	}

	@GetMapping("/lectureBoard/taskDetail")
	public ModelAndView taskDetail(ModelAndView mav, @RequestParam String lecaCd, @RequestParam String taskCd) {
		log.info("과제 상세정보=========================================================");
		log.info("taskCd : " + taskCd);
		log.info("lecaCd : " + lecaCd);
		Task task = this.lectureservice.detailTask(taskCd, lecaCd);
		log.info(task + "==============================================");

		mav.addObject("task", task);
		mav.setViewName("lectureBoard/taskDetail");
		return mav;

	}

	@GetMapping("/lectureBoard/taskDelete")
	public String taskDelete(@RequestParam String lecaCd, @RequestParam String taskCd) {
		log.info(lecaCd);
		this.lectureservice.deleteTask(lecaCd, taskCd);
		return "redirect:/lectureBoard/subjectList?lecaCd=" + lecaCd;
	}

	// 과제
	// 수정============================================================================================================================
	@PostMapping("/lectureBoard/taskUpdate")
	public String taskUpdate(@RequestParam MultipartFile[] files, @ModelAttribute Task task) {
		int result = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (files[0].getSize() > 0) {
			result = this.fileUploadUtil.fileUploadAction(files);
			if (result > 0) {
				map.put("result", result);
				map.put("taskNm", task.getTaskNm());
				map.put("taskCon", task.getTaskCon());
				map.put("taskEdt", task.getTaskEdt());
				map.put("taskCd", task.getTaskCd());
				map.put("lecaCd", task.getLecaCd());
				this.lectureservice.taskUpdate(map);
			}

			return "redirect:/lectureBoard/taskDetail?lecaCd=" + task.getLecaCd()+"&&taskCd="+task.getTaskCd();
		}
		map.put("result", result);
		map.put("taskNm", task.getTaskNm());
		map.put("taskCon", task.getTaskCon());
		map.put("taskEdt", task.getTaskEdt());
		this.lectureservice.taskUpdate(map);
		
		return "redirect:/lectureBoard/taskDetail?lecaCd=" + task.getLecaCd()+"&&taskCd="+task.getTaskCd();

	}

//	@ModelAttribute Task task) {
//		log.info("업데이트!!@!@!@!@!@!@!@!@!@!@!@\n" + task);
//		int taskCd = task.getTaskCd();
//		int lecaCd = task.getLecaCd();
//		log.info(lecaCd + "        " + taskCd);
//		this.lectureservice.taskUpdate(task);
//		return "redirect:/lectureBoard/taskDetail?lecaCd=" + lecaCd + "&&taskCd=" + taskCd;
//	}

	// 과제 제출
	// 목록============================================================================================================================
	@GetMapping("/lectureBoard/taskSubmitList")
	public ModelAndView taskSubmitList(ModelAndView mav, @RequestParam String taskCd) {
		List<Task> list = this.lectureservice.taskSubmitList(taskCd);
		log.info("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" + list);
		mav.addObject("list", list);
		mav.setViewName("lectureBoard/taskSubmitList");
		return mav;
	}

	@GetMapping("/lectureBoard/submitTask")
	public ModelAndView submitTask(ModelAndView mav, @RequestParam String lecaCd, @RequestParam String taskCd) {

		Task task = this.lectureservice.detailTask(taskCd, lecaCd);
		mav.addObject("task", task);
		mav.setViewName("lectureBoard/submitTask");
		return mav;
	}

	@PostMapping("/lectureBoard/submitTask")
	public String submitTask2(Principal principal, @RequestParam MultipartFile[] files, TaskSubmit taskSubmit) {
		int stuNo = Integer.parseInt(principal.getName());
		taskSubmit.setStuNo(stuNo);
		int lecaCd = taskSubmit.getLecaCd();
		int taskCd = taskSubmit.getTaskCd();
		log.info(taskSubmit.toString());
		if (files[0].getSize() > 0) {
			this.fileUploadUtil.fileUploadAction(files);
//
			this.lectureservice.insertTaskSubmit1(taskSubmit);
		} else {
			log.info("첨부파일 없어용");
			this.lectureservice.insertTaskSubmit2(taskSubmit);
		}

		return "redirect:/lectureBoard/taskSubmitList?lecaCd=" + lecaCd + "&&taskCd=" + taskCd;
	}

	@GetMapping("/lectureBoard/taskSubmitDetail")
	public ModelAndView taskSubmitDetail(ModelAndView mav, @RequestParam String tsubCd) {
		log.info("제출 과제정보=========================================================");
		Task task = this.lectureservice.submitDetail(tsubCd);
		log.info(task + "==============================================");

		mav.addObject("task", task);
		mav.setViewName("lectureBoard/taskSubmitDetail");
		return mav;
	}

	// 제출 과제 수정
	@PostMapping("/lectureBoard/taskSubmitUpdate")
	public String taskSubmitUpdate(@RequestParam MultipartFile[] files, String tsubCd, String tsubCon) {
		int result = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (files[0].getSize() > 0) {
			result = this.fileUploadUtil.fileUploadAction(files);
			if (result > 0) {
				map.put("result", result);
				map.put("tsubCon", tsubCon);
				map.put("tsubCd", tsubCd);
				this.lectureservice.taskSubmitUpdate(map);
			}

			return "redirect:/lectureBoard/taskSubmitDetail?tsubCd=" + tsubCd;
		}
		map.put("result", result);
		map.put("tsubCon", tsubCon);
		map.put("tsubCd", tsubCd);
		this.lectureservice.taskSubmitUpdate(map);

		return "redirect:/lectureBoard/taskSubmitDetail?tsubCd=" + tsubCd;
	}
	@ResponseBody
	@PostMapping("/lectureBoard/tsubScoreUpdate")
	public String tsubScoreUpdate(@Param("tsubScore") int tsubScore, @Param("tsubCd")int tsubCd) {
		log.info("tsubCd:   "+tsubCd);
		log.info("tsubScore:   "+tsubScore);
		
		this.lectureservice.scoreUpdate(tsubScore,tsubCd);
		
		return "SUCCESS";
	}

}
