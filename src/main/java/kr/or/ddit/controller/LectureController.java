package kr.or.ddit.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
@PreAuthorize("hasAnyRole('ROLE_PROFESSOR', 'ROLE_STUDENT', 'ROLE_MANAGER')")
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

		String[] color = {"#C8707E", "#E28FAD", "#E58E58", "#5AA08D", "#A8C879", "#AC99C1", "#96B1D0", "#C08863"};
		
		mav.addObject("color", color);
		mav.addObject("lecture", list);
		mav.setViewName("lecture/myLecture");

		return mav;
	}

	@GetMapping("/lectureBoard/board/lectureBoard")
	public String test2() {
		return "lectureBoard/board/lectureBoard";
	}

	@GetMapping("/lectureBoard/task/subjectList")
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
		mav.setViewName("lectureBoard/task/subjectList");
		return mav;
	}

	@GetMapping("/lectureBoard/task/registTask")
	public String registTask() {
		return "lectureBoard/task/registTask";
	}

	@PostMapping("/lectureBoard/task/registTask")
	public String registTask2(@RequestParam MultipartFile[] files, Task task) {
		if (files[0].getSize() > 0) {
			this.fileUploadUtil.fileUploadAction(files);

			this.lectureservice.insertTask(task);
		} else {
			log.info("첨부파일 없어용");
			this.lectureservice.insertTask2(task);
		}
		log.info(task.toString());

		return "redirect:/lectureBoard/task/taskDetail?lecaCd=" + task.getLecaCd() + "&&taskCd=" + task.getTaskCd();
	}

	@GetMapping("/lectureBoard/task/taskDetail")
	public ModelAndView taskDetail(ModelAndView mav, @RequestParam String lecaCd, @RequestParam String taskCd) {
		log.info("과제 상세정보=========================================================");
		log.info("taskCd : " + taskCd);
		log.info("lecaCd : " + lecaCd);
		Task task = this.lectureservice.detailTask(taskCd, lecaCd);
		log.info(task + "==============================================");

		mav.addObject("task", task);
		mav.setViewName("lectureBoard/task/taskDetail");
		return mav;

	}

	@GetMapping("/lectureBoard/task/taskDelete")
	public String taskDelete(@RequestParam String lecaCd, @RequestParam String taskCd) {
		log.info(lecaCd);
		this.lectureservice.deleteTask(lecaCd, taskCd);
		return "redirect:/lectureBoard/task/subjectList?lecaCd=" + lecaCd;
	}

	// 과제
	// 수정============================================================================================================================
	@PostMapping("/lectureBoard/task/taskUpdate")
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
				map.put("taskScore", task.getTaskScore());
				map.put("taskCd", task.getTaskCd());
				map.put("lecaCd", task.getLecaCd());
				this.lectureservice.taskUpdate(map);
			}

			return "redirect:/lectureBoard/task/taskDetail?lecaCd=" + task.getLecaCd() + "&&taskCd=" + task.getTaskCd();
		}
		map.put("result", result);
		map.put("taskNm", task.getTaskNm());
		map.put("taskCon", task.getTaskCon());
		map.put("taskEdt", task.getTaskEdt());
		map.put("taskCd", task.getTaskCd());
		map.put("taskScore", task.getTaskScore());
		map.put("lecaCd", task.getLecaCd());
		this.lectureservice.taskUpdate(map);

		return "redirect:/lectureBoard/task/taskDetail?lecaCd=" + task.getLecaCd() + "&&taskCd=" + task.getTaskCd();

	}

	// 과제 제출
	// 목록============================================================================================================================
	@GetMapping("/lectureBoard/task/taskSubmitList")
	public ModelAndView taskSubmitList(Principal principal, ModelAndView mav, @RequestParam String taskCd,@RequestParam String lecaCd) {
		String stuNo = principal.getName();
		List<Task> list = this.lectureservice.taskSubmitList(taskCd);
		log.info("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" + list);
		TaskSubmit taskSubmit = new TaskSubmit();
		taskSubmit.setLecaCd(Integer.parseInt(lecaCd));
		taskSubmit.setStuNo(Integer.parseInt(stuNo));
		taskSubmit.setTaskCd(Integer.parseInt(taskCd));
		TaskSubmit ts =  this.lectureservice.stuSubmitCheck(taskSubmit);
		mav.addObject("list", list);
		mav.addObject("stuNo", stuNo);
		mav.addObject("ts", ts);
		mav.setViewName("lectureBoard/task/taskSubmitList");
		return mav;
	}
	
	

	@GetMapping("/lectureBoard/task/submitTask")
	public ModelAndView submitTask(ModelAndView mav, @RequestParam String lecaCd, @RequestParam String taskCd) {

		Task task = this.lectureservice.detailTask(taskCd, lecaCd);
		mav.addObject("task", task);
		mav.setViewName("lectureBoard/task/submitTask");
		return mav;
	}

	@PostMapping("/lectureBoard/task/submitTask")
	public String submitTask2(Principal principal, @RequestParam MultipartFile[] files, TaskSubmit taskSubmit) {
		log.info("과제 제출");
		int stuNo = Integer.parseInt(principal.getName());
		taskSubmit.setStuNo(stuNo);
		int lecaCd = taskSubmit.getLecaCd();
		int taskCd = taskSubmit.getTaskCd();
		log.info(taskSubmit.toString());
		log.info(files.length+"sssssssssssssssssssssssssss");
		if (files.length > 0) {
			log.info("첨부파일 있다.");
			this.fileUploadUtil.fileUploadAction(files);
//
			this.lectureservice.insertTaskSubmit1(taskSubmit);
		} else {
			log.info("첨부파일 없어용");
			this.lectureservice.insertTaskSubmit2(taskSubmit);
		}

		return "redirect:/lectureBoard/task/taskSubmitList?lecaCd=" + lecaCd + "&&taskCd=" + taskCd;
	}

	@GetMapping("/lectureBoard/task/taskSubmitDetail")
	public ModelAndView taskSubmitDetail(ModelAndView mav, @RequestParam String tsubCd) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = 1;
		map.put("result", result);
		map.put("tsubCd", tsubCd);
		Task task = this.lectureservice.submitDetail(map);
		if (task == null) {
			result = 0;
			map.put("result", result);
			map.put("tsubCd", tsubCd);
			task = this.lectureservice.submitDetail(map);
			mav.addObject("task", task);
			mav.setViewName("lectureBoard/task/taskSubmitDetail");
			log.info(task.toString());
			return mav;
		}
		log.info(task.toString());
		mav.addObject("task", task);
		mav.setViewName("lectureBoard/task/taskSubmitDetail");
		return mav;
	}

	// 제출 과제 수정
	@PostMapping("/lectureBoard/task/taskSubmitUpdate")
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

			return "redirect:/lectureBoard/task/taskSubmitDetail?tsubCd=" + tsubCd;
		}
		map.put("result", result);
		map.put("tsubCon", tsubCon);
		map.put("tsubCd", tsubCd);
		this.lectureservice.taskSubmitUpdate(map);

		return "redirect:/lectureBoard/task/taskSubmitDetail?tsubCd=" + tsubCd;
	}

	@ResponseBody
	@PostMapping("/lectureBoard/task/tsubScoreUpdate")
	public int tsubScoreUpdate(@RequestBody TaskSubmit tasksubmit) {

		log.info("tsubCd:   " + tasksubmit.getTsubCd());
		log.info("tsubScore:   " + tasksubmit.getTsubScore());

		int result = this.lectureservice.scoreUpdate(tasksubmit);
		log.info("tsubScore:   " + tasksubmit.getTsubScore());

		return result;
	}

	@GetMapping("lectureBoard/task/submitDelete")
	public String submitDelete(@RequestParam int tsubCd) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = 1;
		map.put("result", result);
		map.put("tsubCd", tsubCd);
		Task task = this.lectureservice.submitDetail(map);
		if (task == null) {
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			result = 0;
			map1.put("result", result);
			map1.put("tsubCd", tsubCd);
			task = this.lectureservice.submitDetail(map1);
			int lecaCd = task.getLecaCd();
			int taskCd = task.getTaskCd();
			this.lectureservice.submitDelete(tsubCd);
			return "redirect:/lectureBoard/task/taskSubmitList?lecaCd=" + lecaCd + "&&taskCd=" + taskCd;
		}
		this.lectureservice.submitDelete(tsubCd);
		int lecaCd = task.getLecaCd();
		int taskCd = task.getTaskCd();
		return "redirect:/lectureBoard/task/taskSubmitList?lecaCd=" + lecaCd + "&&taskCd=" + taskCd;
	}
}