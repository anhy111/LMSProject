package kr.or.ddit.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.LectureService;
import kr.or.ddit.domain.Lecture;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {
	
	@Autowired
	LectureService lectureservice;
	
	@GetMapping("/lecture/list")
	public ModelAndView test(ModelAndView mav, @ModelAttribute Lecture lecture, String keyword) {
		
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
	public ModelAndView test1(ModelAndView mav, @ModelAttribute Lecture lecture, String keyword,Principal principal) {
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
	
	@GetMapping("/lecture/lectureBoard")
	public ModelAndView test2(ModelAndView mav, @ModelAttribute Lecture lecture, String keyword,Principal principal) {
		String professorId = principal.getName(); // 로그인한 아이디 (세션) 가져오기
		List<Lecture> list = this.lectureservice.professorLecture(professorId);
		log.info("====================================================");
		log.info("====================================================");
		for (Lecture lecture2 : list) {
			log.info(lecture2.toString());
		}
		
		mav.addObject("lecture", list);
		mav.setViewName("lecture/lectureBoard");
		
		return mav;
	}

}
