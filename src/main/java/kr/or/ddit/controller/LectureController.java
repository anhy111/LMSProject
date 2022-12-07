package kr.or.ddit.controller;

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
	public ModelAndView test(ModelAndView mav, @ModelAttribute Lecture lecture) {
		
		List<Lecture> list = this.lectureservice.lectureSearch();
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

	

}
