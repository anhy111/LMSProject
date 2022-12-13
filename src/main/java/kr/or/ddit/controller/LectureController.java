package kr.or.ddit.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.LectureService;
import kr.or.ddit.util.FileUploadUtil;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.Task;
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
		log.info(lecture.toString());
		List<Task> taskList = lecture.getTaskList();
		for (Task task : taskList) {
			log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + task.toString());

			mav.addObject("task", task);
		}

		mav.addObject("lecture", lecture);
		mav.addObject("taskList", taskList);
		mav.setViewName("lectureBoard/subjectList");
		return mav;
	}

	@PostMapping("/lectureBoard/upload")
	public String uploadTest(MultipartFile[] files, @RequestParam String lecaCd) {
		this.fileUploadUtil.fileUploadAction(files);
		return "redirect:/lectureBoard/subjectList?lecaCd=" + lecaCd;
	}

	@GetMapping("/lectureBoard/registTask")
	public String registTask() {
		return "lectureBoard/registTask";
	}

	@PostMapping("/lectureBoard/registTask")
	public String registTask2(@RequestParam MultipartFile[] files, Task task) {
		log.info(task.toString());
		if (files[0].getSize() > 0) {
			log.info("첨부파일 있어요");
			this.fileUploadUtil.fileUploadAction(files);
			this.lectureservice.insertTask(task);
		} else {
			log.info("첨부파일 없어용");
			this.lectureservice.insertTask2(task);
		}
		log.info(task.toString());

		return "redirect:/lectureBoard/taskDetail?lecaCd="+task.getLecaCd()+"&&taskCd="+task.getTaskCd();
	}

	@GetMapping("/lectureBoard/taskDetail")
	public ModelAndView taskDetail(ModelAndView mav, @RequestParam String lecaCd, @RequestParam String taskCd) {
		log.info("과제 상세정보=========================================================");
		log.info("taskCd : "+taskCd);
		log.info("lecaCd : "+lecaCd);
		Task task = this.lectureservice.detailTask(taskCd, lecaCd);
		log.info(task+"==============================================");
		
		mav.addObject("task", task);
		mav.setViewName("lectureBoard/taskDetail");
		return mav;
		
	}
	
	@GetMapping("/lectureBoard/taskDelete")
	public String taskDelete(@RequestParam String lecaCd,@RequestParam String taskCd) {
		log.info(lecaCd);
		this.lectureservice.deleteTask(lecaCd,taskCd);
		return "redirect:/lectureBoard/subjectList?lecaCd="+lecaCd; 
	}
}
